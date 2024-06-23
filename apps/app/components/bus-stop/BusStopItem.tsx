import { useState } from "react";
import { View, Text, TouchableOpacity  } from "react-native";
import { BusStop } from "@/types/data";
import StarIcon from "@/icons/StarIcon";

interface BusStopItemProps {
  busStop: BusStop;
}

export default function BusStopItem({ busStop }: BusStopItemProps): JSX.Element {
  const [isStarFilled, setIsStarFilled] = useState(false);

  const toggleStar = () => {
    setIsStarFilled((prev) => !prev);
  };

  console.log(busStop);

return (
    <View className="flex flex-col py-4 px-2 border-b border-slate-200">
      <View className="flex flex-row items-center">
        <TouchableOpacity onPress={toggleStar} style={{ marginHorizontal: 6 }}>
          <StarIcon color={isStarFilled ? "#F9AA33" : "#333231"} filled={isStarFilled} />
        </TouchableOpacity>
        <View className="flex flex-col">
          <Text className="text-base text-black font-semibold px-1">{busStop.fullName}</Text>
          <View className="flex flex-row items-center">
            <Text className="text-red-500 font-semibold px-1">{busStop.shortName}</Text>
            <Text className="text-gray-500 ml-1">•</Text>
            <Text className="text-gray-500 font-semibold ml-1">{busStop.id}</Text>
          </View>
        </View>
      </View>
    </View>
  );
}



