import Date from "@/app/components/date";
import Memory from "@/app/types/Memory";

export default async function MemoryPage() {
  const API_URL = process.env.NEXT_PUBLIC_RAILS_API_URL;
  const data = await fetch(`${API_URL}/api/memories/5`, {
    method: "GET",
    headers: {
      Accept: "application/json",
    },
  });
  const memory: Memory = await data.json();

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
