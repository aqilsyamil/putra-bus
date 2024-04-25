import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "../interfaces/interface";
import { PrismaClient, bus_stop } from "@prisma/client";

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance) {

  /**
   * GET all bus stops
   */
  fastify.get(
  '/bus-stops',
  {
      schema: {
        description: "This endpoint provides information on all university campus bus stops, including unique IDs, full and short names, latitude and longitude coordinates, and image URLs for visual identification.",
        tags: ['Bus Stop'],
        summary: 'Get all available bus stops',
        response: {
          200: {
            description: 'Succesful response',
            type: 'array',
            items: {
              type: 'object',
              properties: {
                id: {
                  type: 'string' ,
                  description: 'A unique identifier for the bus stop.'
                },
                full_name: {
                  type: 'string',
                  description: 'The full name of the bus stop, providing descriptive information about its location or nearby landmarks.'
                },
                short_name: {
                  type: 'string',
                  description: 'A shorter, commonly used name for the bus stop, often used for quick reference or announcements.'
                },
                latitude: {
                  type: 'number',
                  description: 'The latitude coordinate of the bus stop\'s location, facilitating precise mapping and navigation.'
                },
                longitude: {
                  type: 'number',
                  description: 'The longitude coordinate of the bus stop\'s location, essential for accurate geolocation and routing.'
                },
                image_path: {
                  type: 'string',
                  description: 'A URL pointing to the image or picture of the actual bus stop, allowing users to visually identify the stop and its surroundings.'
                }
              }
            }
          }
        }
      }
  },
  async function () {
      try {

        const busStops = await prisma.bus_stop.findMany()

        return busStops;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * GET one bus stop by id
   */
  fastify.get(
  '/bus-stop/:id',
  {
      schema: {
      description: 'Root endpoint',
      tags: ['Bus Stop'],
      // response: {
      //   200: {
      //     description: 'Succesful response',
      //     type: 'object',
      //     properties: {
      //       message: { type: 'string' },
      //       result: { type: 'object', nullable: true }
      //     }
      //   }
      // }
      }
  },
  async function (
      request: FastifyRequest<{ Params: IParams }>,
  ) {

        const { id } = request.params;

        try {

          const busStop = await prisma.bus_stop.findUnique({
            where: {
              id: id,
            },
          })

          return busStop;

        } catch (error) {

          console.error(error);

        }
    }
  );

  /**
   * ADD new bus stop
   */
  fastify.post(
  '/bus-stop',
  {
      schema: {
      description: 'post some data',
      tags: ['Bus Stop'],
      summary: 'qwerty',
      body: {
          type: 'object',
          properties: {
          id: { type: 'string' },
          driver_id: { type: 'string' },
          bus_id: { type: 'string' },
          occupancy_status: { type: 'string' },
          bus_lat: { type: 'number' },
          bus_lng: { type: 'number' },
          }
      },
      // response: {
      //   201: {
      //     description: 'Successful response',
      //     type: 'object',
      //     properties: {
      //       hello: { type: 'string' }
      //     }
      //   },
      //   default: {
      //     description: 'Default response',
      //     type: 'object',
      //     properties: {
      //       foo: { type: 'string' }
      //     }
      //   }
      // }
      }
  },
  async function (
      request: FastifyRequest<{
          Body: bus_stop;
      }>,
  ) {

      const { id, full_name, short_name, latitude, longitude, image_path } = request.body;

      try {

        const addedBusStop = await prisma.bus_stop.create({
          data: {
            id: id,
            full_name: full_name,
            short_name: short_name,
            latitude: latitude,
            longitude: longitude,
            image_path: image_path
          },
        })

        return addedBusStop;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * UPDATE ALL bus stop by id
   */
  fastify.put(
  '/bus-stop/:id',
  {
  schema: {
      description: 'post some data',
      tags: ['Bus Stop'],
      summary: 'qwerty',
      params: {
      type: 'object',
      properties: {
          id: {
          type: 'string',
          description: 'id'
          }
      }
      },
      body: {
      type: 'object',
      properties: {
          driver_id: { type: 'string' },
          bus_id: { type: 'string' },
          occupancy_status: { type: 'string' },
          bus_lat: { type: 'number' },
          bus_lng: { type: 'number' },
      }
      },
      // response: {
      //   201: {
      //     description: 'Successful response',
      //     type: 'object',
      //     properties: {
      //       hello: { type: 'string' }
      //     }
      //   },
      //   default: {
      //     description: 'Default response',
      //     type: 'object',
      //     properties: {
      //       foo: { type: 'string' }
      //     }
      //   }
      // }
  }
  },
  async function (
    request: FastifyRequest<{
        Params: IParams;
        Body: bus_stop;
    }>
  ) {

    const { id } = request.params;
    const { full_name, short_name, latitude, longitude, image_path } = request.body;

    try {

        const updatedBusStop = await prisma.bus_stop.update({
          where: { id: id },
          data: {
            full_name: full_name,
            short_name: short_name,
            latitude: latitude,
            longitude: longitude,
            image_path: image_path
          },
        })

        return updatedBusStop;

    } catch (error) {

      console.error(error);

    }
  }
  );

  /**
   * UPDATE PARTIAL bus stop by id
   */
  fastify.patch(
    '/bus-stop/:id',
    {
    schema: {
        description: 'post some data',
        tags: ['Bus Stop'],
        summary: 'qwerty',
        params: {
        type: 'object',
        properties: {
            id: {
            type: 'string',
            description: 'id'
            }
        }
        },
        body: {
        type: 'object',
        properties: {
            driver_id: { type: 'string' },
            bus_id: { type: 'string' },
            occupancy_status: { type: 'string' },
            bus_lat: { type: 'number' },
            bus_lng: { type: 'number' },
        }
        },
        // response: {
        //   201: {
        //     description: 'Successful response',
        //     type: 'object',
        //     properties: {
        //       hello: { type: 'string' }
        //     }
        //   },
        //   default: {
        //     description: 'Default response',
        //     type: 'object',
        //     properties: {
        //       foo: { type: 'string' }
        //     }
        //   }
        // }
    }
    },
    async function (
      request: FastifyRequest<{
          Params: IParams;
          Body: bus_stop;
      }>
    ) {

      const { id } = request.params;
      const { full_name, short_name, latitude, longitude, image_path } = request.body;

      try {

          const updatedBusStop = await prisma.bus_stop.update({
            where: { id: id },
            data: {
              full_name: full_name,
              short_name: short_name,
              latitude: latitude,
              longitude: longitude,
              image_path: image_path
            },
          })

          return updatedBusStop;

      } catch (error) {

        console.error(error);

      }
    }
  );

  /**
   * DELETE bus stop by id
   */
  fastify.delete(
  '/bus-stop/:id',
  {
  schema: {
      description: 'Root endpoint',
      tags: ['Bus Stop'],
      // response: {
      //   200: {
      //     description: 'Succesful response',
      //     type: 'object',
      //     properties: {
      //       message: { type: 'string' },
      //       result: { type: 'object', nullable: true }
      //     }
      //   }
      // }
  }
  },
  async function (
  request: FastifyRequest<{
      Params: IParams;
    }>
  ) {

    const { id } = request.params;

    try {

        const deletedBusStop = await prisma.bus_stop.delete({
          where: {
              id: id,
          },
        })

        return deletedBusStop;

    } catch (error) {

        console.error(error);

    }

  }
  )
}
