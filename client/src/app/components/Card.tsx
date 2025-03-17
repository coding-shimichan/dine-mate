import Image from "next/image";
import Link from "next/link";

interface CardProps {
  mainText: string;
  subText?: string;
  imageSrc?: string;
  altText?: string;
  href?: string;
}

export default function Card(props: CardProps) {
  return (
    <>
      <div className="w-full max-w-sm bg-white border border-gray-200 rounded-lg shadow-sm dark:bg-gray-800 dark:border-gray-700">
        <Link
          key={props.mainText}
          href={props.href || "#"}
          // className="flex items-center p-2 text-gray-900 rounded-lg dark:text-white hover:bg-gray-100 dark:hover:bg-gray-700 group"
        >
          <div className="flex flex-row items-center p-auto">
            {props.imageSrc ? (
              <Image
                className="w-32 h-32 rounded-full shadow-lg p-4 object-cover"
                src={props.imageSrc || ""}
                alt={props.altText || props.mainText}
                width={80}
                height={80}
              />
            ) : (
              <p className="m-4 p-4 w-32 h-32">No Image</p>
            )}
            <div>
              <h5 className="text-xl font-medium text-gray-900 dark:text-white">
                {props.mainText}
              </h5>
              {props.subText ? (
                <span className="text-sm text-gray-500 dark:text-gray-400">
                  {props.subText}
                </span>
              ) : null}
            </div>
          </div>
        </Link>
      </div>
    </>
  );
}
