import { IconProps } from "@/types/icons";
import Svg, { Path } from "react-native-svg";

export default function RouteOneIcon({ color, size, style }: IconProps): JSX.Element {
  return (
    <Svg width="24" height="24" viewBox="0 0 24 24" fill="#31CE8C">
    <Path d="M12 2a10 10 0 100 20 10 10 0 000-20z" fill="#31CE8C"/>
    <Path d="M10.396 8.9V7.481H13.047V15.5H11.463V8.9H10.396Z" fill="white"/>
    </Svg>
  );
}

