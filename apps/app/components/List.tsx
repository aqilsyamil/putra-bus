import { View } from "react-native";

interface ListProps {
  items: any[];
  sourceName: string;
  ItemComponent: any;
}

export default function List({ items, sourceName, ItemComponent }: ListProps): JSX.Element {

  return (
    <View className="flex flex-col divide-y-[0.1px]">
      {items.map((item, i) => (
        <View key={i} >
          <ItemComponent {...{ [sourceName]: item }} />
        </View>
      ))}
    </View>
  );
}
