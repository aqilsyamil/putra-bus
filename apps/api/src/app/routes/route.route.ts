import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams, IParamsRouteLink, IParamsRouteLinkWaylink } from "../interfaces/interface";
import { PrismaClient, route, link } from '@prisma/client';

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance) {

  /**
   * GET all available route
   */
  fastify.get(
  '/routes',
  {
    schema: {
      description: "This endpoint provides information on all of the available routes, including unique IDs, and names.",
      tags: ["Route"],
      summary: "Get all available routes",
      response: {
        200: {
          description: "Successful response",
          type: "array",
          items: {
            type: "object",
            properties: {
              id: {
                type: "string",
                description: "A unique identifier for the route."
              },
              name: {
                type: "string",
                description: "The full name of the route, providing descriptive information for the route."
              },
            }
          }
        }
      }
    }
  },
  async function () {
      try {

        const routes = await prisma.route.findMany()

        return routes;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * GET specific route by id
   */
  fastify.get(
  '/routes/:id',
  {
    schema: {
      description: "This endpoint provides information on specific route, including unique IDs, and names.",
      tags: ["Route"],
      summary: "Get specific route by id",
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the route."
            },
            name: {
              type: "string",
              description: "The full name of the route, providing descriptive information for the route."
            },
          }
        }
      }
    }
  },
  async function (
      request: FastifyRequest<{ Params: IParams }>,
  ) {

        const { id } = request.params;

        try {

          const route = await prisma.route.findUnique({
            where: {
              id: id,
            },
          })

          return route;

        } catch (error) {

          console.error(error);

        }
    }
  );

  /**
   * ADD a new route
   */
  fastify.post(
  '/routes',
  {
    schema: {
      description: "This endpoint allows you to add a new route. This endpoint requires request body of route information with the following properties in order to add a new route: id and name",
      tags: ["Route"],
      summary: "Add a new route",
      body: {
        type: "object",
        properties: {
          id: {
            type: "string",
            description: "A unique identifier for the route."
          },
          name: {
            type: "string",
            description: "The full name of the route, providing descriptive information for the route."
          },
        }
      },
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the route."
            },
            name: {
              type: "string",
              description: "The full name of the route, providing descriptive information for the route."
            },
          }
        }
      }
    }
  },
  async function (
      request: FastifyRequest<{
          Body: route;
      }>,
  ) {

      const { id, name } = request.body;

      try {

        const addedRoute = await prisma.route.create({
          data: {
            id: id,
            name: name
          }
        })

        return addedRoute;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * UPDATE / REPLACE / CREATE a route information by id
   */
  fastify.put(
  '/routes/:id',
  {
    schema: {
      description: "This endpoint allows you to replace, update or create a route by id. This endpoint requires request body of route information with the following properties in order to update the specific route: name. Essentially, this endpoints allows you to replace with existing one, if it doesn't exist, it will create a new one. This endpoint requires the route ID as a parameter.",
      tags: ["Route"],
      summary: "Replace, update or create route by id",
      body: {
        type: "object",
        properties: {
          name: {
            type: "string",
            description: "The full name of the route, providing descriptive information for the route."
          },
        }
      },
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the route."
            },
            name: {
              type: "string",
              description: "The full name of the route, providing descriptive information for the route."
            },
          }
        }
      }
    }
  },
  async function (
    request: FastifyRequest<{
        Params: IParams;
        Body: route;
    }>
  ) {

    const { id } = request.params;
    const { name } = request.body;


    try {

      const updatedRoute = await prisma.route.update({
        where: { id: id },
        data: {
          name: name
        },
      })

      return updatedRoute;

    } catch (error) {

      console.error(error);

    }
  }
  );

  /**
   * UPDATE route information partially by id
   */
  fastify.patch(
    '/routes/:id',
    {
      schema: {
        description: "This endpoint allows you to replace or update a route information partially by id. This endpoint requires request body of route information with the following properties in order to update the specific route: name. Essentially, this endpoints allows you to update or replace only parts of the existing route information. This endpoint requires the route ID as a parameter.",
        tags: ["Route"],
        summary: "Replace or update route partially by id",
        body: {
          type: "object",
          properties: {
            name: {
              type: "string",
              description: "The full name of the route, providing descriptive information for the route."
            },
          }
        },
        response: {
          200: {
            description: "Successful response",
            type: "object",
            properties: {
              id: {
                type: "string",
                description: "A unique identifier for the route."
              },
              name: {
                type: "string",
                description: "The full name of the route, providing descriptive information for the route."
              },
            }
          }
        }
      }
    },
    async function (
      request: FastifyRequest<{
          Params: IParams;
          Body: route;
      }>
    ) {

      const { id } = request.params;
      const { name } = request.body;

      try {

        const updatedRoute = await prisma.route.update({
          where: { id: id },
          data: {
            name: name
          },
        })

        return updatedRoute;

      } catch (error) {

        console.error(error);

      }
    }
  );

  /**
   * DELETE route by id
   */
  fastify.delete(
  '/routes/:id',
  {
    schema: {
      description: "This endpoint delete existing route by id. This endpoint requires the route ID as a parameter.",
      tags: ["Route"],
      summary: "Delete route by id",
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the route."
            },
            name: {
              type: "string",
              description: "The full name of the route, providing descriptive information for the route."
            },
          }
        }
      }
    }
  },
  async function (
  request: FastifyRequest<{
      Params: IParams;
    }>
  ) {

    const { id } = request.params;

    try {

      const deletedRoute = await prisma.route.delete({
        where: {
            id: id,
        },
      })

      return deletedRoute;

    } catch (error) {

        console.error(error);

    }

  }
  )

  /**
   * GET all links for a specific route by route id
   */
  fastify.get(
  '/routes/:id/links',
  {
    schema: {
      description: "This endpoint provides information of links on a specific route by route id, including unique IDs, names, IDs of start and end bus stops. This endpoint requires the route ID as a parameter.",
      tags: ["Route"],
      summary: "Get all links for a specific route by route id",
      response: {
        200: {
          description: "Successful response",
          type: "array",
          items: {
            type: "object",
            properties: {
              id: {
                type: "string",
                description: "A unique identifier for the link."
              },
              name: {
                type: "string",
                description: "The full name of the link, providing descriptive information for the link."
              },
              start_bus_stop_id: {
                type: "string",
                description: "A unique identifier for the start bus stop."
              },
              end_bus_stop_id: {
                type: "string",
                description: "A unique identifier for the end bus stop."
              },
            }
          }
        }
      }
    }
  },
  async function (
    request: FastifyRequest<{ Params: IParams }>,
  ) {

    const { id } = request.params;

    try {

      const links = await prisma.link.findMany({
        where: {
          route_link: {
            some: {
              route_id: id
            }
          }
        }
      })

      return links;

    } catch (error) {

      console.error(error);

    }
  }
  );

  /**
   * GET a link for a specific route by route id and link id
   */
  fastify.get(
  '/routes/:routeId/links/:linkId',
  {
    schema: {
      description: "This endpoint provides information on a specific link of a route by route id and link id, which includes unique ID, name, ID of start and end bus stop. This endpoint requires the route ID and link ID as parameters.",
      tags: ["Route"],
      summary: "Get specific link of a route by route id and link id",
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the link."
            },
            name: {
              type: "string",
              description: "The full name of the link, providing descriptive information for the link."
            },
            start_bus_stop_id: {
              type: "string",
              description: "A unique identifier for the start bus stop."
            },
            end_bus_stop_id: {
              type: "string",
              description: "A unique identifier for the end bus stop."
            },
          }
        }
      }
    }
  },
  async function (
    request: FastifyRequest<{ Params: IParamsRouteLink }>,
  ) {

    const { routeId, linkId } = request.params;

    try {

      const link = await prisma.link.findUnique({
        where: {
          id: linkId,
          route_link: {
            some: {
              route_id: routeId
            }
          }
        }
      })

      return link;

    } catch (error) {

      console.error(error);

    }
  }
  )

  /**
   * ADD a new link for a specific route by route id
   */
  fastify.post(
  '/routes/:routeId/links',
  {
    schema: {
      description: "This endpoint adds a new link for a specific route by route id, which includes unique ID, name, ID of start and end bus stop. This endpoint requires the route ID and link ID as parameters.",
      tags: ["Route"],
      summary: "Add a new link for a specific route by route id",
      body: {
        type: "object",
        properties: {
          id: {
            type: "string",
            description: "A unique identifier for the link."
          },
          name: {
            type: "string",
            description: "The full name of the link, providing descriptive information for the link."
          },
          start_bus_stop_id: {
            type: "string",
            description: "A unique identifier for the start bus stop."
          },
          end_bus_stop_id: {
            type: "string",
            description: "A unique identifier for the end bus stop."
          },
        }
      },
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the link."
            },
            name: {
              type: "string",
              description: "The full name of the link, providing descriptive information for the link."
            },
            start_bus_stop_id: {
              type: "string",
              description: "A unique identifier for the start bus stop."
            },
            end_bus_stop_id: {
              type: "string",
              description: "A unique identifier for the end bus stop."
            },
          }
        }
      }
    }
  },
  async function (
      request: FastifyRequest<{
          Params: IParamsRouteLink;
          Body: link;
      }>,
  ) {

      const { routeId  } = request.params;
      const { id, name, start_bus_stop_id, end_bus_stop_id } = request.body;

      try {

        const addedLink = await prisma.link.create({
          data: {
            id: id,
            name: name,
            start_bus_stop_id: start_bus_stop_id,
            end_bus_stop_id: end_bus_stop_id,
            route_link: {
              create: [
                {
                  id: id,
                  route_id: routeId
                }
              ]
            }
          }
        })

        return addedLink;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * GET all waylinks for a specific route and link by route id and link id
   */
  fastify.get(
    '/routes/:routeId/links/:linkId/waylinks',
    {
      schema: {
        description: "This endpoint provides information of waylinks on a specific route and link by route id and link id. These includes unique IDs, start and end waypoint latitudes and longitudes. This endpoint requires the route ID and link ID as a parameter.",
        tags: ["Route"],
        summary: "Get all waylinks for a specific route and link by route id and link id",
        response: {
          200: {
            description: "Successful response",
            type: "array",
            items: {
              type: "object",
              properties: {
                id: {
                  type: "string",
                  description: "A unique identifier for the waylink."
                },
                start_waypoint_latitude: {
                  type: "number",
                  description: "The latitude of the start waypoint."
                },
                start_waypoint_longitude: {
                  type: "number",
                  description: "The longitude of the start waypoint."
                },
                end_waypoint_latitude: {
                  type: "number",
                  description: "The latitude of the end waypoint."
                },
                end_waypoint_longitude: {
                  type: "number",
                  description: "The longitude of the end waypoint."
                }
              }
            }
          }
        }
      }
    },
    async function (
      request: FastifyRequest<{ Params: IParamsRouteLinkWaylink }>,
    ) {

      const { routeId, linkId } = request.params;

      try {

        const waylinks = await prisma.waylink.findMany({
          where: {
            link_waylink: {
              some: {
                link_id: linkId,
                link: {
                  route_link: {
                    some: {
                      route_id: routeId
                    }
                  }
                }
              }
            }
          }
        })

        return waylinks;

      } catch (error) {

        console.error(error);

      }
    }
  );

  /**
   * GET a waylink for a specific route and link by route id, link id and waylink id
   */
  fastify.get(
  '/routes/:routeId/links/:linkId/waylinks/:waylinkId',
  {
    schema: {
      description: "This endpoint provides information on specific waylink. This includes unique IDs, start and end waypoint latitudes and longitudes. This endpoint requires the route ID, link ID and waylink ID as a parameter.",
      tags: ["Route"],
      summary: "Get a waylink for a specific route and link by route id, link id and waylink id",
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the waylink."
            },
            start_waypoint_latitude: {
              type: "number",
              description: "The latitude of the start waypoint."
            },
            start_waypoint_longitude: {
              type: "number",
              description: "The longitude of the start waypoint."
            },
            end_waypoint_latitude: {
              type: "number",
              description: "The latitude of the end waypoint."
            },
            end_waypoint_longitude: {
              type: "number",
              description: "The longitude of the end waypoint."
            }
          }
        }
      }
    }
  },
  async function (
    request: FastifyRequest<{ Params: IParamsRouteLinkWaylink }>,
  ) {

    const { routeId, linkId, waylinkId } = request.params;

    try {

      const waylinks = await prisma.waylink.findUnique({
        where: {
          id: waylinkId,
          link_waylink: {
            some: {
              link_id: linkId,
              link: {
                route_link: {
                  some: {
                    route_id: routeId
                  }
                }
              }
            }
          }
        }
      })

      return waylinks;


    } catch (error) {

      console.error(error);

    }
  }
  )
}
