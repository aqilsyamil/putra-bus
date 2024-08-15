import { IconProps } from "@/types/icons"
import Svg, { Path } from "react-native-svg"

export default function BackwardIcon({ color = "#000000", size = 26, style }: IconProps): JSX.Element {
  return (
    <Svg width={size} height={size} viewBox="0 0 26 26" fill="none" style={style}>
      <Path 
        d="M16.25 21.58L9.18666 14.5167C8.35249 13.6825 8.35249 12.3175 9.18666 11.4834L16.25 4.42004" 
        stroke={color} 
        strokeWidth="2"  // Increased stroke-width for a bolder line
        strokeMiterlimit="10" 
        strokeLinecap="round" 
        strokeLinejoin="round"
      />
    </Svg>
  );
}
