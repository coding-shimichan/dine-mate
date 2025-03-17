import ChatMessage from "./ChatMessage";

export default function ChatPage() {
  const messages = [
    {
      id: "1",
      content: "Hello!",
      userEmail: "user1@aaa.com",
      userPhotoSrc: "/photo-materials/photo1.jpg",
    },
    {
      id: "2",
      content: "Hi!",
      userEmail: "user2@aaa.com",
      userPhotoSrc: "/photo-materials/photo2.jpg",
    },
    {
      id: "3",
      content:
        "Let's go to the new indian curry restaurant near the station next week?",
      userEmail: "user1@aaa.com",
      userPhotoSrc: "/photo-materials/photo1.jpg",
    },
    {
      id: "4",
      content: "Great!",
      userEmail: "user2@aaa.com",
      userPhotoSrc: "/photo-materials/photo2.jpg",
    },
  ];

  return (
    <>
      <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
        Chat
      </h1>
      <div className="messages flex flex-col gap-4">
        {messages.map((message) => {
          return (
            <ChatMessage
              key={message.id}
              content={message.content}
              userEmail={message.userEmail}
              userPhotoSrc={message.userPhotoSrc}
              isMyMessage={message.userEmail === "user1@aaa.com"}
            />
          );
        })}
      </div>
    </>
  );
}
