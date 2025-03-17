import Card from "@/app/components/Card";

export default function ChatsPage() {
  return (
    <>
      <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
        Chats
      </h1>
      <div>
        <Card
          mainText="User 1"
          subText="user1@aaa.com"
          imageSrc="/photo-materials/photo1.jpg"
        />
        <Card
          mainText="User 2"
          subText="user2@aaa.com"
          imageSrc="/photo-materials/photo1.jpg"
        />
        <Card
          mainText="Uesr 3"
          subText="user3@aaa.com"
          imageSrc="/photo-materials/photo1.jpg"
        />
        <Card
          mainText="User 4"
          subText="user4@aaa.com"
          imageSrc="/photo-materials/photo1.jpg"
        />
      </div>
    </>
  );
}
