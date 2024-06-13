import { BusStop } from "@/types/data";
import { View, Text } from "react-native";

interface BusStopItemProps {
  busStop: BusStop;
}

export default function BusStopItem({ busStop }: BusStopItemProps): JSX.Element {

  console.log(busStop);

  return (
    <View className="m-5">
      <Text className="text-xl">{busStop.fullName}</Text>
      <View className="flex flex-row gap-1">
        <Text className="text-grey-500">{busStop.shortName}</Text>
        <Text className="text-grey-500">•</Text>
        <Text className="text-grey-500">SJ155</Text>
      </View>
    </View>
  );
}
