import Link from "next/link";

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
