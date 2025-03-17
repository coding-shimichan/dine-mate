import Image from "next/image";

interface ChatMessageProps {
  content: string;
  userEmail: string;
  userPhotoSrc?: string;
  isMyMessage: boolean;
}

export default function ChatMessage(props: ChatMessageProps) {
  return (
    <div
      className={props.isMyMessage ? "flex flex-row-reverse" : "flex flex-row"}
    >
      {props.userPhotoSrc ? (
        <Image
          className="w-16 h-16 rounded-full shadow-lg p-4 object-cover"
          src={props.userPhotoSrc || ""}
          alt={props.userEmail}
          width={80}
          height={80}
        />
      ) : (
        <p className="m-4 p-4 w-32 h-32">No Image</p>
      )}
      <div className="w-full max-w-sm p-4 bg-white border border-gray-200 rounded-lg shadow-sm dark:bg-gray-800 dark:border-gray-700 message">
        <p className="text-md font-medium text-gray-900 dark:text-white">
          {props.content}
        </p>
      </div>
    </div>
  );
}
