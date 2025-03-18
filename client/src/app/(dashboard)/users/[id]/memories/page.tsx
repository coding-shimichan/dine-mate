import Card from "@/app/components/card";
import Memory from "@/app/types/Memory";
import Restaurant from "@/app/types/Restaurant";

export default async function MemoriesPage() {
  const API_URL = process.env.NEXT_PUBLIC_RAILS_API_URL;
  const data = await fetch(`${API_URL}/users/16/memories`, {
    method: "GET",
    headers: {
      Accept: "application/json",
    },
  });

  const memories: Memory[] = await data.json();

  const restaurants: Restaurant[] = [
    {
      id: "J000444181",
      name: "Delicious Indian Curry",
      address: "Shibuya, Tokyo, Japan",
      phoneNumber: "03-1234-5678",
      mainImageSrc: "/photo-materials/photo1.jpg",
    },
    {
      id: "J000769317",
      name: "Washoku Restaurant",
      address: "Shinjuku, Tokyo, Japan",
      phoneNumber: "03-1234-5678",
      mainImageSrc: "/photo-materials/photo2.jpg",
    },
    {
      id: "J000962703",
      name: "Yakiniku Restaurant",
      address: "Nakano, Tokyo, Japan",
      phoneNumber: "03-1234-5678",
      mainImageSrc: "/photo-materials/photo1.jpg",
    },
    {
      id: "J003498323",
      name: "Italian restaurant",
      address: "Chuo, Tokyo, Japan",
      phoneNumber: "03-1234-5678",
      mainImageSrc: "/photo-materials/photo1.jpg",
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
              mainText={restaurant.name}
              imageSrc={restaurant.mainImageSrc}
              href={`/memories/${memory.id}`}
            />
          );
        })}
      </div>
    </>
  );
}
