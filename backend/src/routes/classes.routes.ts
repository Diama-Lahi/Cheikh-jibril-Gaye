import { Router } from 'express';
import { authMiddleware, authorizeRole } from '../middleware/auth';

const router = Router();

// @route GET /api/classes
// @desc Get toutes les classes
router.get('/', authMiddleware, (req, res) => {
  res.json({ message: 'Get all classes' });
});

// @route GET /api/classes/:id
// @desc Get une classe par ID
router.get('/:id', authMiddleware, (req, res) => {
  res.json({ message: `Get classe ${req.params.id}` });
});

// @route POST /api/classes
// @desc Créer une nouvelle classe
router.post('/', authMiddleware, authorizeRole('admin', 'directeur'), (req, res) => {
  res.status(201).json({ message: 'Create classe' });
});

// @route PUT /api/classes/:id
// @desc Modifier une classe
router.put('/:id', authMiddleware, authorizeRole('admin', 'directeur'), (req, res) => {
  res.json({ message: `Update classe ${req.params.id}` });
});

export default router;
