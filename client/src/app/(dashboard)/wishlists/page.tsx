import Card from "@/app/components/Card";

export default function WishlistsPage() {
  return (
    <>
      <h1>Wishlists</h1>
      <div>
        <Card mainText="Restaurant 1" imageSrc="/photo-materials/photo1.jpg" />
        <Card mainText="Restaurant 2" imageSrc="/photo-materials/photo1.jpg" />
        <Card mainText="Restaurant 3" imageSrc="/photo-materials/photo1.jpg" />
        <Card mainText="Restaurant 4" imageSrc="/photo-materials/photo1.jpg" />
      </div>
    </>
  );
}
