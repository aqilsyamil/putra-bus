import Svg, { Path, Rect, Text } from "react-native-svg";

export default function BusRoutesItemNumberIcon({ number }: { number: number }): JSX.Element {
  let fillColor: string;
  let textContent: string;

  switch (number) {
    case 1:
      fillColor = "#0158B8";
      textContent = "1";
      break;
    case 2:
      fillColor = "#00943E";
      textContent = "2";
      break;
    case 3:
      fillColor = "#FF9D1A";
      textContent = "3";
      break;
    case 4:
      fillColor = "#469AC9";
      textContent = "4";
      break;
    case 5:
      fillColor = "#982EB4";
      textContent = "5";
      break;
    default:
      return <></>;
  }

  return (
    <Svg width="30" height="30" viewBox="0 0 40 40" fill="none">
      <Rect width="40" height="40" rx="20" fill={fillColor} />
      <Text
        x="50%"
        y="50%"
        fontSize="20"
        fontWeight="bold"
        textAnchor="middle"
        dy=".3em"
        fill="#fff"
      >
        {textContent}
      </Text>
    </Svg>
  );
}
