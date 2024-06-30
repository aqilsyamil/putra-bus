import { Stack } from "expo-router";

export default function BusStopsLayout() {
  return (
    <Stack>
      <Stack.Screen name="index" options={{
        headerShown: false
      }}/>
    </Stack>
  )
}
