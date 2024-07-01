import React, { useCallback, useMemo, useRef } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import BottomSheet, { BottomSheetView } from '@gorhom/bottom-sheet';
import List from '@/components/List';
import BusRoutesItem from '@/components/bus-stop/BusRoutesItem';
import { ScrollView } from 'react-native-gesture-handler';

export default function BusRoutesPage() {
  // ref
  const bottomSheetRef = useRef<BottomSheet>(null);

  // callbacks
  const handleSheetChanges = useCallback((index: number) => {
    console.log('handleSheetChanges', index);
  }, []);

  // renders
  return (
    <View style={styles.container}>
      <BottomSheet
        snapPoints={[400]}
        ref={bottomSheetRef}
        onChange={handleSheetChanges}
      >
        <BottomSheetView style={styles.contentContainer}>
          <ScrollView>
            <List items={[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]} sourceName="busStop" ItemComponent={BusRoutesItem} />
          </ScrollView>
        </BottomSheetView>
      </BottomSheet>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 24,
    backgroundColor: 'grey',
  },
  contentContainer: {
    flex: 1,
  },
});
