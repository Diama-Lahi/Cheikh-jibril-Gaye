import { Request, Response, NextFunction } from 'express';
import { logger } from '../utils/logger';

interface CustomError extends Error {
  statusCode?: number;
  details?: any;
}

export const errorHandler = (
  error: CustomError,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  const statusCode = error.statusCode || 500;
  const message = error.message || 'Internal Server Error';

  // Logger l'erreur
  if (statusCode === 500) {
    logger.error('Unhandled error:', {
      message,
      stack: error.stack,
      url: req.originalUrl,
      method: req.method,
    });
  } else {
    logger.warn('Client error:', { message, statusCode });
  }

  // Répondre au client
  res.status(statusCode).json({
    success: false,
    error: message,
    ...(process.env.NODE_ENV === 'development' && { details: error.details }),
  });
};
