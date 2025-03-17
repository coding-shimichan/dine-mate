import Card from "@/app/components/Card";

export default function WishlistsPage() {
  return (
    <>
      <h1 className="mb-4 text-4xl font-extrabold leading-none tracking-tight text-gray-900 md:text-5xl lg:text-6xl dark:text-white">
        Wishlists
      </h1>
      <div className="grid grid-cols-3 gap-4 my-4">
        <Card mainText="Restaurant 1" imageSrc="/photo-materials/photo1.jpg" />
        <Card mainText="Restaurant 2" imageSrc="/photo-materials/photo1.jpg" />
        <Card mainText="Restaurant 3" imageSrc="/photo-materials/photo1.jpg" />
        <Card mainText="Restaurant 4" imageSrc="/photo-materials/photo1.jpg" />
      </div>
    </>
  );
}
