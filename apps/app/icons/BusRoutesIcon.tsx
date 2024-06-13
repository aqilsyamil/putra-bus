import { IconProps } from "@/types/icons"
import Svg, { Path } from "react-native-svg"

export default function NavigationIcon({ color, size, style }: IconProps): JSX.Element {
  return (
    <Svg width="25" height="24" viewBox="0 0 25 24" fill="none">
      <Path d="M6.13666 9C8.06965 9 9.63666 7.433 9.63666 5.5C9.63666 3.567 8.06965 2 6.13666 2C4.20366 2 2.63666 3.567 2.63666 5.5C2.63666 7.433 4.20366 9 6.13666 9Z" stroke={color} strokeWidth="1.5"/>
      <Path d="M17.6367 15H20.6367C21.7367 15 22.6367 15.9 22.6367 17V20C22.6367 21.1 21.7367 22 20.6367 22H17.6367C16.5367 22 15.6367 21.1 15.6367 20V17C15.6367 15.9 16.5367 15 17.6367 15Z" stroke={color} strokeWidth="1.5"/>
      <Path d="M12.6667 5H15.3467C17.1967 5 18.0567 7.29 16.6667 8.51L8.67666 15.5C7.28666 16.71 8.14666 19 9.98666 19H12.6667" stroke={color} strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
      <Path d="M6.15287 5.5H6.16443" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
      <Path d="M19.1529 18.5H19.1644" stroke={color} strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
    </Svg>
  );
}
