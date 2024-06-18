import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "../interfaces/interface";
import { PrismaClient, waylink } from "@prisma/client";

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance) {

  /**
   * GET all available waylink
   */
  fastify.get(
  '/waylinks',
  {
    schema: {
      description: "This endpoint provides information on all of the available waylinks, including unique IDs, start and end waypoint coordinates.",
      tags: ["Waylink"],
      summary: "Get all available waylinks",
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
  async function () {
      try {

        const waylinks = await prisma.waylink.findMany()

        return waylinks;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * GET specific waylink by id
   */
  fastify.get(
  '/waylinks/:id',
  {
    schema: {
      description: "This endpoint provides information on specific waylink, including unique IDs, start and end waypoint coordinates.",
      tags: ["Waylink"],
      summary: "Get specific waylink by id",
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
      request: FastifyRequest<{ Params: IParams }>,
  ) {

        const { id } = request.params;

        try {

          const waylink = await prisma.waylink.findUnique({
            where: {
              id: id,
            },
          })

          return waylink;

        } catch (error) {

          console.error(error);

        }
    }
  );

  /**
   * ADD a new waylink
   */
  fastify.post(
  '/waylinks',
  {
    schema: {
      description: "This endpoint allows you to add a new waylink. This endpoint requires request body of waylink information with the following properties in order to add a new waylink: id, start_waypoint_latitude, start_waypoint_longitude, end_waypoint_latitude, end_waypoint_longitude.",
      tags: ["Waylink"],
      summary: "Add a new waylink",
      body: {
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
      },
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
      request: FastifyRequest<{
          Body: waylink;
      }>,
  ) {

      const { id, start_waypoint_latitude, start_waypoint_longitude, end_waypoint_latitude, end_waypoint_longitude  } = request.body;

      try {

        const addedWaylink = await prisma.waylink.create({
          data: {
            id: id,
            start_waypoint_latitude: start_waypoint_latitude,
            start_waypoint_longitude: start_waypoint_longitude,
            end_waypoint_latitude: end_waypoint_latitude,
            end_waypoint_longitude: end_waypoint_longitude
          }
        })

        return addedWaylink;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * UPDATE / REPLACE / CREATE a waylink information by id
   */
  fastify.put(
  '/waylinks/:id',
  {
    schema: {
      description: "This endpoint allows you to replace, update or create a waylink by id. This endpoint requires request body of waylink information with the following properties in order to update the specific waylink: id, start_waypoint_latitude, start_waypoint_longitude, end_waypoint_latitude, end_waypoint_longitude. Essentially, this endpoints allows you to replace with existing one, if it doesn't exist, it will create a new one. This endpoint requires the waylink ID as a parameter.",
      tags: ["Waylink"],
      summary: "Replace, update or create waylink by id",
      body: {
        type: "object",
        properties: {
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
      },
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
    request: FastifyRequest<{
        Params: IParams;
        Body: waylink;
    }>
  ) {

    const { id } = request.params;
    const { start_waypoint_latitude, start_waypoint_longitude, end_waypoint_latitude, end_waypoint_longitude } = request.body;


    try {

      const updatedWaylink = await prisma.waylink.update({
        where: { id: id },
        data: {
          start_waypoint_latitude: start_waypoint_latitude,
          start_waypoint_longitude: start_waypoint_longitude,
          end_waypoint_latitude: end_waypoint_latitude,
          end_waypoint_longitude: end_waypoint_longitude
        },
      })

      return updatedWaylink;

    } catch (error) {

      console.error(error);

    }
  }
  );

  /**
   * UPDATE waylink information partially by id
   */
  fastify.patch(
    '/waylinks/:id',
    {
      schema: {
        description: "This endpoint allows you to replace or update a waylink information partially by id. This endpoint requires request body of waylink information with the following properties in order to update the specific waylink: start_waypoint_latitude, start_waypoint_longitude, end_waypoint_latitude, end_waypoint_longitude. Essentially, this endpoints allows you to update or replace only parts of the existing waylink information. This endpoint requires the waylink ID as a parameter.",
        tags: ["Waylink"],
        summary: "Replace or update waylink partially by id",
        body: {
          type: "object",
          properties: {
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
        },
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
      request: FastifyRequest<{
          Params: IParams;
          Body: waylink;
      }>
    ) {

      const { id } = request.params;
      const { start_waypoint_latitude, start_waypoint_longitude, end_waypoint_latitude, end_waypoint_longitude } = request.body;

      try {

        const updatedWaylink = await prisma.waylink.update({
          where: { id: id },
          data: {
            start_waypoint_latitude: start_waypoint_latitude,
            start_waypoint_longitude: start_waypoint_longitude,
            end_waypoint_latitude: end_waypoint_latitude,
            end_waypoint_longitude: end_waypoint_longitude
          },
        })

        return updatedWaylink;

      } catch (error) {

        console.error(error);

      }
    }
  );

  /**
   * DELETE waylink by id
   */
  fastify.delete(
  '/waylinks/:id',
  {
    schema: {
      description: "This endpoint delete existing waylink by id. This endpoint requires the waylink ID as a parameter.",
      tags: ["Waylink"],
      summary: "Delete waylink by id",
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
  request: FastifyRequest<{
      Params: IParams;
    }>
  ) {

    const { id } = request.params;

    try {

      const deletedWaylink = await prisma.waylink.delete({
        where: {
            id: id,
        },
      })

      return deletedWaylink;

    } catch (error) {

        console.error(error);

    }

  }
  )
}
