"use client";

import { useRouter } from "next/navigation";
import { useForm, SubmitHandler } from "react-hook-form";

interface Inputs {
  user: {
    email: string;
    password: string;
    remember_me: boolean;
  };
  exampleRequired: string;
}

export default function LoginForm() {
  const router = useRouter();

  const {
    register,
    handleSubmit,
    formState: { errors },
  } = useForm<Inputs>();

  const onSubmit: SubmitHandler<Inputs> = async (data) => {
    const API_URL = process.env.NEXT_PUBLIC_RAILS_API_URL;

    try {
      const response = await fetch(`${API_URL}/users/sign_in`, {
        method: "post",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data),
        credentials: "include",
      });

      if (!response.ok) {
        throw new Error("Login failed");
      }

      router.push("/restaurants/search");
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <form className="max-w-sm mx-auto" onSubmit={handleSubmit(onSubmit)}>
      <div className="mb-5">
        <label
          htmlFor="user_email"
          className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
        >
          Email
        </label>
        <input
          type="email"
          id="user_email"
          // name="user[email]"
          className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          placeholder="name@dinemate.com"
          {...register("user.email", { required: "Email cannot be blank" })}
        />
        <div className="mt-1 font-semibold text-rose-500">
          {errors.user?.email?.message}
        </div>
      </div>
      <div className="mb-5">
        <label
          htmlFor="user_password"
          className="block mb-2 text-sm font-medium text-gray-900 dark:text-white"
        >
          Password
        </label>
        <input
          type="password"
          id="user_password"
          // name="user[password]"
          className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
          {...register("user.password", {
            required: "Password cannot be blank",
          })}
        />
        <div className="mt-1 font-semibold text-rose-500">
          {errors.user?.password?.message}
        </div>
      </div>
      <div className="flex items-start mb-5">
        <div className="flex items-center h-5">
          {/* <input
            // name="user[remember_me]"
            type="hidden"
            value="0"
            autoComplete="off"
            {...register("user_remember_me")}
          /> */}
          <input
            id="user_remember_me"
            // name="user[remember_me]"
            type="checkbox"
            value="1"
            className="w-4 h-4 border border-gray-300 rounded-sm bg-gray-50 focus:ring-3 focus:ring-blue-300 dark:bg-gray-700 dark:border-gray-600 dark:focus:ring-blue-600 dark:ring-offset-gray-800 dark:focus:ring-offset-gray-800"
            {...register("user.remember_me")}
          />
        </div>
        <label
          htmlFor="user_remember_me"
          className="ms-2 text-sm font-medium text-gray-900 dark:text-gray-300"
        >
          Remember me
        </label>
      </div>
      <button
        type="submit"
        id="log-in"
        className="text-white bg-blue-700 cursor-pointer hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full sm:w-auto px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800"
      >
        Log in
      </button>
    </form>
  );
}
