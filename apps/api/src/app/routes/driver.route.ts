import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "../interfaces/interface";
import { PrismaClient, driver } from "@prisma/client";

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance) {

  /**
   * GET all available driver
   */
  fastify.get(
  '/drivers',
  {
    schema: {
      description: "This endpoint provides information on all of the available drivers, including unique IDs, full number, phone number, password and photo URL path",
      tags: ["Driver"],
      summary: "Get all available drivers",
      response: {
        200: {
          description: "Successful response",
          type: "array",
          items: {
            type: "object",
            properties: {
              id: {
                type: "string",
                description: "A unique identifier for the driver."
              },
              full_name: {
                type: "string",
                description: "The full name of the driver, providing descriptive information about their identity."
              },
              phone_no: {
                type: "string",
                description: "The phone number of the driver, providing contact information."
              },
              password: {
                type: "string",
                description: "The password of the driver, providing authentication for user to login to the app."
              },
              photo_path: {
                type: "string",
                description: "The URL path of the driver's photo, providing a visual representation of their identity."
              }
            }
          }
        }
      }
    }
  },
  async function () {
      try {

        const drivers = await prisma.driver.findMany()

        return drivers;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * GET specific driver by id
   */
  fastify.get(
  '/drivers/:id',
  {
    schema: {
      description: "This endpoint provides information on specific driver, including unique IDs, full number, phone number, password and photo URL path. This endpoint requires the driver ID as a parameter.",
      tags: ["Driver"],
      summary: "Get specific driver by id",
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the driver."
            },
            full_name: {
              type: "string",
              description: "The full name of the driver, providing descriptive information about their identity."
            },
            phone_no: {
              type: "string",
              description: "The phone number of the driver, providing contact information."
            },
            password: {
              type: "string",
              description: "The password of the driver, providing authentication for user to login to the app."
            },
            photo_path: {
              type: "string",
              description: "The URL path of the driver's photo, providing a visual representation of their identity."
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

          const driver = await prisma.driver.findUnique({
            where: {
              id: id,
            },
          })

          return driver;

        } catch (error) {

          console.error(error);

        }
    }
  );

  /**
   * ADD a new driver
   */
  fastify.post(
  '/drivers',
  {
    schema: {
      description: "This endpoint allows you to add a new driver. This endpoint requires request body of driver information with the following properties in order to add a new driver: id, full name, phone number, password and photo URL path.",
      tags: ["Driver"],
      summary: "Add a new driver",
      body: {
        type: "object",
        properties: {
          id: {
            type: "string",
            description: "A unique identifier for the driver."
          },
          full_name: {
            type: "string",
            description: "The full name of the driver, providing descriptive information about their identity."
          },
          phone_no: {
            type: "string",
            description: "The phone number of the driver, providing contact information."
          },
          password: {
            type: "string",
            description: "The password of the driver, providing authentication for user to login to the app."
          },
          photo_path: {
            type: "string",
            description: "The URL path of the driver's photo, providing a visual representation of their identity."
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
              description: "A unique identifier for the driver."
            },
            full_name: {
              type: "string",
              description: "The full name of the driver, providing descriptive information about their identity."
            },
            phone_no: {
              type: "string",
              description: "The phone number of the driver, providing contact information."
            },
            password: {
              type: "string",
              description: "The password of the driver, providing authentication for user to login to the app."
            },
            photo_path: {
              type: "string",
              description: "The URL path of the driver's photo, providing a visual representation of their identity."
            }
          }
        }
      }
    }
  },
  async function (
      request: FastifyRequest<{
          Body: driver;
      }>,
  ) {

      const { id, full_name, phone_no, password, photo_path } = request.body;

      try {

        const addedDriver = await prisma.driver.create({
          data: {
            id: id,
            full_name: full_name,
            phone_no: phone_no,
            password: password,
            photo_path: photo_path
          }
        })

        return addedDriver;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * UPDATE / REPLACE / CREATE a driver information by id
   */
  fastify.put(
  '/drivers/:id',
  {
    schema: {
      description: "This endpoint allows you to replace, update or create a driver by id. This endpoint requires request body of driver information with the following properties in order to update the specific driver: full name, phone number, password and photo URL path. Essentially, this endpoints allows you to replace with existing one, if it doesn't exist, it will create a new one. This endpoint requires the driver ID as a parameter.",
      tags: ["Driver"],
      summary: "Replace, update or create driver by id",
      body: {
        type: "object",
        properties: {
          full_name: {
            type: "string",
            description: "The full name of the driver, providing descriptive information about their identity."
          },
          phone_no: {
            type: "string",
            description: "The phone number of the driver, providing contact information."
          },
          password: {
            type: "string",
            description: "The password of the driver, providing authentication for user to login to the app."
          },
          photo_path: {
            type: "string",
            description: "The URL path of the driver's photo, providing a visual representation of their identity."
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
              description: "A unique identifier for the driver."
            },
            full_name: {
              type: "string",
              description: "The full name of the driver, providing descriptive information about their identity."
            },
            phone_no: {
              type: "string",
              description: "The phone number of the driver, providing contact information."
            },
            password: {
              type: "string",
              description: "The password of the driver, providing authentication for user to login to the app."
            },
            photo_path: {
              type: "string",
              description: "The URL path of the driver's photo, providing a visual representation of their identity."
            }
          }
        }
      }
    }
  },
  async function (
    request: FastifyRequest<{
        Params: IParams;
        Body: driver;
    }>
  ) {

    const { id } = request.params;
    const { full_name, phone_no, password, photo_path } = request.body;


    try {

      const updatedDriver = await prisma.driver.update({
        where: { id: id },
        data: {
          full_name: full_name,
          phone_no: phone_no,
          password: password,
          photo_path: photo_path
        },
      })

        return updatedDriver;

    } catch (error) {

      console.error(error);

    }
  }
  );

  /**
   * UPDATE driver information partially by id
   */
  fastify.patch(
    '/drivers/:id',
    {
      schema: {
        description: "This endpoint allows you to replace or update a driver information partially by id. This endpoint requires request body of driver information with the following properties in order to update the specific driver: full name, phone number, password and photo URL path. Essentially, this endpoints allows you to update or replace only parts of the existing driver information. This endpoint requires the driver ID as a parameter.",
        tags: ["Driver"],
        summary: "Replace or update driver partially by id",
        body: {
          type: "object",
          properties: {
            full_name: {
              type: "string",
              description: "The full name of the driver, providing descriptive information about their identity."
            },
            phone_no: {
              type: "string",
              description: "The phone number of the driver, providing contact information."
            },
            password: {
              type: "string",
              description: "The password of the driver, providing authentication for user to login to the app."
            },
            photo_path: {
              type: "string",
              description: "The URL path of the driver's photo, providing a visual representation of their identity."
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
                description: "A unique identifier for the driver."
              },
              full_name: {
                type: "string",
                description: "The full name of the driver, providing descriptive information about their identity."
              },
              phone_no: {
                type: "string",
                description: "The phone number of the driver, providing contact information."
              },
              password: {
                type: "string",
                description: "The password of the driver, providing authentication for user to login to the app."
              },
              photo_path: {
                type: "string",
                description: "The URL path of the driver's photo, providing a visual representation of their identity."
              }
            }
          }
        }
      }
    },
    async function (
      request: FastifyRequest<{
          Params: IParams;
          Body: driver;
      }>
    ) {

      const { id } = request.params;
      const { full_name, phone_no, password, photo_path } = request.body;

      try {

        const updatedDriver = await prisma.driver.update({
          where: { id: id },
          data: {
            full_name: full_name,
            phone_no: phone_no,
            password: password,
            photo_path: photo_path
          },
        })

        return updatedDriver;

      } catch (error) {

        console.error(error);

      }
    }
  );

  /**
   * DELETE driver by id
   */
  fastify.delete(
  '/drivers/:id',
  {
    schema: {
      description: "This endpoint delete existing driver by id. This endpoint requires the driver ID as a parameter.",
      tags: ["Driver"],
      summary: "Delete driver by id",
      response: {
        200: {
          description: "Successful response",
          type: "object",
          properties: {
            id: {
              type: "string",
              description: "A unique identifier for the driver."
            },
            full_name: {
              type: "string",
              description: "The full name of the driver, providing descriptive information about their identity."
            },
            phone_no: {
              type: "string",
              description: "The phone number of the driver, providing contact information."
            },
            password: {
              type: "string",
              description: "The password of the driver, providing authentication for user to login to the app."
            },
            photo_path: {
              type: "string",
              description: "The URL path of the driver's photo, providing a visual representation of their identity."
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

      const deletedDriver = await prisma.driver.delete({
        where: {
            id: id,
        },
      })

      return deletedDriver;

    } catch (error) {

        console.error(error);

    }

  }
  )
}
