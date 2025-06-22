import { Router } from 'express';
import HandoverController from '../controllers/handoverController';
import { authenticate } from '../middleware/authMiddleware';

const router = Router();
const handoverController = new HandoverController();

// Route to submit a handover
router.post('/handover', authenticate, handoverController.submitHandover);

// Route to retrieve incidents
router.get('/incidents', authenticate, handoverController.getIncidents);

// Route to retrieve handover records
router.get('/handover/:id', authenticate, handoverController.getHandoverById);

export default router;