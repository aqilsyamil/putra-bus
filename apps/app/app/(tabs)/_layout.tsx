import { TabBarIcon } from "@/components/navigation/TabBarIcon";
import { Tabs } from "expo-router";

export default function TabsLayout() {
  return (
    <Tabs
      screenOptions={{
        tabBarStyle: {
          height: 55,
        },
        tabBarActiveTintColor: "#CB234C",
        headerShown: false,
      }}>
      <Tabs.Screen
      name="index"
      options={{
        href: null,
      }}/>
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
            <TabBarIcon color={color} name="more"/>
          ),
        }}
      />
    </Tabs>
  );
}
