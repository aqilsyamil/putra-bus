import { useState } from "react";
import { View, Text, TouchableOpacity } from "react-native";
import { BusStop } from "@/types/data";
import StarIcon from "@/icons/StarIcon";
import ForwardIcon from "@/icons/ForwardIcon";
import RouteOneIcon from "@/icons/RouteOneIcon";
import RouteTwoIcon from "@/icons/RouteTwoIcon";
import RouteThreeIcon from "@/icons/RouteThreeIcon";
import RouteFourIcon from "@/icons/RouteFourIcon";

interface BusStopItemProps {
  busStop: BusStop;
}

export default function BusStopItem({ busStop }: BusStopItemProps): JSX.Element {
  const [isStarFilled, setIsStarFilled] = useState(false);

  const toggleStar = () => {
    setIsStarFilled((prev) => !prev);
  };

  return (
    <View style={{ paddingVertical: 10, paddingHorizontal: 12, borderBottomWidth: 1, borderBottomColor: "#E0E0E0" }}>
      <View style={{ flexDirection: "row", alignItems: "center", justifyContent: "space-between" }}>
        <View style={{ flexDirection: "row", alignItems: "center", flex: 1 }}>
          <TouchableOpacity onPress={toggleStar} style={{ marginHorizontal: 6 }}>
            <StarIcon color={isStarFilled ? "#F9AA33" : "#333231"} filled={isStarFilled} />
          </TouchableOpacity>
          <View style={{ flexShrink: 1 }}>
            <Text style={{ fontSize: 16, color: "black", fontWeight: "600", marginLeft: 4 }}>
              {busStop.fullName}
            </Text>
            <View style={{ flexDirection: "row", alignItems: "center", marginTop: 2 }}>
              <Text style={{ color: "#757575", fontWeight: "600", marginLeft: 4 }}>{busStop.shortName}</Text>
              <Text style={{ color: "#757575", marginHorizontal: 4 }}>•</Text>
              <Text style={{ color: "#757575", fontWeight: "600" }}>{busStop.id}</Text>
            </View>
          </View>
        </View>
        <View style={{ flexDirection: "row", alignItems: "center", flexShrink: 0 }}>
          <RouteOneIcon color="#31CE8C" size={24} style={{ marginRight: 6 }} />
          <RouteTwoIcon color="#FA9131" size={24} style={{ marginRight: 6 }} />
          <RouteThreeIcon color="#233ECC" size={24} style={{ marginRight: 6 }} />
          <RouteFourIcon color="#F13478" size={24} style={{ marginRight: 6 }} />
          <ForwardIcon color="#333231" size={20} />
        </View>
      </View>
    </View>
  );
}
