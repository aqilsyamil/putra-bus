import { IconProps } from "@/types/icons";
import Svg, { Path } from "react-native-svg";

export default function RouteFiveIcon({ color, size, style }: IconProps): JSX.Element {
    return (
        <Svg width="24" height="24" viewBox="0 0 24 24" fill="none">
          <Path d="M12 2a10 10 0 0 1 10 10a10 10 0 0 1 -10 10a10 10 0 0 1 -10 -10a10 10 0 0 1 10 -10z" fill="#823EE1" />
          <Path d="M13.973 8.812H10.409V10.693C10.563 10.5023 10.783 10.3483 11.069 10.231C11.355 10.1063 11.6593 10.044 11.982 10.044C12.5687 10.044 13.049 10.1723 13.423 10.429C13.797 10.6857 14.0683 11.0157 14.237 11.419C14.4057 11.815 14.49 12.2403 14.49 12.695C14.49 13.5383 14.248 14.2167 13.764 14.73C13.2873 15.2433 12.6053 15.5 11.718 15.5C10.882 15.5 10.2147 15.291 9.716 14.873C9.21733 14.455 8.935 13.9087 8.869 13.234H10.365C10.431 13.5273 10.5777 13.762 10.805 13.938C11.0397 14.114 11.3367 14.202 11.696 14.202C12.1287 14.202 12.455 14.0663 12.675 13.795C12.895 13.5237 13.005 13.1643 13.005 12.717C13.005 12.2623 12.8913 11.9177 12.664 11.683C12.444 11.441 12.1177 11.32 11.685 11.32C11.377 11.32 11.1203 11.397 10.915 11.551C10.7097 11.705 10.563 11.9103 10.475 12.167H9.001V7.459H13.973V8.812Z" fill="white"/>
        </Svg>
      );
}
