import Image from "next/image";
interface RestaurantProps {
  name: string;
  address: string;
  mainImagePath: string;
}

export default function RestaurantCard(props: RestaurantProps) {
  return (
    <>
      <div className="restaurant-card">
        <Image
          src={props.mainImagePath}
          alt="User profile photo"
          width={50}
          height={50}
        />
        <h2>{props.name}</h2>
        <p>{props.address}</p>
      </div>
    </>
  );
}
