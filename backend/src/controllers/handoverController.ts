import { Request, Response } from 'express';
import { Handover } from '../models/handoverModel';
import { AuditService } from '../services/auditService';
import { EmailService } from '../services/emailService';

export class HandoverController {
  async submitHandover(req: Request, res: Response) {
    try {
      const handoverData = req.body;
      const newHandover = await Handover.create(handoverData);
      
      // Log the action
      await AuditService.logAction(req.user.id, 'Submitted handover', newHandover.id);
      
      // Send email notification
      await EmailService.sendHandoverNotification(newHandover);
      
      return res.status(201).json(newHandover);
    } catch (error) {
      return res.status(500).json({ message: 'Error submitting handover', error });
    }
  }

  async getHandover(req: Request, res: Response) {
    try {
      const handoverId = req.params.id;
      const handover = await Handover.findById(handoverId);
      
      if (!handover) {
        return res.status(404).json({ message: 'Handover not found' });
      }
      
      return res.status(200).json(handover);
    } catch (error) {
      return res.status(500).json({ message: 'Error retrieving handover', error });
    }
  }

  async getAllHandovers(req: Request, res: Response) {
    try {
      const handovers = await Handover.findAll();
      return res.status(200).json(handovers);
    } catch (error) {
      return res.status(500).json({ message: 'Error retrieving handovers', error });
    }
  }
}