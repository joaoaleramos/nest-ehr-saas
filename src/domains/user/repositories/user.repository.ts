import { PrismaService } from 'src/prisma/prisma.service'
import { User } from '@prisma/client'

export interface iUserRepository {
  getAllUsers(): Promise<User[]>
  getUserById(userId: string): Promise<User> | undefined
  createUser(user: User): Promise<User>
  updateUser(user: User): Promise<User> | Error
  deleteUser(userId: string): Promise<User> | undefined
}

export default class UserRepository implements iUserRepository {
  constructor(private dbUserClientService: PrismaService) {}

  public async getAllUsers(): Promise<User[]> {
    const users = await this.dbUserClientService.user.findMany()

    return users
  }

  public async getUserById(userId: string): Promise<User> {
    const userFound = await this.dbUserClientService.user.findFirst({
      where: {
        userId: userId,
      },
    })
    return userFound
  }

  public async createUser(user: User): Promise<User> {
    const createdUser = await this.dbUserClientService.user.create({
      data: {
        ...user,
      },
    })

    return createdUser
  }

  public async updateUser(user: User): Promise<User> {
    const updatedUser = await this.dbUserClientService.user.update({
      where: {
        userId: user.userId,
      },
      data: {
        username: user.username,
        password: user.password,
        role: user.role,
        updatedAt: new Date(),
      },
    })
    return updatedUser
  }

  public async deleteUser(userId: string): Promise<User> {
    const deletedUser = await this.dbUserClientService.user.delete({
      where: {
        userId: userId,
      },
    })
    return deletedUser
  }
}
