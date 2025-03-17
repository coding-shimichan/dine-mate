interface RestaurantProps {
  name: string;
  address: string;
}

export default function RestaurantCard(props: RestaurantProps) {
  return (
    <>
      <div className="restaurant-card">
        <h2>{props.name}</h2>
        <p>{props.address}</p>
      </div>
    </>
  );
}
