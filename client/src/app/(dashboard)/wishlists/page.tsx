import { getServerSession } from "next-auth";
import { authOptions } from "@/app/api/auth/[...nextauth]/route";

import Card from "@/app/components/card";
import Restaurant from "@/app/types/Restaurant";
import Wishlist from "@/app/types/Wishlist";

export default async function WishlistPage() {
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

  const session = await getServerSession(authOptions);

  if (!session || !session.token) {
    return <div>You must be logged in to view your wishlists.</div>;
  }

  const API_URL = process.env.NEXT_PUBLIC_RAILS_API_URL;
  let wishlists: Wishlist[] = [];

  try {
    const response = await fetch(`${API_URL}/api/wishlists`, {
      method: "GET",
      headers: {
        Authorization: `Bearer ${session.token}`,
        "Content-Type": "application/json",
      },
      cache: "no-store",
    });

    if (response.ok) {
      wishlists = await response.json();
    } else {
      return <div>Failed to fetch wishlists.</div>;
    }
  } catch (err) {
    return <div>An error occurred while fetching wishlists.</div>;
  }

  return (
    <>
      <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
        Wishlists
      </h1>
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
              imageSrc={restaurant.mainImageSrc}
              href={`restaurants/${wishlist.restaurant_id}`}
            />
          );
        })}
      </div>
    </>
  );
}
