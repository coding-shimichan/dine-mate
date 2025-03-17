import Card from "@/app/components/Card";

export default function ChatsPage() {
  return (
    <>
      <h1>Chats</h1>
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
