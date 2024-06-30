import { Tabs } from 'expo-router';
import React from 'react';

import { TabBarIcon } from '@/components/navigation/TabBarIcon';
import { View, Text } from 'react-native';

export default function TabLayout() {

  return (
    // <Tabs
    //   screenOptions={{
    //     tabBarStyle: {
    //       height: 55,
    //     },
    //     tabBarActiveTintColor: "#CB234C",
    //     headerShown: false,
    //   }}>
    //   <Tabs.Screen redirect name="index" />
    //   <Tabs.Screen
    //     name="navigation"
    //     options={{
    //       title: 'Navigation',
    //       tabBarIcon: ({ color, focused }) => (
    //         <TabBarIcon color={color} name="navigation" />
    //       ),
    //     }}
    //   />
    //   <Tabs.Screen
    //     name="bus-routes"
    //     options={{
    //       title: 'Routes',
    //       tabBarIcon: ({ color, focused }) => (
    //         <TabBarIcon color={color} name="bus-routes" />
    //       ),
    //     }}
    //   />
    //   <Tabs.Screen
    //     name="bus-stops"
    //     options={{
    //       title: 'Stops',
    //       tabBarIcon: ({ color, focused }) => (
    //         <TabBarIcon color={color} name="bus-stops" />
    //       ),
    //     }}
    //   />
    //   <Tabs.Screen
    //     name="more"
    //     options={{
    //       title: 'More',
    //       tabBarIcon: ({ color, focused }) => (
    //         <TabBarIcon color={color} name="more"/>
    //       ),
    //     }}
    //   />
    // </Tabs>
    <View>
      <Text className="text-slate-800 text-3xl">Hello</Text>
    </View>
  );
}
