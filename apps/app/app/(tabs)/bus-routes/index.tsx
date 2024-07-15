import React, { useCallback, useMemo, useRef } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import BottomSheet, { BottomSheetView } from '@gorhom/bottom-sheet';
import List from '@/components/List';
import BusRoutesItem from '@/components/bus-stop/BusRoutesItem';
import { ScrollView } from 'react-native-gesture-handler';
import Mapbox from '@rnmapbox/maps';

Mapbox.setAccessToken("sk.eyJ1IjoicmF5aGFuYXN5cmFmZiIsImEiOiJjbHlqemswdDgwNHZmMmxzNmUwMjcyaGR5In0.PvehmdnF3oSAvAgxfMaQlg");

export default function BusRoutesPage() {

  const bottomSheetRef = useRef<BottomSheet>(null);

  const handleSheetChanges = useCallback((index: number) => {
    console.log('handleSheetChanges', index);
  }, []);

  return (
    <View style={styles.container}>
      <Mapbox.MapView
      projection='globe'
      key='mainmap'
      attributionPosition={{ bottom: 165, right: 5 }}
      logoPosition={{ bottom: 165, left: 5 }}
      scaleBarEnabled={false}
      style={styles.map}
      >
        {/* <Mapbox.Camera
        centerCoordinate={[2.9995, 101.7056]}
        /> */}
      </Mapbox.MapView>

      <BottomSheet
        snapPoints={[400]}
        ref={bottomSheetRef}
        onChange={handleSheetChanges}
        style={{
          borderWidth: 0,
          borderTopLeftRadius:15,
          borderTopRightRadius: 15,
          shadowColor: "#000",
          shadowOffset: {
            width: 0,
            height: 2,
          },
          shadowOpacity: 0.25,
          shadowRadius: 3.84,
          elevation: 5,
          }}
      >
        <BottomSheetView style={styles.contentContainer}>
          <ScrollView
          showsVerticalScrollIndicator={false}
          >
            <List items={[1,2,3,4,5,6]} sourceName="busStop" ItemComponent={BusRoutesItem} />
          </ScrollView>
        </BottomSheetView>
      </BottomSheet>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'white',
  },
  contentContainer: {
    flex: 1,
  },
  map: {
    height: '70%',
    width: '100%',
  }
});
