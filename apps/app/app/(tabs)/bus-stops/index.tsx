import { ScrollView, View, Text, TouchableOpacity } from "react-native";
import List from "@/components/List";
import { useBusStops } from "@/services/queries";
import BusStopItem from '@/components/bus-stop/BusStopItem';
import AppBar from "@/components/bars/AppBar";
import SearchBar from "@/components/bars/SearchBar";
import DropDownIcon from "@/icons/DropDownIcon";
import BellIcon from "@/icons/BellIcon";


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
    <View style={{ flex: 1, backgroundColor: 'white' }}>
        <AppBar title="Bus Stops">
        <View className="flex-row items-center justify-between px-4">
          {/* <TouchableOpacity className="ml-auto">
            <BellIcon color="#333231" size={24} />
          </TouchableOpacity> */}
        </View>
      </AppBar>
      <View style={{ alignItems: 'center', marginVertical: 16 }}>
        <SearchBar placeholder="Search bus stops" width={380} height={40} />
      </View>
      <View style={{ flexDirection: 'row', justifyContent: 'space-between', paddingHorizontal: 16, marginBottom: 12 }}>
        <Text style={{ fontSize: 18, color: '#5C5B5A', fontWeight: '600' }}>Bus Stops</Text>
        <TouchableOpacity style={{ flexDirection: 'row', alignItems: 'center' }}>
          <Text style={{ fontSize: 16, color: '#5C5B5A', fontWeight: '600', marginRight: 4 }}>Sort by</Text>
          <DropDownIcon color="#5C5B5A" size={18} />
        </TouchableOpacity>
      </View>
      <ScrollView style={{ flex: 1, backgroundColor: 'white', paddingHorizontal: 16 }}>
        <List items={busStopsQuery.data} sourceName="busStop" ItemComponent={BusStopItem} />
      </ScrollView>
    </View>
  );
};