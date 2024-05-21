import { Injectable, OnModuleDestroy, OnModuleInit } from '@nestjs/common'
import { PrismaClient } from '@prisma/client'

@Injectable()
export class PrismaService
  extends PrismaClient
  implements OnModuleInit, OnModuleDestroy
{
  private static instance: PrismaClient

  public static getInstance(): PrismaClient {
    if (!PrismaService.instance) {
      PrismaService.instance = new PrismaClient()
    }

    return PrismaService.instance
  }

  onModuleInit() {
    return this.$connect()
  }
  onModuleDestroy() {
    return this.$disconnect()
  }
}
