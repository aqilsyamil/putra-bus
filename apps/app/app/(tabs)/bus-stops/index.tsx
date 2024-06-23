import { ScrollView, View, Text, TouchableOpacity } from "react-native";
import List from "@/components/List";
import { useBusStops } from "@/services/queries";
import BusStopItem from '@/components/bus-stop/BusStopItem';
import AppBar from "@/components/bars/AppBar";
import SearchBar from "@/components/bars/SearchBar";
import DropDownIcon from "@/icons/DropDownIcon";


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
       <View className="flex-row justify-between px-4 mb-2">
      <Text className="text-base text-gray-500 font-semibold">Bus Stops</Text>
      <TouchableOpacity className="flex-row items-center">
        <Text className="text-base text-gray-500 font-semibold mr-2">Sort by</Text>
        <DropDownIcon color="#5C5B5A" size={18} />
      </TouchableOpacity>
    </View>
      <ScrollView className="lex-1 w-full bg-white mt-4">
        <List items={busStopsQuery.data} sourceName="busStop" ItemComponent={BusStopItem} />
      </ScrollView>
    </View>
  );
};