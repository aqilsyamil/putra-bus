import { BusStop } from "@/types/data";
import { View, Text } from "react-native";
import StarIcon from "@/icons/StarIcon";

interface BusStopItemProps {
  busStop: BusStop;
}

export default function BusStopItem({ busStop }: BusStopItemProps): JSX.Element {

  console.log(busStop);

  return (
    <View className="flex flex-col py-4 px-2 border-b border-slate-200">
      <View className="flex flex-row items-center">
        <StarIcon color="#333231" />
        <View className="flex flex-col">
          <Text className="text-base text-black font-semibold px-2">{busStop.fullName}</Text>
          <View className="flex flex-row items-center">
            <Text className="text-slate-600 font-semibold px-2">{busStop.shortName}</Text>
            <Text className="text-slate-600 ml-1">•</Text>
            <Text className="text-slate-600 font-semibold ml-1">SJ155</Text>
          </View>
        </View>
      </View>
    </View>
  );
}



