import Card from "@/app/components/Card";
import SearchField from "./SearchField";

export default function RestaurantSearchPage() {
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
        <Card
          mainText="Restaurant 1"
          subText="Address 1"
          imageSrc="/photo-materials/photo1.jpg"
        />
        <Card
          mainText="Restaurant 2"
          subText="Address 2"
          imageSrc="/photo-materials/photo1.jpg"
        />
        <Card
          mainText="Restaurant 3"
          subText="Address 3"
          imageSrc="/photo-materials/photo1.jpg"
        />
        <Card
          mainText="Restaurant 4"
          subText="Address 4"
          imageSrc="/photo-materials/photo1.jpg"
        />
      </div>
    </>
  );
}
