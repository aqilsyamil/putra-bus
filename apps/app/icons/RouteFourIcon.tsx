import { IconProps } from "@/types/icons";
import Svg, { Path } from "react-native-svg";

export default function RouteFourIcon({ color, size, style }: IconProps): JSX.Element {
    return (
        <Svg width="24" height="24" viewBox="0 0 24 24" fill="none">
        <Path d="M12 2a10 10 0 0 1 10 10a10 10 0 0 1 -10 10a10 10 0 0 1 -10 -10a10 10 0 0 1 10 -10z" fill="#F13478" />
        <Path d="M8.517 13.938V12.728L12.114 7.58H13.907V12.596H14.875V13.938H13.907V15.5H12.367V13.938H8.517ZM12.466 9.23L10.211 12.596H12.466V9.23Z" fill="white"/>
      </Svg>
      );
}
