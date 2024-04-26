import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "../interfaces/interface";
import { PrismaClient, link } from "@prisma/client";

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance) {

  /**
   * GET all available link
   */
  fastify.get(
  '/links',
  {
    schema: {
      description: "This endpoint provides information on all of the available links, including unique IDs, names, start and end bus stop IDs.",
      tags: ["Link"],
      summary: "Get all available links",
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
  async function () {
      try {

        const links = await prisma.link.findMany()

        return links;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * GET specific link by id
   */
  fastify.get(
  '/link/:id',
  {
    schema: {
      description: "This endpoint provides information on specific link, including unique IDs, names, start and end bus stop IDs.",
      tags: ["link"],
      summary: "Get specific link by id",
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
      request: FastifyRequest<{ Params: IParams }>,
  ) {

        const { id } = request.params;

        try {

          const link = await prisma.link.findUnique({
            where: {
              id: id,
            },
          })

          return link;

        } catch (error) {

          console.error(error);

        }
    }
  );

  /**
   * ADD a new link
   */
  fastify.post(
  '/link',
  {
    schema: {
      description: "This endpoint allows you to add a new link. This endpoint requires request body of link information with the following properties in order to add a new link: id, name, start_bus_stop_id, end_bus_stop_id.",
      tags: ["Link"],
      summary: "Add a new link",
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
          Body: link;
      }>,
  ) {

      const { id, name, start_bus_stop_id, end_bus_stop_id } = request.body;

      try {

        const addedLink = await prisma.link.create({
          data: {
            id: id,
            name: name,
            start_bus_stop_id: start_bus_stop_id,
            end_bus_stop_id: end_bus_stop_id,
          }
        })

        return addedLink;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * UPDATE / REPLACE / CREATE a link information by id
   */
  fastify.put(
  '/link/:id',
  {
    schema: {
      description: "This endpoint allows you to replace, update or create a link by id. This endpoint requires request body of link information with the following properties in order to update the specific link: name, start_bus_stop_id, end_bus_stop_id. Essentially, this endpoints allows you to replace with existing one, if it doesn't exist, it will create a new one. This endpoint requires the link ID as a parameter.",
      tags: ["Link"],
      summary: "Replace, update or create link by id",
      body: {
        type: "object",
        properties: {
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
        Params: IParams;
        Body: link;
    }>
  ) {

    const { id } = request.params;
    const { name, start_bus_stop_id, end_bus_stop_id } = request.body;


    try {

      const updatedLink = await prisma.link.update({
        where: { id: id },
        data: {
          name: name,
          start_bus_stop_id: start_bus_stop_id,
          end_bus_stop_id: end_bus_stop_id
        },
      })

      return updatedLink;

    } catch (error) {

      console.error(error);

    }
  }
  );

  /**
   * UPDATE link information partially by id
   */
  fastify.patch(
    '/link/:id',
    {
      schema: {
        description: "This endpoint allows you to replace or update a link information partially by id. This endpoint requires request body of link information with the following properties in order to update the specific link: name, start_bus_stop_id, end_bus_stop_id. Essentially, this endpoints allows you to update or replace only parts of the existing link information. This endpoint requires the link ID as a parameter.",
        tags: ["Link"],
        summary: "Replace or update link partially by id",
        body: {
          type: "object",
          properties: {
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
          Params: IParams;
          Body: link;
      }>
    ) {

      const { id } = request.params;
      const { name, start_bus_stop_id, end_bus_stop_id } = request.body;

      try {

        const updatedLink = await prisma.link.update({
          where: { id: id },
          data: {
            name: name,
            start_bus_stop_id: start_bus_stop_id,
            end_bus_stop_id: end_bus_stop_id
          },
        })

        return updatedLink;

      } catch (error) {

        console.error(error);

      }
    }
  );

  /**
   * DELETE link by id
   */
  fastify.delete(
  '/link/:id',
  {
    schema: {
      description: "This endpoint delete existing link by id. This endpoint requires the link ID as a parameter.",
      tags: ["Link"],
      summary: "Delete link by id",
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
      Params: IParams;
    }>
  ) {

    const { id } = request.params;

    try {

      const deletedLink = await prisma.link.delete({
        where: {
            id: id,
        },
      })

      return deletedLink;

    } catch (error) {

      console.error(error);

    }

  }
  )
}
