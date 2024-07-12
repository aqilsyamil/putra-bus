import { TabBarIcon } from "@/components/navigation/TabBarIcon";
import { Tabs } from "expo-router";

export default function TabsLayout() {
  return (
    <Tabs
      screenOptions={{
        tabBarStyle: {
          height: 75,
          paddingTop: 10

        },
        tabBarLabelStyle: {
          fontSize: 12,
          fontFamily: 'Poppins_500Medium',
          marginTop: 3
        },
        tabBarActiveTintColor: "#CB234C",
        headerShown: false,
      }}>
      <Tabs.Screen redirect name="index" />
        <Tabs.Screen
        name="navigation"
        options={{
          title: 'Navigation',
          tabBarIcon: ({ color, focused }) => (
            <TabBarIcon color={color} name="navigation" />
          ),
        }}
      />
      <Tabs.Screen
        name="bus-routes"
        options={{
          title: 'Routes',
          tabBarIcon: ({ color, focused }) => (
            <TabBarIcon color={color} name="bus-routes" />
          ),
        }}
      />
      <Tabs.Screen
        name="bus-stops"
        options={{
          title: 'Stops',
          tabBarIcon: ({ color, focused }) => (
            <TabBarIcon color={color} name="bus-stops" />
          ),
        }}
      />
      <Tabs.Screen
        name="more"
        options={{
          title: 'More',
          tabBarIcon: ({ color, focused }) => (
            <TabBarIcon color={color} name="more" />
          ),
        }}
      />
    </Tabs>
  );
}
