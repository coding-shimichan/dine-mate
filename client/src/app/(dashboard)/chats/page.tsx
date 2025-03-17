import ChatCard from "./ChatCard";

export default function ChatsPage() {
  return (
    <>
      <h1>Chats</h1>
      <div>
        <ChatCard otherUserEmail="user1@aaa.com" />
        <ChatCard otherUserEmail="user2@aaa.com" />
        <ChatCard otherUserEmail="user3@aaa.com" />
        <ChatCard otherUserEmail="user4@aaa.com" />
      </div>
    </>
  );
}
