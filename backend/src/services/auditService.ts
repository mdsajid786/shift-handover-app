import { db } from '../utils/db';

export const logAction = async (userId: string, action: string, details: string) => {
    const timestamp = new Date();
    const query = 'INSERT INTO audit_logs (user_id, action, details, timestamp) VALUES (?, ?, ?, ?)';
    await db.query(query, [userId, action, details, timestamp]);
};

export const getAuditLogs = async (userId: string) => {
    const query = 'SELECT * FROM audit_logs WHERE user_id = ? ORDER BY timestamp DESC';
    const [rows] = await db.query(query, [userId]);
    return rows;
};