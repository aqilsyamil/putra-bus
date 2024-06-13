interface Bus {
  id: string;
  plateNo: string;
}

interface Driver {
  id: string;
  fullName: string;
  phoneNo: string;
  password: string;
  photoPath: string;
}

interface DriverBus {
  id: string;
  busId: string;
  driverId: string;
  occupancyStatus: string;
  busLongitude: number;
  busLatitude: number;
}

interface BusStop {
  id: string;
  fullName: string;
  shortName: string;
  latitude: number,
  longitude: number,
  imagePath: string
}

interface Link {
  id: string;
  name: string;
  startBusStopId: string;
  endBusStopId: string;
}

interface BusRoute {
  id: string;
  name: string;
}

interface BusRouteLink {
  id: string;
  routeId: string;
  linkId: string;
}

interface Waylink {
  id: string;
  startWaypointLatitude: number;
  startWaypointLongitude: number;
  endWaypointLatitude: number;
  endWaypointLongitude: number;
}

interface LinkWaylink {
  id: string;
  linkId: string;
  waylinkId: string;
}


export { Bus, Driver, DriverBus, BusStop, Link, BusRoute, BusRouteLink, Waylink, LinkWaylink };
