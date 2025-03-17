import MemoryCard from "./MemoryCard";

export default function MemoriesPage() {
  return (
    <>
      <h1>Memories</h1>
      <div>
        <MemoryCard
          title="Memory 1"
          userEmail="user1@aa.com"
          content="Memory 1 content"
        />
        <MemoryCard
          title="Memory 2"
          userEmail="user1@aa.com"
          content="Memory 2 content"
        />
        <MemoryCard
          title="Memory 3"
          userEmail="user1@aa.com"
          content="Memory 3 content"
        />
        <MemoryCard
          title="Memory 4"
          userEmail="user1@aa.com"
          content="Memory 4 content"
        />
      </div>
    </>
  );
}
