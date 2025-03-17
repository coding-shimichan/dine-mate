interface WishlistProps {
  restaurantName: string;
}

export default function WishlistCard(props: WishlistProps) {
  return (
    <>
      <div className="wishlist-card">
        <h2>{props.restaurantName}</h2>
      </div>
    </>
  );
}
