import User, { Role } from '@/domains/user/entities/user.entity'
import { expect, test } from 'vitest'

test('create an user', () => {
  const user = new User({
    userName: 'John',
    password: 'password',
    role: Role.ADMIN,
  })

  expect(user).toBeInstanceOf(User)
  expect(user.getUserName()).toEqual('John')
  expect(user.getUserRole()).toEqual(Role.ADMIN)
})
