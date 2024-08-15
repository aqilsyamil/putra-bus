import { BusStop } from "@/types/data";
import { View, Text, StyleSheet } from "react-native";
import BusRoutesItemNumberIcon from '../../icons/BusRoutesItemNumberIcon';
import colors from "@/constants/colors";
import ArrowRightIcon from "@/icons/ArrowRightIcon";
import BellIcon from "@/icons/BellIcon";

interface BusStopRoutesProps {
  busStop?: BusStop;
  routeName: string;
  routeNumber: number;
}

export default function BusRoutesItem({ busStop, routeName, routeNumber }: BusStopRoutesProps): JSX.Element {

  return (
    <View style={styles.container}>
      <View style={styles.textContainer}>
        <BusRoutesItemNumberIcon number={routeNumber} />
        <Text style={styles.text}>{routeName}</Text>
      </View>
      <ArrowRightIcon />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    flexDirection: 'row',
    paddingHorizontal: 16,
    gap: 8,
    alignItems: 'center',
  },
  textContainer: {
    flex: 1,
    flexDirection: 'row',
    padding: 16,
    gap: 8,
    alignItems: 'center',
  },
  text: {
    fontFamily: 'Poppins-SemiBold',
    fontSize: 20,
    color: colors.neutral[400]
  }
})
