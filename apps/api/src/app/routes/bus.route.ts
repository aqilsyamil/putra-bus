import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "../interfaces/interface";
import { PrismaClient, bus_stop } from "@prisma/client";

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance) {

  /**
   * GET all bus stops
   */
  fastify.get(
  '/buses',
  {
    schema: {
      description: "This endpoint provides information on all of the available buses, including unique IDs and plate numbers.",
      tags: ["Bus"],
      summary: "Get all available buses",
      response: {
        200: {
          description: "Successful response",
          type: "array",
          items: {
            type: "object",
            properties: {
              id: {
                type: "string",
                description: "A unique identifier for the bus."
              },
              plate_no: {
                type: "string",
                description: "The plate number of the bus, providing identification for the vehicle."
              }
            }
          }
        }
      }
    }
  },
  async function () {
      try {

        const buses = await prisma.bus.findMany()

        return buses;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * GET one bus stop by id
   */
  fastify.get(
  '/bus/:id',
  {
    schema: {
      description: "This endpoint provides information on specific bus, including unique IDs and plate numbers. This endpoint requires the bus ID as a parameter.",
      tags: ["Bus"],
      summary: "Get specific bus by id",
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the bus."
            },
            plate_no: {
              type: "string",
              description: "The plate number of the bus, providing identification for the vehicle."
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

          const bus = await prisma.bus.findUnique({
            where: {
              id: id,
            },
          })

          return bus;

        } catch (error) {

          console.error(error);

        }
    }
  );

  // /**
  //  * ADD new bus stop
  //  */
  // fastify.post(
  // '/bus-stop',
  // {
  //     schema: {
  //     description: 'post some data',
  //     tags: ['Bus Stop'],
  //     summary: 'qwerty',
  //     body: {
  //         type: 'object',
  //         properties: {
  //         id: { type: 'string' },
  //         driver_id: { type: 'string' },
  //         bus_id: { type: 'string' },
  //         occupancy_status: { type: 'string' },
  //         bus_lat: { type: 'number' },
  //         bus_lng: { type: 'number' },
  //         }
  //     },
  //     // response: {
  //     //   201: {
  //     //     description: 'Successful response',
  //     //     type: 'object',
  //     //     properties: {
  //     //       hello: { type: 'string' }
  //     //     }
  //     //   },
  //     //   default: {
  //     //     description: 'Default response',
  //     //     type: 'object',
  //     //     properties: {
  //     //       foo: { type: 'string' }
  //     //     }
  //     //   }
  //     // }
  //     }
  // },
  // async function (
  //     request: FastifyRequest<{
  //         Body: bus_stop;
  //     }>,
  // ) {

  //     const { id, full_name, short_name, latitude, longitude, image_path } = request.body;

  //     try {

  //       const addedBusStop = await prisma.bus_stop.create({
  //         data: {
  //           id: id,
  //           full_name: full_name,
  //           short_name: short_name,
  //           latitude: latitude,
  //           longitude: longitude,
  //           image_path: image_path
  //         },
  //       })

  //       return addedBusStop;

  //     } catch (error) {

  //       console.error(error);

  //     }
  // }
  // );

  // /**
  //  * UPDATE ALL bus stop by id
  //  */
  // fastify.put(
  // '/bus-stop/:id',
  // {
  // schema: {
  //     description: 'post some data',
  //     tags: ['Bus Stop'],
  //     summary: 'qwerty',
  //     params: {
  //     type: 'object',
  //     properties: {
  //         id: {
  //         type: 'string',
  //         description: 'id'
  //         }
  //     }
  //     },
  //     body: {
  //     type: 'object',
  //     properties: {
  //         driver_id: { type: 'string' },
  //         bus_id: { type: 'string' },
  //         occupancy_status: { type: 'string' },
  //         bus_lat: { type: 'number' },
  //         bus_lng: { type: 'number' },
  //     }
  //     },
  //     // response: {
  //     //   201: {
  //     //     description: 'Successful response',
  //     //     type: 'object',
  //     //     properties: {
  //     //       hello: { type: 'string' }
  //     //     }
  //     //   },
  //     //   default: {
  //     //     description: 'Default response',
  //     //     type: 'object',
  //     //     properties: {
  //     //       foo: { type: 'string' }
  //     //     }
  //     //   }
  //     // }
  // }
  // },
  // async function (
  //   request: FastifyRequest<{
  //       Params: IParams;
  //       Body: bus_stop;
  //   }>
  // ) {

  //   const { id } = request.params;
  //   const { full_name, short_name, latitude, longitude, image_path } = request.body;

  //   try {

  //       const updatedBusStop = await prisma.bus_stop.update({
  //         where: { id: id },
  //         data: {
  //           full_name: full_name,
  //           short_name: short_name,
  //           latitude: latitude,
  //           longitude: longitude,
  //           image_path: image_path
  //         },
  //       })

  //       return updatedBusStop;

  //   } catch (error) {

  //     console.error(error);

  //   }
  // }
  // );

  // /**
  //  * UPDATE PARTIAL bus stop by id
  //  */
  // fastify.patch(
  //   '/bus-stop/:id',
  //   {
  //   schema: {
  //       description: 'post some data',
  //       tags: ['Bus Stop'],
  //       summary: 'qwerty',
  //       params: {
  //       type: 'object',
  //       properties: {
  //           id: {
  //           type: 'string',
  //           description: 'id'
  //           }
  //       }
  //       },
  //       body: {
  //       type: 'object',
  //       properties: {
  //           driver_id: { type: 'string' },
  //           bus_id: { type: 'string' },
  //           occupancy_status: { type: 'string' },
  //           bus_lat: { type: 'number' },
  //           bus_lng: { type: 'number' },
  //       }
  //       },
  //       // response: {
  //       //   201: {
  //       //     description: 'Successful response',
  //       //     type: 'object',
  //       //     properties: {
  //       //       hello: { type: 'string' }
  //       //     }
  //       //   },
  //       //   default: {
  //       //     description: 'Default response',
  //       //     type: 'object',
  //       //     properties: {
  //       //       foo: { type: 'string' }
  //       //     }
  //       //   }
  //       // }
  //   }
  //   },
  //   async function (
  //     request: FastifyRequest<{
  //         Params: IParams;
  //         Body: bus_stop;
  //     }>
  //   ) {

  //     const { id } = request.params;
  //     const { full_name, short_name, latitude, longitude, image_path } = request.body;

  //     try {

  //         const updatedBusStop = await prisma.bus_stop.update({
  //           where: { id: id },
  //           data: {
  //             full_name: full_name,
  //             short_name: short_name,
  //             latitude: latitude,
  //             longitude: longitude,
  //             image_path: image_path
  //           },
  //         })

  //         return updatedBusStop;

  //     } catch (error) {

  //       console.error(error);

  //     }
  //   }
  // );

  // /**
  //  * DELETE bus stop by id
  //  */
  // fastify.delete(
  // '/bus-stop/:id',
  // {
  // schema: {
  //     description: 'Root endpoint',
  //     tags: ['Bus Stop'],
  //     // response: {
  //     //   200: {
  //     //     description: 'Succesful response',
  //     //     type: 'object',
  //     //     properties: {
  //     //       message: { type: 'string' },
  //     //       result: { type: 'object', nullable: true }
  //     //     }
  //     //   }
  //     // }
  // }
  // },
  // async function (
  // request: FastifyRequest<{
  //     Params: IParams;
  //   }>
  // ) {

  //   const { id } = request.params;

  //   try {

  //       const deletedBusStop = await prisma.bus_stop.delete({
  //         where: {
  //             id: id,
  //         },
  //       })

  //       return deletedBusStop;

  //   } catch (error) {

  //       console.error(error);

  //   }

  // }
  // )
}
