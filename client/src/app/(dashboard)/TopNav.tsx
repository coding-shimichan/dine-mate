import Link from "next/link";
import Image from "next/image";

export default function TopNav() {
  const links = [
    { name: "Search", href: "/restaurants/search" },
    { name: "Wishlists", href: "/wishlists/" },
    { name: "Chats", href: "/chats/" },
    { name: "Memories", href: "/memories/" },
    { name: "Profile", href: "/profile" },
    { name: "Logout", href: "/users/sign_out" },
  ];

  return (
    <nav>
      <Image src="/vercel.svg" width={160} height={160} alt="DineMate Logo" />
      <ul>
        {links.map((link) => {
          return (
            <Link key={link.name} href={link.href}>
              <p>{link.name}</p>
            </Link>
          );
        })}
      </ul>
    </nav>
  );
}
