import Card from "@/app/components/card";
import Restaurant from "@/app/types/Restaurant";
import Memory from "@/app/types/Memory";

export default function MemoriesPage() {
  const restaurants: Restaurant[] = [
    {
      id: "1",
      name: "Delicious Indian Curry",
      address: "Shibuya, Tokyo, Japan",
      phoneNumber: "03-1234-5678",
      mainImageSrc: "/photo-materials/photo1.jpg",
    },
    {
      id: "2",
      name: "Washoku Restaurant",
      address: "Shinjuku, Tokyo, Japan",
      phoneNumber: "03-1234-5678",
      mainImageSrc: "/photo-materials/photo2.jpg",
    },
    {
      id: "3",
      name: "Yakiniku Restaurant",
      address: "Nakano, Tokyo, Japan",
      phoneNumber: "03-1234-5678",
      mainImageSrc: "/photo-materials/photo1.jpg",
    },
    {
      id: "4",
      name: "Italian restaurant",
      address: "Chuo, Tokyo, Japan",
      phoneNumber: "03-1234-5678",
      mainImageSrc: "/photo-materials/photo1.jpg",
    },
  ];

  const memories: Memory[] = [
    {
      id: "1",
      title: "Memory 1",
      content: "Memory 1 content",
      mainImageSrc: "/photo-materials/photo2.jpg",
      restaurant_id: "1",
    },
    {
      id: "2",
      title: "Memory 2",
      content: "Memory 2 content",
      mainImageSrc: "/photo-materials/photo2.jpg",
      restaurant_id: "2",
    },
    {
      id: "3",
      title: "Memory 3",
      content: "Memory 3 content",
      mainImageSrc: "/photo-materials/photo2.jpg",
      restaurant_id: "3",
    },
    {
      id: "4",
      title: "Memory 4",
      content: "Memory 4 content",
      mainImageSrc: "/photo-materials/photo2.jpg",
      restaurant_id: "4",
    },
  ];

  return (
    <>
      <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
        Memories
      </h1>
      <div className="grid grid-cols-3 gap-4 my-4">
        {memories.map((memory) => {
          const restaurant =
            restaurants.find(
              (restaurant) => restaurant.id === memory.restaurant_id
            ) || restaurants[0];

          return (
            <Card
              key={memory.id}
              mainText={memory.title}
              subText={restaurant.name}
              imageSrc={memory.mainImageSrc}
            />
          );
        })}
      </div>
    </>
  );
}
