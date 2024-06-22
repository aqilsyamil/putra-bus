import List from "@/components/List";
import { ScrollView, View, Text } from "react-native";
import BusStopItem from '@/components/bus-stop/BusStopItem';
import AppBar from "@/components/bars/AppBar";
import SearchBar from "@/components/bars/SearchBar";
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
    <View className="flex-1 bg-white">
        <AppBar title="Bus Stops" /> 
        <View className="items-center my-4">
      <SearchBar placeholder="Search bus stops" width={380} height={40} />
       </View>
       <View className="px-4">
        <Text className="text-base text-gray-500 font-semibold">Bus Stops</Text>
      </View>
      <ScrollView className="lex-1 w-full bg-white mt-4">
        <List items={busStopsQuery.data} sourceName="busStop" ItemComponent={BusStopItem} />
      </ScrollView>
    </View>
  );
};


