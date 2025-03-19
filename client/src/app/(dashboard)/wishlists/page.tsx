import Card from "@/app/components/card";
import Restaurant from "@/app/types/Restaurant";
import Wishlist from "@/app/types/Wishlist";

export default async function WishlistsPage() {
  const API_URL = process.env.NEXT_PUBLIC_RAILS_API_URL;
  const data = await fetch(`${API_URL}/wishlists`, {
    method: "GET",
    headers: {
      Accept: "application/json",
    },
  });
  const wishlists: Wishlist[] = await data.json();

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
              href={`restaurants/${restaurant.id}`}
            />
          );
        })}
      </div>
    </>
  );
}
