import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "../interfaces/interface";
import { PrismaClient, bus_stop } from "@prisma/client";

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance) {

  /**
   * GET all available bus stops
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
   * GET specific bus stop by id
   */
  fastify.get(
  '/bus-stop/:id',
  {
    schema: {
      description: "This endpoint provides information on specific bus stop, including unique IDs, it's full name, short name, latitude, longitude and image URL path. This endpoint requires the bus stop ID as a parameter.",
      tags: ['Bus Stop'],
      summary: 'Get specific bus stop by id',
      response: {
        200: {
          description: 'Succesful response',
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
      description: "This endpoint allows you to add a new bus stop. This endpoint requires request body of bus information with the following properties in order to add a new bus stop: id, full_name, short_name, latitude, longitude, image_path.",
      tags: ['Bus Stop'],
      summary: 'Add a new bus stop',
      body: {
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
      },
      response: {
        200: {
          description: 'Succesful response',
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
   * UPDATE / REPLACE / CREATE a bus stop information by id
   */
  fastify.put(
  '/bus-stop/:id',
  {
    schema: {
      description: "This endpoint allows you to replace, update or create a bus stop by id. This endpoint requires request body of bus information with the following properties in order to update the specific bus stop: full_name, short_name, latitude, longitude, image_path. Essentially, this endpoints allows you to replace with existing one, if it doesn't exist, it will create a new one. This endpoint requires the bus stop ID as a parameter.",
      tags: ['Bus Stop'],
      summary: "Replace, update or create bus stop by id",
      body: {
        type: 'object',
          properties: {
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
      },
      response: {
        200: {
          description: 'Succesful response',
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
   * UPDATE bus stop information partially by id
   */
  fastify.patch(
    '/bus-stop/:id',
    {
      schema: {
        description: "This endpoint allows you to replace or update a bus stop information partially by id. This endpoint requires request body of bus stop information with the following properties in order to update the specific bus stop: full_name, short_name, latitude, longitude, image_path. Essentially, this endpoints allows you to update or replace only parts of the existing bus information. This endpoint requires the bus stop ID as a parameter.",
        tags: ['Bus Stop'],
        summary: "Replace, update or create bus stop by id",
        body: {
          type: 'object',
            properties: {
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
        },
        response: {
          200: {
            description: 'Succesful response',
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
      description: "This endpoint delete existing bus stop by id. This endpoint requires the bus stop ID as a parameter.",
      tags: ["Bus Stop"],
      summary: "Delete bus stop by id",
      response: {
        200: {
          description: 'Succesful response',
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
