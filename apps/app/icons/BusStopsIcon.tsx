import { IconProps } from "@/types/icons"
import Svg, { Path } from "react-native-svg"

export default function NavigationIcon({ color, size, style }: IconProps): JSX.Element {
  return (
    <Svg width="25" height="24" viewBox="0 0 25 24" fill="none">
      <Path d="M12.3333 13.43C14.0564 13.43 15.4533 12.0331 15.4533 10.31C15.4533 8.58687 14.0564 7.19 12.3333 7.19C10.6102 7.19 9.21332 8.58687 9.21332 10.31C9.21332 12.0331 10.6102 13.43 12.3333 13.43Z" stroke={color} strokeWidth="1.5"/>
      <Path d="M3.95333 8.49C5.92333 -0.169998 18.7533 -0.159997 20.7133 8.5C21.8633 13.58 18.7033 17.88 15.9333 20.54C13.9233 22.48 10.7433 22.48 8.72333 20.54C5.96333 17.88 2.80333 13.57 3.95333 8.49Z" stroke={color} strokeWidth="1.5"/>
    </Svg>
  );
}
