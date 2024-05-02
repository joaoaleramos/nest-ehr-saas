import { v4 as uuid } from 'uuid'
export enum Role {
  ADMIN = 'ADMIN',
  HEALTHCARE_PROFESSIONAL = 'HEALTHCARE_PROFESSIONAL',
  PATIENT = 'PATIENT',
  RECEPTIONIST = 'RECEPTIONIST',
  STAFF = 'STAFF',
}

export interface UserProps {
  userId?: string
  userName: string
  password: string
  role: Role
  createdAt?: Date
  updatedAt?: Date
}

export default class User {
  private props: UserProps

  constructor(props: UserProps) {
    this.props = props
    this.props.userId = uuid()
  }

  public getUserId(): string {
    return this.props.userId
  }

  public getUserName(): string {
    return this.props.userName
  }

  public getUserRole(): Role {
    return this.props.role
  }

  public getCreatedAt(): Date {
    return this.props.createdAt || new Date()
  }

  public getUpdatedAt(): Date {
    return this.props.updatedAt || new Date()
  }
}
