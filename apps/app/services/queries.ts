import { useQuery } from "@tanstack/react-query";
import { getBusStops } from "./api";

const useBusStops = () => {
  return useQuery({
    queryKey: ["bus-stops"],
    queryFn: getBusStops,
    refetchOnWindowFocus: false,
  });
}

export { useBusStops }
