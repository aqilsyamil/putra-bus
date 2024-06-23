import { IconProps } from "@/types/icons";
import Svg, { Path } from "react-native-svg";

interface StarIconProps extends IconProps {
  filled?: boolean;
}

export default function StarIcon({ color, size, style, filled = false }: StarIconProps): JSX.Element {
  const fillColor = filled ? "#F9AA33" : "none";
  const strokeColor = filled ? "#F9AA33" : color || "#333231";
  
  return (
    <Svg width={size || "20"} height={size || "20"} viewBox="0 0 14 14" fill="none">
      <Path
        d="M6.56794 1.73524C6.76081 1.4041 7.23919 1.40411 7.43206 1.73524L8.93241 4.31119C9.14436 4.67509 9.49953 4.93313 9.91112 5.02226L12.8246 5.65317C13.1992 5.73427 13.347 6.18924 13.0917 6.47499L11.1054 8.69793C10.8248 9.01196 10.6892 9.42948 10.7316 9.84847L11.0319 12.8143C11.0705 13.1956 10.6835 13.4768 10.3328 13.3223L7.60487 12.1202C7.2195 11.9503 6.7805 11.9503 6.39513 12.1202L3.66721 13.3223C3.31654 13.4768 2.92952 13.1956 2.96812 12.8143L3.26842 9.84847C3.31084 9.42948 3.17518 9.01196 2.89459 8.69793L0.908345 6.47499C0.653018 6.18924 0.800844 5.73427 1.17537 5.65317L4.08888 5.02226C4.50047 4.93313 4.85563 4.67509 5.06759 4.31119L6.56794 1.73524Z"
        stroke={strokeColor}
        fill={fillColor}
      />
    </Svg>
  );
}
