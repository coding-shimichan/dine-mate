"use client";

import { useRouter } from "next/navigation";

export default function LogoutButton() {
  const router = useRouter();

  const handleLogout = async () => {
    const API_URL =
      process.env.NEXT_PUBLIC_RAILS_API_URL || "http://localhost:3001";

    const csrfToken = document.cookie
      .split("; ")
      .find((row) => row.startsWith("CSRF-TOKEN="))
      ?.split("=")[1];

    try {
      const response = await fetch(`${API_URL}/users/sign_out`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken || "",
        },
        credentials: "include",
      });

      if (response.ok) {
        console.log("Logout successful");
        router.push("/users/sign_in");
      } else {
        console.error("Logout failed");
      }
    } catch (error) {
      console.error("Error logging out:", error);
    }
  };

  return (
    <button
      type="button"
      className="text-white bg-gray-700 hover:bg-gray-800 focus:ring-4 focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-gray-600 dark:hover:bg-gray-700 focus:outline-none dark:focus:ring-gray-800"
      onClick={handleLogout}
    >
      Logout
    </button>
  );
}
