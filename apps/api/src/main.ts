import Fastify from 'fastify';
import dotenv from 'dotenv'
import { app } from './app/app';
import fastifySwagger from '@fastify/swagger';
import fastifySwaggerUi from '@fastify/swagger-ui';
import fastifyCors from '@fastify/cors';

dotenv.config();

const host = process.env.HOST ?? 'localhost';
const port = process.env.PORT ? Number(process.env.PORT) : 3000;

// Instantiate Fastify with some config
const server = Fastify({
  logger: true,
});

server.register(fastifyCors, {
  origin: '*',
  methods: ['GET', 'PUT', 'PATCH', 'POST', 'DELETE']
})

server.register(fastifySwagger, {
  openapi: {
    info: {
      title: 'PutraBus API',
      description: "The PutraBus API is crucial for the PutraBus app in prodiving data giving near real-time information of buses in UPM. It offers data on buses, drivers, bus stops and routes, improving operational efficiency and user experience.",
      version: '1.0.0'
    },
    // servers: [
    //   // {
    //   //   url: `http://${host}:${port}`,
    //   //   description: "Development server"
    //   // },
    //   {
    //     url: `http://127.0.0.1:3000`,
    //     description: "PreProd server"
    //   },
    //   // {
    //   //   url: `http://localhost:3000`,
    //   //   description: "Docker server"
    //   // },
    //   // {
    //   //   url: `https://putratapi-production.up.railway.app`,
    //   //   description: "Production server"
    //   // }
    // ],
    components: {
      securitySchemes: {
        bearerAuth: {
          type: 'http',
          scheme: 'bearer'
        }
      }
    },
    tags: [
      {
        name: 'Bus Stop',
        description: 'Bus Stop Endpoints'
      },
      {
        name: 'Bus',
        description: 'Bus Endpoints'
      },
      {
        name: 'Driver',
        description: 'Driver Endpoints'
      },
      {
        name: 'Active Bus',
        description: 'Active Bus Endpoints'
      },
      {
        name: 'Route',
        description: 'Route Endpoints'
      },
      {
        name: 'Link',
        description: 'Link Endpoints'
      },
      {
        name: 'Waylink',
        description: 'Waylink Endpoints'
      }
    ]
  }
});

// Register @fastify/swagger-ui plugin.
server.register(fastifySwaggerUi, {
  routePrefix: '/',
  uiConfig: {
    docExpansion: 'full',
    deepLinking: false
  },
  uiHooks: {
    onRequest: function (request, reply, next) { next() },
    preHandler: function (request, reply, next) { next() }
  },
  staticCSP: true,
  transformStaticCSP: (header) => header,
  transformSpecification: (swaggerObject) => { return swaggerObject },
  transformSpecificationClone: true
});

// Register your application as a normal plugin.
server.register(app);

// Start listening.
// server.listen({ port, host }, (err) => {
//   if (err) {
//     server.log.error(err);
//     process.exit(1);
//   } else {
//     console.log(`[ ready ] http://${host}:${port}`);
//   }
// });

async function start() {
  await server.listen({
    host: host,
    port: port as number
  });

  server.swagger;
}

// hello
start().catch((err) => {
  server.log.error(err);
  process.exit(1);
});
