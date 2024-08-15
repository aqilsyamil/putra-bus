import React from 'react';
import { View, Text, StyleSheet, FlatList } from 'react-native';

const busStops = [
  { name: 'College of Tenth', code: 'Uncoded' },
  { name: 'Faculty of Design & Architecture', code: 'Uncoded' },
  { name: 'Faculty of Modern Languages & Communication', code: 'SJ144' },
  { name: 'Faculty of Computer Science & Information Technology', code: 'SJ155' },
  { name: 'Faculty of Science', code: 'SJ159' },
  { name: 'Library of Sultan Abdul Samad', code: 'SJ160' },
  { name: 'Faculty of Environmental Studies', code: 'SJ151' },
  { name: 'Central (Opp Great Hall)', code: 'SJ153' },
  { name: 'Academic Complex A (Opp FBMK)', code: 'SJ169' },
  { name: 'Faculty of Design & Architecture', code: 'Uncoded' },
];


export default function TransitLineThree() {
  return (
    <FlatList
      data={busStops}
      keyExtractor={(item, index) => index.toString()}
      renderItem={({ item, index }) => (
        <View style={styles.itemContainer}>
          <View style={styles.timelineContainer}>
            <View
              style={[
                styles.circle,
                index === 0 ? styles.startCircle : index === busStops.length - 1 ? styles.endCircle : styles.regularCircle,
              ]}
            >
              {index === 0 ? (
                <Text style={styles.circleText}>S</Text>
              ) : index === busStops.length - 1 ? (
                <Text style={styles.circleText}>E</Text>
              ) : null}
            </View>
            {index !== busStops.length - 1 && <View style={styles.line} />}
          </View>
          <View style={styles.textContainer}>
            <Text style={styles.stopName}>{item.name}</Text>
            <Text style={styles.stopCode}>{item.code}</Text>
          </View>
        </View>
      )}
    />
  );
}

const styles = StyleSheet.create({
  itemContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingVertical: 20,
    paddingHorizontal: 20,
  },
  timelineContainer: {
    alignItems: 'center',
    marginRight: 20,
    position: 'relative', 
  },
  circle: {
    width: 24,
    height: 24,
    borderRadius: 12,
    justifyContent: 'center',
    alignItems: 'center',
    zIndex: 1,
  },
  startCircle: {
    backgroundColor: '#FF9D1A',
  },
  endCircle: {
    backgroundColor: '#FF9D1A',
  },
  regularCircle: {
    backgroundColor: '#FFFFFF',
    borderWidth: 3,
    borderColor: '#FF9D1A',
  },
  line: {
    width: 3,
    height: 70,
    backgroundColor: '#FF9D1A',
    position: 'absolute',
    top: 24,
    zIndex: 0,
  },
  textContainer: {
    flex: 1,
  },
  stopName: {
    fontSize: 16,
    fontWeight: 'bold',
  },
  stopCode: {
    fontSize: 12,
    color: '#A3A3A3',
  },
  circleText: {
    color: '#FFFFFF',
    fontWeight: 'bold',
  },
});
