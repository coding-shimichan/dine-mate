import RestaurantCard from "./RestaurantCard";
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
        <RestaurantCard name="Restaurant 1" address="Address 1" />
        <RestaurantCard name="Restaurant 2" address="Address 2" />
        <RestaurantCard name="Restaurant 3" address="Address 3" />
        <RestaurantCard name="Restaurant 4" address="Address 4" />
      </div>
    </>
  );
}
