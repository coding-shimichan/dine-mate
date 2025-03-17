interface MemoryProps {
  title: string;
  userEmail: string;
  content: string;
}

export default function MemoryCard(props: MemoryProps) {
  return (
    <>
      <div className="memory-card">
        <h2>{props.title}</h2>
        <p>{props.userEmail}</p>
        <p>{props.content}</p>
      </div>
    </>
  );
}
