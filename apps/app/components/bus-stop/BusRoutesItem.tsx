import { BusStop } from "@/types/data";
import { View, Text, StyleSheet } from "react-native";
import BusRoutesItemNumberIcon from '../../icons/BusRoutesItemNumberIcon';
import colors from "@/constants/colors";
import ArrowRightIcon from "@/icons/ArrowRightIcon";

interface BusStopRoutesProps {
  busStop?: BusStop;
}

export default function BusRoutesItem({ busStop }: BusStopRoutesProps): JSX.Element {

  return (
    <View style={styles.container}>
      <View style={styles.container}>
        <BusRoutesItemNumberIcon number={1} />
        <Text style={styles.text}>Route 1</Text>
      </View>
      <ArrowRightIcon />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row',
    padding: 16,
    gap: 8,
    alignItems: 'center'
  },
  text: {
    fontFamily: 'Poppins-SemiBold',
    fontSize: 20,
    color: colors.neutral[400]
  }
})
