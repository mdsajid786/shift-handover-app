import express from 'express';
import bodyParser from 'body-parser';
import cors from 'cors';
import { createConnection } from './utils/db';
import handoverRoutes from './routes/handoverRoutes';
import { authMiddleware } from './middleware/authMiddleware';

const app = express();
const PORT = process.env.PORT || 5000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(authMiddleware);

// Database connection
createConnection();

// Routes
app.use('/api/handover', handoverRoutes);

// Start the server
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});