import Memory from "@/app/types/Memory";

export default function MemoryPage() {
  const memory: Memory = {
    id: "1",
    title: "Memory 1",
    content: "Memory 1 content",
    mainImageSrc: "/photo-materials/photo2.jpg",
    restaurant_id: "1",
  };

  return (
    <>
      <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
        {memory.title}
      </h1>
      <div>
        <p>{memory.content}</p>
      </div>
    </>
  );
}
