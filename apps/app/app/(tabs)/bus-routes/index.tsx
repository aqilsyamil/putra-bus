import React, { useCallback, useRef, useState } from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import BottomSheet, { BottomSheetView } from '@gorhom/bottom-sheet';
import { ScrollView } from 'react-native-gesture-handler';
import Mapbox from '@rnmapbox/maps';
import colors from "@/constants/colors";
import BusRoutesItem from '@/components/bus-stop/BusRoutesItem';
import BellIcon from '@/icons/BellIcon';
import BackwardIcon from '@/icons/BackwardIcon';
import TransitLineOne from '@/components/transit-lines/TransitLineOne';
import TransitLineTwo from '@/components/transit-lines/TransitLineTwo';
import TransitLineThree from '@/components/transit-lines/TransitLineThree';
import TransitLineFour from '@/components/transit-lines/TransitLineFour';
import TransitLineFive from '@/components/transit-lines/TransitLineFive';

Mapbox.setAccessToken("sk.eyJ1IjoicmF5aGFuYXN5cmFmZiIsImEiOiJjbHpxeWtubXMxZHpsMmlyN21sOGJ0eHc0In0.LZz-V5Q4gtkF2JLmlcWF-A");

const busRoutes = [
  { name: "Putra Line", number: 1 },
  { name: "Serumpun Line", number: 2 },
  { name: "Sepuluh Line", number: 3 },
  { name: "Mustaffa Babjee Line", number: 4 },
  { name: "Agro Line", number: 5 }
];

export default function BusRoutesPage() {
  const bottomSheetRef = useRef<BottomSheet>(null);
  const [selectedRoute, setSelectedRoute] = useState(null);
  const [snapPointIndex, setSnapPointIndex] = useState(1); 
  const handleSheetChanges = useCallback((index: number) => {
    console.log('handleSheetChanges', index);
  }, []);

  const handleRouteClick = (route) => {
    setSelectedRoute(route);
    setSnapPointIndex(1); 
    bottomSheetRef.current?.expand();
  };

  const handleBackClick = () => {
    setSelectedRoute(null);
    setSnapPointIndex(1); 
  };

  return (
    <View style={styles.container}>
      <View style={styles.mapContainer}>
        <Mapbox.MapView
          projection='globe'
          key='mainmap'
          attributionPosition={{ bottom: 165, right: 5 }}
          logoPosition={{ bottom: 165, left: 5 }}
          scaleBarEnabled={false}
          style={styles.map}
        >
          <Mapbox.Camera
            centerCoordinate={[101.70799995035749, 3.000991914393954]} 
            zoomLevel={14}
            animationMode="flyTo"
            animationDuration={1000}
          />
        </Mapbox.MapView>
      </View>

      <BottomSheet
        ref={bottomSheetRef}
        snapPoints={['10%', '50%', '100%']}
        index={snapPointIndex} // Use state to control the initial snap point
        onChange={handleSheetChanges}
        enablePanDownToClose={true}
      >
        <BottomSheetView style={styles.contentContainer}>
          {selectedRoute ? (
            <View style={styles.routeDetailContainer}>
              <View style={styles.headerContainer}>
                <TouchableOpacity onPress={handleBackClick} style={styles.backButtonContainer}>
                  <BackwardIcon color="#000000" size={24} />
                </TouchableOpacity>
                <Text style={styles.routeDetailTitle}>{selectedRoute.name}</Text>
              </View>
              {selectedRoute.name === "Putra Line" ? (
                <TransitLineOne />
              ) : selectedRoute.name === "Serumpun Line" ? (
                <TransitLineTwo />
              ) : selectedRoute.name === "Sepuluh Line" ? (
                <TransitLineThree />
              ) : selectedRoute.name === "Mustaffa Babjee Line" ? (
                <TransitLineFour />
              ) : selectedRoute.name === "Agro Line" ? (
                <TransitLineFive />
              ) : (
                <ScrollView showsVerticalScrollIndicator={false}>
                  <Text>Error Can't Open</Text>
                </ScrollView>
              )}
            </View>
          ) : (
            <View>
              <View style={styles.titleContainer}>
                <Text style={styles.title}>Bus Routes</Text>
                <BellIcon color={colors.neutral[400]} size={24} style={styles.bellIcon} />
              </View>
              <ScrollView showsVerticalScrollIndicator={false}>
                {busRoutes.map((route) => (
                  <TouchableOpacity key={route.number} onPress={() => handleRouteClick(route)}>
                    <BusRoutesItem
                      routeName={route.name}
                      routeNumber={route.number}
                    />
                    <View style={styles.divider} />
                  </TouchableOpacity>
                ))}
              </ScrollView>
            </View>
          )}
        </BottomSheetView>
      </BottomSheet>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
  },
  mapContainer: {
    flex: 1, 
  },
  map: {
    flex: 1, 
  },
  bottomSheet: {
    borderWidth: 0,
    borderTopLeftRadius: 15,
    borderTopRightRadius: 15,
    shadowColor: "#000",
    shadowOffset: {
      width: 0,
      height: 2,
    },
    shadowOpacity: 0.25,
    shadowRadius: 3.84,
    elevation: 5,
  },
  contentContainer: {
    flex: 1,
  },
  titleContainer: {
    padding: 16,
    borderBottomWidth: 1,
    borderBottomColor: '#ddd',
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  title: {
    fontSize: 22,
    fontWeight: 'bold',
  },
  bellIcon: {
    marginLeft: 8,
  },
  divider: {
    height: 1,
    backgroundColor: '#ddd',
  },
  routeDetailContainer: {
    padding: 16,
    backgroundColor: 'white',
    flex: 1,
  },
  headerContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    marginBottom: 16,
  },
  routeDetailTitle: {
    fontSize: 22,
    fontWeight: 'bold',
    marginLeft: 16,
  },
  backButtonContainer: {
    marginRight: 16,
  },
});
