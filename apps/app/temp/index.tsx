import { Text, View } from 'react-native'
import { StatusBar } from 'expo-status-bar'
import React from 'react';

export default function App() {
return (
    <View className="flex-1 items-center justify-center bg-white">
      <Text className='text-3xl font-bold'>Open up App.js to start working on your app!</Text>
      <StatusBar style="light" />
    </View>
  );
}
