interface IParams {
    id: string | undefined;
}

interface IParamsRouteLink {
    routeId: string,
    linkId: string | undefined
}

interface IParamsRouteLinkWaylink {
    routeId: string | undefined,
    linkId: string,
    waylinkId: string | undefined
}

interface IBusRouteWayLink {
  id: string,
  start_waypoint_latitude: number,
  start_waypoint_longitude: number,
  end_waypoint_latitude: number,
  end_waypoint_longitude: number
}

interface IBusRouteLink {
  id: string,
  name: string,
  start_bus_stop_id: string,
  end_bus_stop_id: string,
  waylinks: IBusRouteWayLink[]
}

interface IBusRoute {
  id: string,
  name: string,
  links: IBusRouteLink[]
}

export { IParams, IParamsRouteLink, IParamsRouteLinkWaylink, IBusRoute };
