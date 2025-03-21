import { getServerSession } from "next-auth";
import { authOptions } from "@/app/api/auth/[...nextauth]/route";

import Card from "@/app/components/card";
import Memory from "@/app/types/Memory";

export default async function MemoryPage() {
  const session = await getServerSession(authOptions);

  if (!session || !session.token) {
    return <div>You must be logged in to view your memories.</div>;
  }

  const API_URL = process.env.NEXT_PUBLIC_RAILS_API_URL;
  let memories: Memory[] = [];

  try {
    const response = await fetch(`${API_URL}/api/memories`, {
      method: "GET",
      headers: {
        Authorization: `Bearer ${session.token}`,
        "Content-Type": "application/json",
      },
      cache: "no-store",
    });

    if (response.ok) {
      memories = await response.json();
    } else {
      return <div>Failed to fetch memories.</div>;
    }
  } catch (err) {
    return <div>An error occurred while fetching memories.</div>;
  }

  return (
    <>
      <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
        Memories
      </h1>
      <div className="grid grid-cols-3 gap-4 my-4">
        {memories.map((memory) => {
          return (
            <Card
              key={memory.id}
              mainText={memory.title}
              imageSrc={memory.mainImageSrc}
              href={`/memories/${memory.id}`}
            />
          );
        })}
      </div>
    </>
  );
}
