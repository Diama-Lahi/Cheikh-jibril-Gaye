import { Router } from 'express';
import { authMiddleware } from '../middleware/auth';

const router = Router();

// @route POST /api/auth/login
// @desc Login utilisateur
router.post('/login', (req, res) => {
  // TODO: Implémenter la logique de login
  res.json({ message: 'Login endpoint' });
});

// @route POST /api/auth/register
// @desc Enregistrer nouvel utilisateur
router.post('/register', (req, res) => {
  // TODO: Implémenter la logique de registration
  res.json({ message: 'Register endpoint' });
});

// @route POST /api/auth/logout
// @desc Logout utilisateur
router.post('/logout', authMiddleware, (req, res) => {
  res.json({ message: 'Logout successful' });
});

// @route GET /api/auth/me
// @desc Get profil utilisateur connecté
router.get('/me', authMiddleware, (req, res) => {
  res.json({ user: req.user });
});

export default router;
