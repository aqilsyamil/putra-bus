import { Stack } from "expo-router";

export default function BusRoutesLayout() {
  return (
    <Stack>
      <Stack.Screen name="index" options={{
        headerShown: false
      }}/>
    </Stack>
  )
}
