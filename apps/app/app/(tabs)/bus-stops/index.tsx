import React, { useState } from "react";
import { ScrollView, View, Text, TouchableOpacity, SafeAreaView, Dimensions, Platform } from "react-native";
import List from "@/components/List";
import { useBusStops } from "@/services/queries";
import BusStopItem from '@/components/bus-stop/BusStopItem';
import AppBar from "@/components/bars/AppBar";
import SearchBar from "@/components/bars/SearchBar";
import DropDownIcon from "@/icons/DropDownIcon";
import BellIcon from "@/icons/BellIcon";
import SortOptionsModal from "@/components/sort-by/SortOptionsModal";

const { width } = Dimensions.get('window');

export default function BusStopsPage() {
  const busStopsQuery = useBusStops();
  const [modalVisible, setModalVisible] = useState(false);
  const [selectedOption, setSelectedOption] = useState("Favorited bus stop");

  if (busStopsQuery.isPending) {
    return (
      <SafeAreaView style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Text style={{ color: 'black', fontSize: 24, textAlign: 'center' }}>Loading...</Text>
      </SafeAreaView>
    );
  }

  if (busStopsQuery.isError) {
    return (
      <SafeAreaView style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Text style={{ color: 'red', fontSize: 24, textAlign: 'center' }}>There is an error</Text>
      </SafeAreaView>
    );
  }

  return (
    <SafeAreaView style={{ flex: 1, backgroundColor: 'white' }}>
      <AppBar title="Bus Stops">
        <View style={{ flexDirection: 'row', alignItems: 'center', justifyContent: 'space-between', paddingHorizontal: 16 }}>
          {/* Optional BellIcon */}
        </View>
      </AppBar>
      <View style={{ alignItems: 'center', marginVertical: 16 }}>
        <SearchBar placeholder="Search bus stops" />
      </View>
      <View
        style={{
          flexDirection: 'row',
          justifyContent: 'space-between',
          paddingHorizontal: 16,
          marginBottom: 12,
        }}
      >
        <Text style={{ fontSize: 18, color: '#5C5B5A', fontWeight: '600' }}>
          Bus Stops
        </Text>
        <TouchableOpacity
          style={{ flexDirection: 'row', alignItems: 'center' }}
          onPress={() => setModalVisible(true)}
        >
          <Text
            style={{
              fontSize: 16,
              color: '#5C5B5A',
              fontWeight: '600',
              marginRight: 4,
            }}
          >
            Sort by
          </Text>
          <DropDownIcon color="#5C5B5A" size={18} />
        </TouchableOpacity>
      </View>
      <ScrollView
        style={{ flex: 1, backgroundColor: 'white', paddingHorizontal: 16 }}
      >
        <List
          items={busStopsQuery.data}
          sourceName="busStop"
          ItemComponent={BusStopItem}
        />
      </ScrollView>
      <SortOptionsModal
        isVisible={modalVisible}
        selectedOption={selectedOption}
        onOptionSelect={(option) => {
          setSelectedOption(option);
          setModalVisible(false);
        }}
        onCancel={() => setModalVisible(false)}
      />
    </SafeAreaView>
  );
}