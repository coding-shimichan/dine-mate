import Card from "@/app/components/Card";

export default function MemoriesPage() {
  return (
    <>
      <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
        Memories
      </h1>
      <div className="grid grid-cols-3 gap-4 my-4">
        <Card
          mainText="Memory 1"
          subText="user1@aa.com"
          imageSrc="/photo-materials/photo2.jpg"
        />
        <Card
          mainText="Memory 2"
          subText="user1@aa.com"
          imageSrc="/photo-materials/photo2.jpg"
        />
        <Card
          mainText="Memory 3"
          subText="user1@aa.com"
          imageSrc="/photo-materials/photo2.jpg"
        />
        <Card
          mainText="Memory 4"
          subText="user1@aa.com"
          imageSrc="/photo-materials/photo2.jpg"
        />
      </div>
    </>
  );
}
