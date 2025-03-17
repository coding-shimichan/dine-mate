interface ChatProps {
  otherUserEmail: string;
}

export default function ChatCard(props: ChatProps) {
  return (
    <>
      <div className="chat-card">
        <h2>{props.otherUserEmail}</h2>
      </div>
    </>
  );
}
