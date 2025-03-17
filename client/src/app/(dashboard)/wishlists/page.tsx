import Card from "@/app/components/Card";
import Wishlist from "@/app/types/Wishlist";
import Restaurant from "@/app/types/Restaurant";

export default function WishlistsPage() {
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
              href={`/restaurants/${wishlist.restaurant_id}`}
            />
          );
        })}
      </div>
    </>
  );
}
