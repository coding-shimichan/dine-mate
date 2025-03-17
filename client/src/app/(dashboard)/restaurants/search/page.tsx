import Card from "@/app/components/Card";
import SearchField from "./SearchField";

export default function RestaurantSearchPage() {
  return (
    <>
      <h1>Restaurant Search Page</h1>
      <div>
        <SearchField />
      </div>

      <h2>Search Results</h2>
      <div>
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
