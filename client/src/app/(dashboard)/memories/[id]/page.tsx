import { getServerSession } from "next-auth";
import { authOptions } from "@/app/api/auth/[...nextauth]/route";

import Date from "@/app/components/date";
import Memory from "@/app/types/Memory";

export default async function MemoryPage({
  params,
}: {
  params: { id: string };
}) {
  const session = await getServerSession(authOptions);

  if (!session || !session.token) {
    return <div>You must be logged in to view your memories.</div>;
  }

  const API_URL = process.env.NEXT_PUBLIC_RAILS_API_URL;
  const memoryId: string = params.id;
  let memory: Memory;

  try {
    const response = await fetch(`${API_URL}/api/memories/${memoryId}`, {
      method: "GET",
      headers: {
        Authorization: `Bearer ${session.token}`,
        "Content-Type": "application/json",
      },
      cache: "no-store",
    });

    if (response.ok) {
      memory = await response.json();
    } else {
      return <div>Failed to fetch memories.</div>;
    }
  } catch (err) {
    return <div>An error occurred while fetching memories.</div>;
  }

  return (
    <>
      <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
        {memory.title}
      </h1>
      <div className="mb-4 text-gray-900 dark:text-white">
        <Date dateString={memory.created_at} />
      </div>
      <div className="mb-4 text-gray-900 dark:text-white">
        <p>{memory.content}</p>
      </div>
    </>
  );
}
