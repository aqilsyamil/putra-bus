import type { FastifyRequest, FastifyInstance } from "fastify";
import { IParams, IBusRoute } from "../interfaces/interface";
import { PrismaClient, link, waylink } from '@prisma/client';

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance) {

  /**
   * GET all available route
   */
  fastify.get(
  '/full-routes',
  {
    schema: {
      description: "This endpoint provides information on all of the available routes, including unique IDs, names, and links between bus stops.",
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
              links: {
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
                      description: "The name of the link."
                    },
                    start_bus_stop_id: {
                      type: "string",
                      description: "The unique identifier of the start bus stop."
                    },
                    end_bus_stop_id: {
                      type: "string",
                      description: "The unique identifier of the end bus stop."
                    },
                    waylinks: {
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
              }
            }
          }
        }
      }
    }
  },
  async function () {
      try {

        const routes = await prisma.route.findMany({
          include: {
            route_link: {
              include: {
                link: {
                  include: {
                    link_waylink: {
                      include: {
                        waylink: true
                      }
                    }
                  }
                }
              }
            }
          }
        });

        const routesWithLinksAndWaylinks = routes.map(route => ({
          id: route.id,
          name: route.name,
          links: route.route_link.map(route_link => ({
            id: route_link.link.id,
            name: route_link.link.name,
            start_bus_stop_id: route_link.link.start_bus_stop_id,
            end_bus_stop_id: route_link.link.end_bus_stop_id,
            waylinks: route_link.link.link_waylink.map(link_waylink => ({
              id: link_waylink.waylink.id,
              start_waypoint_latitude: link_waylink.waylink.start_waypoint_latitude,
              start_waypoint_longitude: link_waylink.waylink.start_waypoint_longitude,
              end_waypoint_latitude: link_waylink.waylink.end_waypoint_latitude,
              end_waypoint_longitude: link_waylink.waylink.end_waypoint_longitude
            }))
          }))
        }));

        return routesWithLinksAndWaylinks;

      } catch (error) {

        console.error(error);

      }
  }
  );

  /**
   * GET specific route by id
   */
  fastify.get(
  '/full-route/:id',
  {
    schema: {
      description: "This endpoint provides information on specific route, including unique IDs, names, and links between bus stops. This endpoint requires the route ID as a parameter.",
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
            links: {
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
                    description: "The name of the link."
                  },
                  start_bus_stop_id: {
                    type: "string",
                    description: "The unique identifier of the start bus stop."
                  },
                  end_bus_stop_id: {
                    type: "string",
                    description: "The unique identifier of the end bus stop."
                  },
                  waylinks: {
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

          const route = await prisma.route.findUnique({
            where: {
              id: id,
            },
            include: {
              route_link: {
                include: {
                  link: {
                    include: {
                      link_waylink: {
                        include: {
                          waylink: true
                        }
                      }
                    }
                  }
                }
              }
            }
          })

          if (route) {
            const routeWithLinksAndWaylinks = {
              id: route.id,
              name: route.name,
              links: route.route_link.map(route_link => ({
                id: route_link.link.id,
                name: route_link.link.name,
                start_bus_stop_id: route_link.link.start_bus_stop_id,
                end_bus_stop_id: route_link.link.end_bus_stop_id,
                waylinks: route_link.link.link_waylink.map(link_waylink => ({
                  id: link_waylink.waylink.id,
                  start_waypoint_latitude: link_waylink.waylink.start_waypoint_latitude,
                  start_waypoint_longitude: link_waylink.waylink.start_waypoint_longitude,
                  end_waypoint_latitude: link_waylink.waylink.end_waypoint_latitude,
                  end_waypoint_longitude: link_waylink.waylink.end_waypoint_longitude
                }))
              }))
            };

            return routeWithLinksAndWaylinks;

          } else {

            throw new Error('Route not found');

          }

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
      description: "This endpoint allows you to add a new route. This endpoint requires request body of route information with the following properties in order to add a new route: id, name, and links.",
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
          links: {
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
                  description: "The name of the link."
                },
                start_bus_stop_id: {
                  type: "string",
                  description: "The unique identifier of the start bus stop."
                },
                end_bus_stop_id: {
                  type: "string",
                  description: "The unique identifier of the end bus stop."
                },
                waylinks: {
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
              description: "A unique identifier for the route."
            },
            name: {
              type: "string",
              description: "The full name of the route, providing descriptive information for the route."
            },
            links: {
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
                    description: "The name of the link."
                  },
                  start_bus_stop_id: {
                    type: "string",
                    description: "The unique identifier of the start bus stop."
                  },
                  end_bus_stop_id: {
                    type: "string",
                    description: "The unique identifier of the end bus stop."
                  },
                  waylinks: {
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
            }
          }
        }
      }
    }
  },
  async function (
      request: FastifyRequest<{
          Body: IBusRoute;
      }>,
  ) {

      const { id, name, links } = request.body;

      try {

        const addedRoute = await prisma.route.create({
          data: {
            id: id,
            name: name
          }
        })

        const basicWaylinks: waylink[] = [];

        let basicLinks: link[] = [];

        if (links.length > 0) {

          basicLinks = links.map((link) => {
            const { waylinks,  ...rest } = link;

            basicWaylinks.push(...waylinks);

            return rest;
          })

          await prisma.link.createMany({
            data: basicLinks
          })

          await prisma.waylink.createMany({
            data: basicWaylinks
          })

        }

        const addedRouteWithLinksAndWayLinks = {
          id: addedRoute.id,
          name: addedRoute.name,
          links: links? links : []
        }

        return addedRouteWithLinksAndWayLinks;

      } catch (error) {

        console.error(error);

      }
  }
  );

  // /**
  //  * UPDATE / REPLACE / CREATE a route information by id
  //  */
  // fastify.put(
  // '/route/:id',
  // {
  //   schema: {
  //     description: "This endpoint allows you to replace, update or create a route by id. This endpoint requires request body of route information with the following properties in order to update the specific route: full name, phone number, password and photo URL path. Essentially, this endpoints allows you to replace with existing one, if it doesn't exist, it will create a new one. This endpoint requires the route ID as a parameter.",
  //     tags: ["Route"],
  //     summary: "Replace, update or create route by id",
  //     body: {
  //       type: "object",
  //       properties: {
  //         name: {
  //           type: "string",
  //           description: "The full name of the route, providing descriptive information for the route."
  //         },
  //         links: {
  //           type: "array",
  //           items: {
  //             type: "object",
  //             properties: {
  //               id: {
  //                 type: "string",
  //                 description: "A unique identifier for the link."
  //               },
  //               name: {
  //                 type: "string",
  //                 description: "The name of the link."
  //               },
  //               start_bus_stop_id: {
  //                 type: "string",
  //                 description: "The unique identifier of the start bus stop."
  //               },
  //               end_bus_stop_id: {
  //                 type: "string",
  //                 description: "The unique identifier of the end bus stop."
  //               },
  //               waylinks: {
  //                 type: "array",
  //                 items: {
  //                   type: "object",
  //                   properties: {
  //                     id: {
  //                       type: "string",
  //                       description: "A unique identifier for the waylink."
  //                     },
  //                     start_waypoint_latitude: {
  //                       type: "number",
  //                       description: "The latitude of the start waypoint."
  //                     },
  //                     start_waypoint_longitude: {
  //                       type: "number",
  //                       description: "The longitude of the start waypoint."
  //                     },
  //                     end_waypoint_latitude: {
  //                       type: "number",
  //                       description: "The latitude of the end waypoint."
  //                     },
  //                     end_waypoint_longitude: {
  //                       type: "number",
  //                       description: "The longitude of the end waypoint."
  //                     }
  //                   }
  //                 }
  //               }
  //             }
  //           }
  //         }
  //       }
  //     },
  //     response: {
  //       200: {
  //         description: "Successful response",
  //         type: "object",
  //         properties: {
  //           id: {
  //             type: "string",
  //             description: "A unique identifier for the route."
  //           },
  //           name: {
  //             type: "string",
  //             description: "The full name of the route, providing descriptive information for the route."
  //           },
  //           links: {
  //             type: "array",
  //             items: {
  //               type: "object",
  //               properties: {
  //                 id: {
  //                   type: "string",
  //                   description: "A unique identifier for the link."
  //                 },
  //                 name: {
  //                   type: "string",
  //                   description: "The name of the link."
  //                 },
  //                 start_bus_stop_id: {
  //                   type: "string",
  //                   description: "The unique identifier of the start bus stop."
  //                 },
  //                 end_bus_stop_id: {
  //                   type: "string",
  //                   description: "The unique identifier of the end bus stop."
  //                 },
  //                 waylinks: {
  //                   type: "array",
  //                   items: {
  //                     type: "object",
  //                     properties: {
  //                       id: {
  //                         type: "string",
  //                         description: "A unique identifier for the waylink."
  //                       },
  //                       start_waypoint_latitude: {
  //                         type: "number",
  //                         description: "The latitude of the start waypoint."
  //                       },
  //                       start_waypoint_longitude: {
  //                         type: "number",
  //                         description: "The longitude of the start waypoint."
  //                       },
  //                       end_waypoint_latitude: {
  //                         type: "number",
  //                         description: "The latitude of the end waypoint."
  //                       },
  //                       end_waypoint_longitude: {
  //                         type: "number",
  //                         description: "The longitude of the end waypoint."
  //                       }
  //                     }
  //                   }
  //                 }
  //               }
  //             }
  //           }
  //         }
  //       }
  //     }
  //   }
  // },
  // async function (
  //   request: FastifyRequest<{
  //       Params: IParams;
  //       Body: IBusRoute;
  //   }>
  // ) {

  //   const { id } = request.params;
  //   const { name, links } = request.body;


  //   try {

  //     const updatedroute = await prisma.route.update({
  //       where: { id: id },
  //       data: {
  //         full_name: full_name,
  //         phone_no: phone_no,
  //         password: password,
  //         photo_path: photo_path
  //       },
  //     })

  //       return updatedroute;

  //   } catch (error) {

  //     console.error(error);

  //   }
  // }
  // );

  // /**
  //  * UPDATE route information partially by id
  //  */
  // fastify.patch(
  //   '/route/:id',
  //   {
  //     schema: {
  //       description: "This endpoint allows you to replace or update a route information partially by id. This endpoint requires request body of route information with the following properties in order to update the specific route: full name, phone number, password and photo URL path. Essentially, this endpoints allows you to update or replace only parts of the existing route information. This endpoint requires the route ID as a parameter.",
  //       tags: ["route"],
  //       summary: "Replace or update route partially by id",
  //       body: {
  //         type: "object",
  //         properties: {
  //           full_name: {
  //             type: "string",
  //             description: "The full name of the route, providing descriptive information about their identity."
  //           },
  //           phone_no: {
  //             type: "string",
  //             description: "The phone number of the route, providing contact information."
  //           },
  //           password: {
  //             type: "string",
  //             description: "The password of the route, providing authentication for user to login to the app."
  //           },
  //           photo_path: {
  //             type: "string",
  //             description: "The URL path of the route's photo, providing a visual representation of their identity."
  //           }
  //         }
  //       },
  //       response: {
  //         200: {
  //           description: "Successful response",
  //           type: "object",
  //           properties: {
  //             id: {
  //               type: "string",
  //               description: "A unique identifier for the route."
  //             },
  //             full_name: {
  //               type: "string",
  //               description: "The full name of the route, providing descriptive information about their identity."
  //             },
  //             phone_no: {
  //               type: "string",
  //               description: "The phone number of the route, providing contact information."
  //             },
  //             password: {
  //               type: "string",
  //               description: "The password of the route, providing authentication for user to login to the app."
  //             },
  //             photo_path: {
  //               type: "string",
  //               description: "The URL path of the route's photo, providing a visual representation of their identity."
  //             }
  //           }
  //         }
  //       }
  //     }
  //   },
  //   async function (
  //     request: FastifyRequest<{
  //         Params: IParams;
  //         Body: route;
  //     }>
  //   ) {

  //     const { id } = request.params;
  //     const { full_name, phone_no, password, photo_path } = request.body;

  //     try {

  //       const updatedroute = await prisma.route.update({
  //         where: { id: id },
  //         data: {
  //           full_name: full_name,
  //           phone_no: phone_no,
  //           password: password,
  //           photo_path: photo_path
  //         },
  //       })

  //       return updatedroute;

  //     } catch (error) {

  //       console.error(error);

  //     }
  //   }
  // );

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

      const deletedroute = await prisma.route.delete({
        where: {
            id: id,
        },
        include: {
            route_link: true
        }
      })

      return deletedroute;

    } catch (error) {
        console.error(error);

    }

  }
  )
}
