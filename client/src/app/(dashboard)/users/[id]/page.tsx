import Card from "@/app/components/card";
import Image from "next/image";
import Memory from "@/app/types/Memory";
import Restaurant from "@/app/types/Restaurant";
import Wishlist from "@/app/types/Wishlist";
import User from "@/app/types/User";

export default function UserPage() {
  const user: User = {
    id: "4",
    name: "User 4",
    email: "user4@aaa.com",
    profileImageSrc: "/photo-materials/photo2.jpg",
  };

  const wishlists: Wishlist[] = [
    {
      id: "1",
      restaurant_id: "1",
      user_id: "4",
    },
    {
      id: "2",
      restaurant_id: "2",
      user_id: "4",
    },
    {
      id: "3",
      restaurant_id: "3",
      user_id: "4",
    },
    {
      id: "4",
      restaurant_id: "4",
      user_id: "4",
    },
  ];

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
      <div id="user-info" className="flex flex-row gap-8 mb-8">
        <Image
          src={user.profileImageSrc || ""}
          width={120}
          height={120}
          alt={user.name}
          className="w-64 h-64 rounded-full content-cover"
        />
        <div className="flex flex-col justify-end mb-auto">
          <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
            {user.name}
          </h1>
        </div>
      </div>

      <section id="wishlists" className="mb-8">
        <h2 className="text-4xl font-extrabold dark:text-white">Wishlists</h2>

        <div className="grid grid-cols-3 gap-4 my-4">
          {wishlists.map((wishlist) => {
            const restaurant =
              restaurants.find(
                (restaurant) => restaurant.id === wishlist.restaurant_id
              ) || restaurants[0];

            return (
              <Card
                key={wishlist.id}
                mainText={restaurant.name}
                subText={restaurant.address}
                imageSrc={restaurant.mainImageSrc}
                href={`/restaurants/${restaurant.id}`}
              />
            );
          })}
        </div>
      </section>

      <section id="restaurant-memories" className="mb-8">
        <h2 className="text-4xl font-extrabold dark:text-white">Memories</h2>

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
                href={`/memories/${memory.id}`}
              />
            );
          })}
        </div>
      </section>
    </>
  );
}
