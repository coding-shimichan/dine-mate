import Card from "@/app/components/Card";
import SearchField from "./SearchField";
import Restaurant from "@/app/types/Restaurant";

export default function RestaurantSearchPage() {
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
        Restaurant Search
      </h1>
      <SearchField />

      <h2 className="text-4xl font-extrabold dark:text-white">
        Search Results
      </h2>
      <div className="grid grid-cols-3 gap-4 my-4">
        {restaurants.map((restaurant) => {
          return (
            <Card
              key={restaurant.id}
              mainText={restaurant.name}
              subText={restaurant.address}
              imageSrc={restaurant.mainImageSrc}
              href={`/restaurants/${restaurant.id}`}
            />
          );
        })}
      </div>
    </>
  );
}
