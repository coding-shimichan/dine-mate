import Button from "@/app/components/Button";
import Card from "@/app/components/Card";
import Image from "next/image";
import Restaurant from "@/app/types/Restaurant";
import User from "@/app/types/User";
import Memory from "@/app/types/Memory";

export default function RestaurantPage() {
  const restaurant: Restaurant = {
    id: "1",
    name: "Delicious Indian Curry",
    address: "Shibuya, Tokyo, Japan",
    phoneNumber: "03-1234-5678",
    mainImageSrc: "/photo-materials/photo1.jpg",
  };

  const interestedUsers: User[] = [
    {
      id: "1",
      name: "User 1",
      email: "user1@aaa.com",
      profileImageSrc: "/photo-materials/photo2.jpg",
    },
    {
      id: "2",
      name: "User 2",
      email: "user2@aaa.com",
      profileImageSrc: "/photo-materials/photo2.jpg",
    },
    {
      id: "3",
      name: "User 3",
      email: "user3@aaa.com",
      profileImageSrc: "/photo-materials/photo2.jpg",
    },
    {
      id: "4",
      name: "User 4",
      email: "user4@aaa.com",
      profileImageSrc: "/photo-materials/photo2.jpg",
    },
  ];

  const memories: Memory[] = [
    {
      id: "1",
      title: "Memory 1",
      email: "user1@aa.com",
      mainImageSrc: "/photo-materials/photo2.jpg",
      restaurant_id: "1",
    },
    {
      id: "2",
      title: "Memory 2",
      email: "user1@aa.com",
      mainImageSrc: "/photo-materials/photo2.jpg",
      restaurant_id: "1",
    },
    {
      id: "3",
      title: "Memory 3",
      email: "user1@aa.com",
      mainImageSrc: "/photo-materials/photo2.jpg",
      restaurant_id: "1",
    },
    {
      id: "4",
      title: "Memory 4",
      email: "user1@aa.com",
      mainImageSrc: "/photo-materials/photo2.jpg",
      restaurant_id: "1",
    },
  ];

  return (
    <>
      <div id="button-section" className="flex flex-row justify-end">
        <Button label="Add to wishlist" />
      </div>

      <div id="restaurant-info" className="flex flex-row gap-8 mb-8">
        <Image
          src={restaurant.mainImageSrc || ""}
          width={120}
          height={120}
          alt={restaurant.name}
          className="w-64 h-64 content-cover"
        />
        <div className="flex flex-col justify-end mb-auto">
          <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
            {restaurant.name}
          </h1>
          <dl>
            <div className="flex flex-row justify-between">
              <dt>Address</dt>
              <dd>{restaurant.address}</dd>
            </div>

            <div className="flex flex-row justify-between">
              <dt>Phone Number</dt>
              <dd>{restaurant.phoneNumber}</dd>
            </div>
          </dl>
        </div>
      </div>

      <section id="interested-users" className="mb-8">
        <h2 className="text-4xl font-extrabold dark:text-white">
          Interested Users
        </h2>

        <div className="grid grid-cols-3 gap-4 my-4">
          {interestedUsers.map((user) => {
            return (
              <Card
                key={user.id}
                mainText={user.name}
                subText={user.email}
                imageSrc={user.profileImageSrc}
              />
            );
          })}
        </div>
      </section>

      <section id="restaurant-memories" className="mb-8">
        <h2 className="text-4xl font-extrabold dark:text-white">Memories</h2>

        <div className="grid grid-cols-3 gap-4 my-4">
          {memories.map((memory) => {
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
      </section>
    </>
  );
}
