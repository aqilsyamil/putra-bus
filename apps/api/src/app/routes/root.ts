/* eslint-disable @typescript-eslint/no-unused-vars */
import type { FastifyReply, FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "./interfaces/interface";
import { PrismaClient, driver_bus } from "@prisma/client";

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance, options) {
    /**
   * GET all bus_route
   */
    fastify.get(
    '/bus_routes',
    {
        schema: {
        description: 'Root endpoint',
        tags: ['Root'],
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
    async function (request: FastifyRequest, reply: FastifyReply) {

        try {
        const bus_routes = await prisma.bus_route.findMany()
        return reply.send(bus_routes)

        } catch (error) {
        console.error(error);
        }
    }
    );

    /**
   * GET one bus_route by id
   */
    fastify.get(
      '/bus_route/:id',
      {
        schema: {
          description: 'Root endpoint',
          tags: ['Root'],
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
        reply: FastifyReply
      ) {

        const { id } = request.params;

        try {
          const bus_route = await prisma.bus_route.findUnique({
              where: { id: id},
            })
          
          return bus_route

        } catch (error) {
          console.error(error);
        }
      }
    );

    /**
   * GET all bus_stop
   */
    fastify.get(
        '/bus_stops',
        {
            schema: {
            description: 'Root endpoint',
            tags: ['Root'],
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
        async function (request: FastifyRequest, reply: FastifyReply) {

            try {
            const bus_stops = await prisma.bus_stop.findMany()
            return bus_stops

            } catch (error) {
            console.error(error);
            }
        }
    );
    
    /**
     * GET one bus_stop by id
     */
    fastify.get(
    '/bus_stop/:id',
    {
        schema: {
        description: 'Root endpoint',
        tags: ['Root'],
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
        reply: FastifyReply
    ) {

        const { id } = request.params;

        try {
        const bus_stop = await prisma.bus_stop.findUnique({
            where: { id: id},
            })
        
        return bus_stop

        } catch (error) {
        console.error(error);
        }
    }
    );

    /**
   * GET all bus
   */
    fastify.get(
        '/buses',
        {
          schema: {
            description: 'Root endpoint',
            tags: ['Root'],
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
        async function (request: FastifyRequest, reply: FastifyReply) {
    
          try {
            const buses = await prisma.bus.findMany()
            return buses
    
          } catch (error) {
            console.error(error);
          }
        }
    );

    /**
   * GET one bus by id
   */
    fastify.get(
      '/bus/:id',
      {
        schema: {
          description: 'Root endpoint',
          tags: ['Root'],
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
        reply: FastifyReply
      ) {
  
        const { id } = request.params;
  
        try {
          const bus = await prisma.bus.findUnique({
              where: { id: id},
            })
          
          return bus
  
        } catch (error) {
          console.error(error);
        }
      }
    );

    /**
   * GET all drivers
   */
    fastify.get(
        '/drivers',
        {
        schema: {
            description: 'Root endpoint',
            tags: ['Root'],
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
        async function (request: FastifyRequest, reply: FastifyReply) {

        try {
            const drivers = await prisma.driver.findMany()
            return reply.send(drivers)

        } catch (error) {
            console.error(error);
        }
        }
    );

    /**
   * GET one driver by id
   */
    fastify.get(
        '/driver/:id',
        {
        schema: {
            description: 'Root endpoint',
            tags: ['Root'],
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
        reply: FastifyReply
        ) {

        const { id } = request.params;

        try {
            const driver = await prisma.driver.findUnique({
                where: { id: id},
            })
            
            return driver

        } catch (error) {
            console.error(error);
        }
        }
    );

    /**
   * GET all bus_stop
   */
    fastify.get(
        '/routepointpaths',
        {
          schema: {
            description: 'Root endpoint',
            tags: ['Root'],
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
        async function (request: FastifyRequest, reply: FastifyReply) {
    
            try {
            const routepointpaths = await prisma.routepointpath.findMany()
            return routepointpaths
    
            } catch (error) {
            console.error(error);
            }
        }
    );

    /**
   * GET one routepointpath by id
   */
    fastify.get(
        '/routepointpath/:id',
        {
        schema: {
            description: 'Root endpoint',
            tags: ['Root'],
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
        reply: FastifyReply
        ) {

        const { id } = request.params;

        try {
            const routepointpath = await prisma.routepointpath.findUnique({
                where: { id: id},
            })
            
            return routepointpath

        } catch (error) {
            console.error(error);
        }
        }
    );

    /**
   * GET all driver_buses
   */
    fastify.get(
        '/driver_buses',
        {
        schema: {
            description: 'Root endpoint',
            tags: ['Root'],
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
        async function (request: FastifyRequest, reply: FastifyReply) {

        try {
            const driver_buses = await prisma.driver_bus.findMany()
            return driver_buses

        } catch (error) {
            console.error(error);
        }
        }
    );

    /**
    * GET one driver_bus by id
    */
    fastify.get(
    '/driver_bus/:id',
    {
        schema: {
        description: 'Root endpoint',
        tags: ['Root'],
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
        reply: FastifyReply
    ) {

        const { id } = request.params;

        try {
        const driver_bus = await prisma.driver_bus.findUnique({
            where: { id: id },
            })
        
        return driver_bus

        } catch (error) {
        console.error(error);
        }
    }
    );

    /**
    * ADD new driver_bus
    */
    fastify.post(
    '/driver_bus/add',
    {
        schema: {
        description: 'post some data',
        tags: ['Root'],
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
        Body: driver_bus;
        }>,
        reply: FastifyReply
    ) {
        const { id, driver_id, bus_id, occupancy_status, bus_lat, bus_lng } =
        request.body;

        try {
        const driver_bus_response = await prisma.driver_bus.create({
            data: {
            id: id,
            driver_id: driver_id,
            bus_id: bus_id,
            occupancy_status: occupancy_status,
            bus_lat: bus_lat,
            bus_lng: bus_lng
            },
        })
        return driver_bus_response;
        } catch (error) {
        console.error(error);
        }
    }
    );

    /** UPDATE driver_bus by id */
    fastify.put(
    '/driver_bus/:id',
    {
    schema: {
        description: 'post some data',
        tags: ['Root'],
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
        Body: driver_bus;
    }>,
    reply: FastifyReply
    ) {
    const { id } = request.params;
    const { driver_id, bus_id, occupancy_status, bus_lat, bus_lng } = request.body;

    try {
        const updated_driver_bus = await prisma.driver_bus.update({
        where: { id: id },
        data: {
            driver_id: driver_id,
            bus_id: bus_id,
            occupancy_status: occupancy_status,
            bus_lat: bus_lat,
            bus_lng: bus_lng
        },
        })

        return updated_driver_bus
    
    } catch (error) {
        console.error(error);
    }
    }
    );

    /**
    * DELETE driver_bus by id
    */
    fastify.delete(
    '/driver_bus/:id',
    {
    schema: {
        description: 'Root endpoint',
        tags: ['Root'],
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
    }>,
    reply: FastifyReply
    ) {
    const { id } = request.params;

    try {
        const driver_bus = await prisma.driver_bus.delete({
        where: {
            id: id,
        },
        })
        return driver_bus
    } catch (error) {
        console.error(error);
    }
    }
    )
}