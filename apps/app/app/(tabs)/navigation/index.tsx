import React, { useCallback, useRef, useState } from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import BottomSheet, { BottomSheetView } from '@gorhom/bottom-sheet';
import { ScrollView } from 'react-native-gesture-handler';
import Mapbox, {LocationPuck, Camera, MapView, ShapeSource, SymbolLayer, Images}  from '@rnmapbox/maps';
import { featureCollection, point } from '@turf/helpers';
import busStopList from '@/data/busStopList.json';
// import BusStopsIcon from '@/icons/BusStopsIcon';

Mapbox.setAccessToken("sk.eyJ1IjoicmF5aGFuYXN5cmFmZiIsImEiOiJjbHpxeWtubXMxZHpsMmlyN21sOGJ0eHc0In0.LZz-V5Q4gtkF2JLmlcWF-A");

export default function NavigationPage() {
  const points = busStopList.map((busStopList) => point([busStopList.longitude, busStopList.latitude]));
  
  return (
    <View style={styles.container}>
      <View style={styles.mapContainer}>
        <MapView
          projection='globe'
          key='mainmap'
          attributionPosition={{ bottom: 165, right: 5 }}
          logoPosition={{ bottom: 165, left: 5 }}
          scaleBarEnabled={false}
          style={styles.map}
        >
          <Camera
            followZoomLevel={14}
            animationMode="flyTo"
            animationDuration={1000}
            followUserLocation={true}
          />
          <LocationPuck puckBearingEnabled puckBearing="heading" pulsing={{ isEnabled: true }} />
          <ShapeSource id="busStops" shape={featureCollection(points)}>
            <SymbolLayer id="BusStopsIcon" style={{ 
              iconImage: 'BusStopsIcon', 
              iconSize: 0.09,
              iconAllowOverlap: true,
              }} />
            <Images images={{ BusStopsIcon: require('@/assets/images/busStopsIcons.png') }} />
          </ShapeSource>
        </MapView>
      </View>
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
  matchParent: { flex: 1 }
});
