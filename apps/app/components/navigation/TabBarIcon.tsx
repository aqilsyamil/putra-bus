import BusRoutesIcon from "@/icons/BusRoutesIcon";
import BusStopsIcon from "@/icons/BusStopsIcon";
import MoreIcon from "@/icons/MoreIcon";
import NavigationIcon from "@/icons/NavigationIcon";
import { TabBarIconProps } from "@/types/icons";

export function TabBarIcon({ color, name }: TabBarIconProps) {
    if (name === 'navigation') {
        return <NavigationIcon color={color} />;
    } else if (name === 'bus-routes') {
        return <BusRoutesIcon color={color} />;
    } else if (name === 'bus-stops') {
        return <BusStopsIcon color={color} />;
    } else if (name === 'more') {
        return <MoreIcon color={color} />;
    }
}
