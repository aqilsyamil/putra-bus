import React from 'react';
import { View, Text, StyleSheet, FlatList } from 'react-native';

const busStops = [
  { name: 'Serumpun Food Court', code: 'SJ163' },
  { name: 'Institute of Bioscience', code: 'SJ832' },
  { name: 'Faculty of Modern Languages & Communication', code: 'SJ144' },
  { name: 'Faculty of Computer Science & Information Technology', code: 'SJ155' },
  { name: 'Faculty of Science', code: 'SJ159' },
  { name: 'Sultan Abdul Samad Library', code: 'SJ160' },
  { name: 'Faculty of Environmental Studies', code: 'SJ151' },
  { name: 'Central (Opp Great Hall)', code: 'SJ153' },
];


export default function TransitLineTwo() {
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
    backgroundColor: '#00943E',
  },
  endCircle: {
    backgroundColor: '#00943E',
  },
  regularCircle: {
    backgroundColor: '#FFFFFF',
    borderWidth: 3,
    borderColor: '#00943E',
  },
  line: {
    width: 3,
    height: 70,
    backgroundColor: '#00943E',
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
