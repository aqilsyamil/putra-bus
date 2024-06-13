import List from "@/components/List";
import { ScrollView, View, Text } from "react-native";
import BusStopItem from '@/components/bus-stop/BusStopItem';
import { useBusStops } from "@/services/queries";

export default function BusStopsPage() {

  const busStopsQuery = useBusStops();

  if (busStopsQuery.isPending) {
    return (
      <View className="flex-1 items-center justify-center">
        <Text className="text-black text-3xl text-center">Loading...</Text>
      </View>
    )
  }

  if (busStopsQuery.isError) {
    return (
      <View className="flex-1 items-center justify-center">
        <Text className="text-red-500 text-3xl text-center">There is an error</Text>
      </View>
    )
  }

  return (
    <ScrollView>
      <List items={busStopsQuery.data} sourceName="busStop" ItemComponent={BusStopItem} />
    </ScrollView>
  );
};

