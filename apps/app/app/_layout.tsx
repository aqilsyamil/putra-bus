import { ReactQueryDevtools } from "@tanstack/react-query-devtools";

import { NativeWindStyleSheet } from "nativewind";
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { Stack } from 'expo-router';
import * as SplashScreen from 'expo-splash-screen';
import { useEffect } from "react";
import { useFonts } from 'expo-font';
import fonts from "@/constants/fonts";

// Prevent the splash screen from auto-hiding before asset loading is complete.
// SplashScreen.preventAutoHideAsync();

NativeWindStyleSheet.setOutput({
  default: "native",
});

export default function RootLayout() {

  const [loaded, error] = useFonts(fonts);

  useEffect(() => {
    if (loaded || error) {
      SplashScreen.hideAsync();
    }
  }, [loaded, error]);

  if (!loaded && !error) {
    return null;
  }

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
      <Stack>
        <Stack.Screen
        name="(tabs)"
        options={{
          headerShown: false
        }} />
      </Stack>

      {/* <ReactQueryDevtools initialIsOpen={false} /> */}
    </QueryClientProvider>
  );
}
