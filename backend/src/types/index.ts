export interface User {
  id: number;
  username: string;
  email: string;
  password: string;
  role: 'admin' | 'user';
  createdAt: Date;
  updatedAt: Date;
}

export interface Incident {
  id: number;
  title: string;
  description: string;
  createdAt: Date;
  updatedAt: Date;
  userId: number;
}

export interface Handover {
  id: number;
  date: Date;
  shift: string;
  userId: number;
  incidents: Incident[];
  createdAt: Date;
  updatedAt: Date;
}