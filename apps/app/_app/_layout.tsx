import { DefaultTheme, ThemeProvider } from '@react-navigation/native';
import { Stack } from 'expo-router';
import * as SplashScreen from 'expo-splash-screen';
import React from 'react';
import 'react-native-reanimated';

// Prevent the splash screen from auto-hiding before asset loading is complete.
SplashScreen.preventAutoHideAsync();

import { NativeWindStyleSheet } from "nativewind";
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";
import { View, Text } from 'react-native';

NativeWindStyleSheet.setOutput({
  default: "native",
});

export default function RootLayout() {

  const queryClient = new QueryClient({
    defaultOptions: {
      queries: {
        retry: 5,
        retryDelay: 1000
      },
    }
  })

  return (
    <QueryClientProvider client={queryClient}>
      {/* <ThemeProvider value={DefaultTheme}> */}
        {/* <Stack>
          <Stack.Screen name="(tabs)" options={{ headerShown: false }} />
          <Stack.Screen name="+not-found" />
        </Stack> */}

    <View>
      <Text className="text-slate-800 text-3xl">Hello</Text>
    </View>

        {/* <ReactQueryDevtools initialIsOpen={false} /> */}
      {/* </ThemeProvider> */}
    </QueryClientProvider>
  );
}
