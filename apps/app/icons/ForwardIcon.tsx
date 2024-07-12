import { IconProps } from "@/types/icons"
import Svg, { Path } from "react-native-svg"

export default function ForwardIcon({ color, size, style }: IconProps): JSX.Element {
  return (
    <Svg width="7" height="14" viewBox="0 0 7 14" fill="none">
    <Path d="M1.26831 12.28L5.61498 7.93333C6.12831 7.42 6.12831 6.58 5.61498 6.06667L1.26831 1.72" stroke="#333231" stroke-width="1.5" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"/>
  </Svg>
  );
}