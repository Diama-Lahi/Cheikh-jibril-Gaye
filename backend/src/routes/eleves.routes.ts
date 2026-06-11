import { Router } from 'express';
import { authMiddleware, authorizeRole } from '../middleware/auth';

const router = Router();

// @route GET /api/eleves
// @desc Get tous les élèves
router.get('/', authMiddleware, authorizeRole('admin', 'directeur', 'secretaire'), (req, res) => {
  res.json({ message: 'Get all eleves' });
});

// @route GET /api/eleves/:id
// @desc Get un élève par ID
router.get('/:id', authMiddleware, (req, res) => {
  res.json({ message: `Get eleve ${req.params.id}` });
});

// @route POST /api/eleves
// @desc Créer un nouvel élève
router.post('/', authMiddleware, authorizeRole('admin', 'secretaire'), (req, res) => {
  res.status(201).json({ message: 'Create eleve' });
});

// @route PUT /api/eleves/:id
// @desc Modifier un élève
router.put('/:id', authMiddleware, authorizeRole('admin', 'secretaire'), (req, res) => {
  res.json({ message: `Update eleve ${req.params.id}` });
});

// @route DELETE /api/eleves/:id
// @desc Supprimer un élève
router.delete('/:id', authMiddleware, authorizeRole('admin'), (req, res) => {
  res.json({ message: `Delete eleve ${req.params.id}` });
});

export default router;
