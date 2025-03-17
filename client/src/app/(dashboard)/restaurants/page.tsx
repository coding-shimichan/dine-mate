import Button from "@/app/components/Button";
import Card from "@/app/components/Card";
import Image from "next/image";

export default function RestaurantPage() {
  return (
    <>
      <div>
        <Button label="Add to wishlist" />
        <Image
          src="/vercel.svg"
          width={120}
          height={120}
          alt="Restaurant main image"
        />
        <div>
          <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
            Restaurant Name
          </h1>
          <div>
            <p>Address: Address 1</p>
            <p>Phone Number: 000-1111-1111</p>
          </div>
        </div>
      </div>
      <div>
        <h2>Interested Users</h2>

        <div className="grid grid-cols-3 gap-4 my-4">
          <Card
            mainText="User 1"
            subText="user1@aaa.com"
            imageSrc="/photo-materials/photo2.jpg"
          />
          <Card
            mainText="User 2"
            subText="user2@aaa.com"
            imageSrc="/photo-materials/photo2.jpg"
          />
          <Card
            mainText="User 3"
            subText="user3@aaa.com"
            imageSrc="/photo-materials/photo2.jpg"
          />
          <Card
            mainText="User 4"
            subText="user4@aaa.com"
            imageSrc="/photo-materials/photo2.jpg"
          />
        </div>
      </div>
    </>
  );
}
