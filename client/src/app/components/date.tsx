import { parseISO, format } from "date-fns";

interface dateProps {
  dateString: string;
}

export default function Date(props: dateProps) {
  const date: Date = parseISO(props.dateString);
  return (
    <time dateTime={props.dateString}>{format(date, "LLLL d, yyyy")}</time>
  );
}
