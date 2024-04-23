import Fastify from 'fastify';
import { app } from './app/app';
import fastifySwagger from '@fastify/swagger';
import fastifySwaggerUi from '@fastify/swagger-ui';
import fastifyCors from '@fastify/cors';

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
      title: 'Putra T API',
      description: 'Putra T API Documentation',
      version: '1.0.0'
    },
    servers: [
      {
        url: `http://${host}:${port}`,
        description: "Development server"
      },
      {
        url: `http://127.0.0.1:3000`,
        description: "PreProd server"
      },
      {
        url: `http://localhost:3000`,
        description: "Docker server"
      },
      {
        url: `https://putratapi-production.up.railway.app`,
        description: "Production server"
      }
    ],
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
        name: 'Root',
        description: 'Root endpoints'
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
