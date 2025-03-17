import Card from "@/app/components/Card";

export default function MemoriesPage() {
  return (
    <>
      <h1>Memories</h1>
      <div>
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
