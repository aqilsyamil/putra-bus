import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "../interfaces/interface";
import { PrismaClient, route } from "@prisma/client";

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
  '/route/:id',
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
  '/route',
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
  '/route/:id',
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
    '/route/:id',
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
  '/route/:id',
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
}
