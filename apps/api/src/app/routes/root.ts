/* eslint-disable @typescript-eslint/no-unused-vars */
import type { FastifyReply, FastifyRequest, FastifyInstance } from "fastify";
import { IParams } from "../interfaces/interface";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default async function routes(fastify: FastifyInstance, options) {

}
