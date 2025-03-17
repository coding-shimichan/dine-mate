import WishlistCard from "./WishlistCard";

export default function WishlistsPage() {
  return (
    <>
      <h1>Wishlists</h1>
      <div>
        <WishlistCard restaurantName="Restaurant 1" />
        <WishlistCard restaurantName="Restaurant 2" />
        <WishlistCard restaurantName="Restaurant 3" />
        <WishlistCard restaurantName="Restaurant 4" />
      </div>
    </>
  );
}
