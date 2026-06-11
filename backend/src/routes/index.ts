import { Router } from 'express';
import authRoutes from './auth.routes';
import eleveRoutes from './eleves.routes';
import classesRoutes from './classes.routes';

const router = Router();

// Routes
router.use('/auth', authRoutes);
router.use('/eleves', eleveRoutes);
router.use('/classes', classesRoutes);

// Documentation
router.get('/docs', (req, res) => {
  res.json({
    message: 'École Cheikh Djibril Gaye - API Documentation',
    version: '1.0.0',
    endpoints: {
      auth: '/api/auth',
      eleves: '/api/eleves',
      classes: '/api/classes',
    },
  });
});

export default router;
