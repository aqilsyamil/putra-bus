import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "../interfaces/interface";
import { PrismaClient, driver_bus } from "@prisma/client";

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance) {

  /**
   * GET all available active bus
   */
  fastify.get(
  '/active-buses',
  {
    schema: {
      description: "This endpoint provides information on all of the available active buses, including unique IDs, driver IDs, bus IDs, latitude and longitude coordinates, and occupancy status.",
      tags: ["Active Bus"],
      summary: "Get all available active buses",
      response: {
        200: {
          description: "Successful response",
          type: "array",
          items: {
            type: "object",
            properties: {
              id: {
                type: "string",
                description: "A unique identifier for the active bus."
              },
              driver_id: {
                type: "string",
                description: "The unique identifier of the driver who's on duty assign with the active bus."
              },
              bus_id: {
                type: "string",
                description: "The unique identifier of the active bus"
              },
              bus_latitude: {
                type: "number",
                description: "The latitude coordinate of the active bus's location, facilitating precise mapping and navigation."
              },
              bus_longitude: {
                type: "number",
                description: "The longitude coordinate of the active bus's location, essential for accurate geolocation and routing."
              },
              occupancy_status: {
                type: "string",
                description: "The occupancy status of the active bus, indicating whether it is fully occupied (high), partially occupied (m) or low on seats."
              }
            }
          }
        }
      }
    }
  },
  async function () {
      try {

        const activeBuses = await prisma.driver_bus.findMany()

        return activeBuses;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * GET specific active bus by id
   */
  fastify.get(
  '/active-bus/:id',
  {
    schema: {
      description: "This endpoint provides information on specific active bus, including unique IDs, driver IDs, bus IDs, latitude and longitude coordinates, and occupancy status. This endpoint requires the active bus ID as a parameter.",
      tags: ["Active Bus"],
      summary: "Get specific active bus by id",
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the active bus."
            },
            driver_id: {
              type: "string",
              description: "The unique identifier of the driver who's on duty assign with the active bus."
            },
            bus_id: {
              type: "string",
              description: "The unique identifier of the active bus"
            },
            bus_latitude: {
              type: "number",
              description: "The latitude coordinate of the active bus's location, facilitating precise mapping and navigation."
            },
            bus_longitude: {
              type: "number",
              description: "The longitude coordinate of the active bus's location, essential for accurate geolocation and routing."
            },
            occupancy_status: {
              type: "string",
              description: "The occupancy status of the active bus, indicating whether it is fully occupied (high), partially occupied (m) or low on seats."
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

          const activeBus = await prisma.driver_bus.findUnique({
            where: {
              id: id,
            },
          })

          return activeBus;

        } catch (error) {

          console.error(error);

        }
    }
  );

  /**
   * ADD a new active bus
   */
  fastify.post(
  '/active-bus',
  {
    schema: {
      description: "This endpoint allows you to add a new active bus. This endpoint requires request body of active bus information with the following properties in order to add a new active bus: id, driver_id, bus_id, bus_latitude, bus_longitude, occupancy_status.",
      tags: ["Active Bus"],
      summary: "Add a new active bus",
      body: {
        type: "object",
        properties: {
          id: {
            type: "string",
            description: "A unique identifier for the active bus."
          },
          driver_id: {
            type: "string",
            description: "The unique identifier of the driver who's on duty assign with the active bus."
          },
          bus_id: {
            type: "string",
            description: "The unique identifier of the active bus"
          },
          bus_latitude: {
            type: "number",
            description: "The latitude coordinate of the active bus's location, facilitating precise mapping and navigation."
          },
          bus_longitude: {
            type: "number",
            description: "The longitude coordinate of the active bus's location, essential for accurate geolocation and routing."
          },
          occupancy_status: {
            type: "string",
            description: "The occupancy status of the active bus, indicating whether it is fully occupied (high), partially occupied (m) or low on seats."
          }
        }
      },
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the active bus."
            },
            driver_id: {
              type: "string",
              description: "The unique identifier of the driver who's on duty assign with the active bus."
            },
            bus_id: {
              type: "string",
              description: "The unique identifier of the active bus"
            },
            bus_latitude: {
              type: "number",
              description: "The latitude coordinate of the active bus's location, facilitating precise mapping and navigation."
            },
            bus_longitude: {
              type: "number",
              description: "The longitude coordinate of the active bus's location, essential for accurate geolocation and routing."
            },
            occupancy_status: {
              type: "string",
              description: "The occupancy status of the active bus, indicating whether it is fully occupied (high), partially occupied (m) or low on seats."
            }
          }
        }
      }
    }
  },
  async function (
      request: FastifyRequest<{
          Body: driver_bus;
      }>,
  ) {

      const { id, driver_id, bus_id, bus_latitude, bus_longitude, occupancy_status } = request.body;

      try {

        const addedActiveBus = await prisma.driver_bus.create({
          data: {
            id: id,
            driver_id: driver_id,
            bus_id: bus_id,
            bus_latitude: bus_latitude,
            bus_longitude: bus_longitude,
            occupancy_status: occupancy_status
          }
        })

        return addedActiveBus;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * UPDATE / REPLACE / CREATE an active bus information by id
   */
  fastify.put(
  '/active bus/:id',
  {
    schema: {
      description: "This endpoint allows you to replace, update or create an active bus by id. This endpoint requires request body of active bus information with the following properties in order to update the specific active bus: driver_id, bus_id, bus_latitude, bus_longitude, occupancy_status. Essentially, this endpoints allows you to replace with existing one, if it doesn't exist, it will create a new one. This endpoint requires the active bus ID as a parameter.",
      tags: ["Active Bus"],
      summary: "Replace, update or create active bus by id",
      body: {
        type: "object",
        properties: {
          driver_id: {
            type: "string",
            description: "The unique identifier of the driver who's on duty assign with the active bus."
          },
          bus_id: {
            type: "string",
            description: "The unique identifier of the active bus"
          },
          bus_latitude: {
            type: "number",
            description: "The latitude coordinate of the active bus's location, facilitating precise mapping and navigation."
          },
          bus_longitude: {
            type: "number",
            description: "The longitude coordinate of the active bus's location, essential for accurate geolocation and routing."
          },
          occupancy_status: {
            type: "string",
            description: "The occupancy status of the active bus, indicating whether it is fully occupied (high), partially occupied (m) or low on seats."
          }
        }
      },
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the active bus."
            },
            driver_id: {
              type: "string",
              description: "The unique identifier of the driver who's on duty assign with the active bus."
            },
            bus_id: {
              type: "string",
              description: "The unique identifier of the active bus"
            },
            bus_latitude: {
              type: "number",
              description: "The latitude coordinate of the active bus's location, facilitating precise mapping and navigation."
            },
            bus_longitude: {
              type: "number",
              description: "The longitude coordinate of the active bus's location, essential for accurate geolocation and routing."
            },
            occupancy_status: {
              type: "string",
              description: "The occupancy status of the active bus, indicating whether it is fully occupied (high), partially occupied (m) or low on seats."
            }
          }
        }
      }
    }
  },
  async function (
    request: FastifyRequest<{
        Params: IParams;
        Body: driver_bus;
    }>
  ) {

    const { id } = request.params;
    const { driver_id, bus_id, bus_latitude, bus_longitude, occupancy_status } = request.body;


    try {

      const updatedActiveBus = await prisma.driver_bus.update({
        where: { id: id },
        data: {
          driver_id: driver_id,
          bus_id: bus_id,
          bus_latitude: bus_latitude,
          bus_longitude: bus_longitude,
          occupancy_status: occupancy_status
        },
      })

        return updatedActiveBus;

    } catch (error) {

      console.error(error);

    }
  }
  );

  /**
   * UPDATE active bus information partially by id
   */
  fastify.patch(
    '/active bus/:id',
    {
      schema: {
        description: "This endpoint allows you to replace or update an active bus information partially by id. This endpoint requires request body of active bus information with the following properties in order to update the specific active bus: full name, phone number, password and photo URL path. Essentially, this endpoints allows you to update or replace only parts of the existing active bus information. This endpoint requires the active bus ID as a parameter.",
        tags: ["Active Bus"],
        summary: "Replace or update active bus partially by id",
        body: {
          type: "object",
          properties: {
            driver_id: {
              type: "string",
              description: "The unique identifier of the driver who's on duty assign with the active bus."
            },
            bus_id: {
              type: "string",
              description: "The unique identifier of the active bus"
            },
            bus_latitude: {
              type: "number",
              description: "The latitude coordinate of the active bus's location, facilitating precise mapping and navigation."
            },
            bus_longitude: {
              type: "number",
              description: "The longitude coordinate of the active bus's location, essential for accurate geolocation and routing."
            },
            occupancy_status: {
              type: "string",
              description: "The occupancy status of the active bus, indicating whether it is fully occupied (high), partially occupied (m) or low on seats."
            }
          }
        },
        response: {
          200: {
            description: "Successful response",
            type: "object",
            properties: {
              id: {
                type: "string",
                description: "A unique identifier for the active bus."
              },
              driver_id: {
                type: "string",
                description: "The unique identifier of the driver who's on duty assign with the active bus."
              },
              bus_id: {
                type: "string",
                description: "The unique identifier of the active bus"
              },
              bus_latitude: {
                type: "number",
                description: "The latitude coordinate of the active bus's location, facilitating precise mapping and navigation."
              },
              bus_longitude: {
                type: "number",
                description: "The longitude coordinate of the active bus's location, essential for accurate geolocation and routing."
              },
              occupancy_status: {
                type: "string",
                description: "The occupancy status of the active bus, indicating whether it is fully occupied (high), partially occupied (m) or low on seats."
              }
            }
          }
        }
      }
    },
    async function (
      request: FastifyRequest<{
          Params: IParams;
          Body: driver_bus;
      }>
    ) {

      const { id } = request.params;
      const { driver_id, bus_id, bus_latitude, bus_longitude, occupancy_status } = request.body;

      try {

        const updatedActiveBus = await prisma.driver_bus.update({
          where: { id: id },
          data: {
            driver_id: driver_id,
            bus_id: bus_id,
            bus_latitude: bus_latitude,
            bus_longitude: bus_longitude,
            occupancy_status: occupancy_status
          },
        })

        return updatedActiveBus;

      } catch (error) {

        console.error(error);

      }
    }
  );

  /**
   * DELETE active bus by id
   */
  fastify.delete(
  '/active bus/:id',
  {
    schema: {
      description: "This endpoint delete existing active bus by id. This endpoint requires the active bus ID as a parameter.",
      tags: ["Active Bus"],
      summary: "Delete active bus by id",
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the active bus."
            },
            driver_id: {
              type: "string",
              description: "The unique identifier of the driver who's on duty assign with the active bus."
            },
            bus_id: {
              type: "string",
              description: "The unique identifier of the active bus"
            },
            bus_latitude: {
              type: "number",
              description: "The latitude coordinate of the active bus's location, facilitating precise mapping and navigation."
            },
            bus_longitude: {
              type: "number",
              description: "The longitude coordinate of the active bus's location, essential for accurate geolocation and routing."
            },
            occupancy_status: {
              type: "string",
              description: "The occupancy status of the active bus, indicating whether it is fully occupied (high), partially occupied (m) or low on seats."
            }
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

      const deletedActiveBus = await prisma.driver_bus.delete({
        where: {
            id: id,
        },
      })

      return deletedActiveBus;

    } catch (error) {

        console.error(error);

    }

  }
  )
}
