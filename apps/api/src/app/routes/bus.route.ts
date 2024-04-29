import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "../interfaces/interface";
import { PrismaClient, bus } from "@prisma/client";

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance) {

  /**
   * GET all available bus
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
   * GET specific bus by id
   */
  fastify.get(
  '/buses/:id',
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

  /**
   * ADD a new bus
   */
  fastify.post(
  '/buses',
  {
    schema: {
      description: "This endpoint allows you to add a new bus. This endpoint requires request body of bus information with the following properties in order to add a new bus: id and plate number",
      tags: ["Bus"],
      summary: "Add a new bus",
      body: {
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
      },
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
      request: FastifyRequest<{
          Body: bus;
      }>,
  ) {

      const { id, plate_no } = request.body;

      try {

        const addedBus = await prisma.bus.create({
          data: {
            id: id,
            plate_no: plate_no
          }
        })

        return addedBus;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * UPDATE / REPLACE / CREATE a bus information by id
   */
  fastify.put(
  '/buses/:id',
  {
    schema: {
      description: "This endpoint allows you to replace, update or create a bus by id. This endpoint requires request body of bus information with the following properties in order to update the specific bus: plate number. Essentially, this endpoints allows you to replace with existing one, if it doesn't exist, it will create a new one. This endpoint requires the bus ID as a parameter.",
      tags: ["Bus"],
      summary: "Replace, update or create bus by id",
      body: {
        type: "object",
        properties: {
          plate_no: {
            type: "string",
            description: "The plate number of the bus, providing identification for the vehicle."
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
    request: FastifyRequest<{
        Params: IParams;
        Body: bus;
    }>
  ) {

    const { id } = request.params;
    const { plate_no } = request.body;


    try {

      const updatedBus = await prisma.bus.update({
        where: { id: id },
        data: {
          plate_no: plate_no
        },
      })

        return updatedBus;

    } catch (error) {

      console.error(error);

    }
  }
  );

  /**
   * UPDATE bus information partially by id
   */
  fastify.patch(
    '/buses/:id',
    {
      schema: {
        description: "This endpoint allows you to replace or update a bus information partially by id. This endpoint requires request body of bus information with the following properties in order to update the specific bus: plate number. Essentially, this endpoints allows you to update or replace only parts of the existing bus information. This endpoint requires the bus ID as a parameter.",
        tags: ["Bus"],
        summary: "Replace or update bus partially by id",
        body: {
          type: "object",
          properties: {
            plate_no: {
              type: "string",
              description: "The plate number of the bus, providing identification for the vehicle."
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
      request: FastifyRequest<{
          Params: IParams;
          Body: bus;
      }>
    ) {

      const { id } = request.params;
      const { plate_no } = request.body;

      try {

        const updatedBus = await prisma.bus.update({
          where: { id: id },
          data: {
            plate_no: plate_no
          },
        })

        return updatedBus;

      } catch (error) {

        console.error(error);

      }
    }
  );

  /**
   * DELETE bus by id
   */
  fastify.delete(
  '/buses/:id',
  {
    schema: {
      description: "This endpoint delete existing bus by id. This endpoint requires the bus ID as a parameter.",
      tags: ["Bus"],
      summary: "Delete bus by id",
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
  request: FastifyRequest<{
      Params: IParams;
    }>
  ) {

    const { id } = request.params;

    try {

      const deletedBus = await prisma.bus.delete({
        where: {
            id: id,
        },
      })

      return deletedBus;

    } catch (error) {

        console.error(error);

    }

  }
  )
}
