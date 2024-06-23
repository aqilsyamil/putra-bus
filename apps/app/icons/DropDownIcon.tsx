import { IconProps } from "@/types/icons"
import Svg, { Path } from "react-native-svg"

export default function DropDownIcon({ color, size, style }: IconProps): JSX.Element {
  return (
    <Svg width="16" height="16" viewBox="0 0 16 16" fill="none">
    <Path d="M13.28 5.96664L8.9333 10.3133C8.41997 10.8266 7.57997 10.8266 7.06664 10.3133L2.71997 5.96664" stroke="#5C5B5A" stroke-width="5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
  </Svg>
  );
}

