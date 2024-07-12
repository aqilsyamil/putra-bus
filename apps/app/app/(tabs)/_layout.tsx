import { Tabs } from 'expo-router';
import React from 'react';

import { TabBarIcon } from '@/components/navigation/TabBarIcon';
import { Colors } from '@/constants/Colors';
import { useColorScheme } from '@/hooks/useColorScheme';
import {  useFonts, Poppins_500Medium } from '@expo-google-fonts/poppins';

export default function TabLayout() {
  const colorScheme = useColorScheme();

  let [fontsLoaded] = useFonts({
    Poppins_500Medium,
  });

  if (!fontsLoaded) {
    return null;
  }

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
