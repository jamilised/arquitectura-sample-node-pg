import { Router } from 'express';
import { StatusCodes } from 'http-status-codes';
import CalificacionesService from './../services/calificaciones-service.js'

const router = Router();
const currentService = new CalificacionesService();

// GET /api/calificaciones
router.get('', async (req, res) => {
    try {
        console.log(`CalificacionesController.get`);
        const returnArray = await currentService.getAllAsync();
        if (returnArray != null) {
            res.status(StatusCodes.OK).json(returnArray);
        } else {
            res.status(StatusCodes.INTERNAL_SERVER_ERROR).send(`Error interno.`);
        }
    } catch (error) {
        console.log(error);
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).send(`Error: ${error.message}`);
    }
});

// GET /api/calificaciones/alumno/:idAlumno
// Debe ir ANTES de /:id para que Express no lo interprete como un id numérico
router.get('/alumno/:idAlumno', async (req, res) => {
    try {
        const idAlumno = req.params.idAlumno;
        const returnArray = await currentService.getByAlumnoAsync(idAlumno);
        res.status(StatusCodes.OK).json(returnArray);
    } catch (error) {
        console.log(error);
        if (error.message.includes('no existe')) {
            res.status(StatusCodes.NOT_FOUND).send(`Error: ${error.message}`);
        } else {
            res.status(StatusCodes.INTERNAL_SERVER_ERROR).send(`Error: ${error.message}`);
        }
    }
});

// GET /api/calificaciones/:id
router.get('/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const returnEntity = await currentService.getByIdAsync(id);
        if (returnEntity != null) {
            res.status(StatusCodes.OK).json(returnEntity);
        } else {
            res.status(StatusCodes.NOT_FOUND).send(`No se encontró la calificación (id: ${id}).`);
        }
    } catch (error) {
        console.log(error);
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).send(`Error: ${error.message}`);
    }
});

// POST /api/calificaciones
router.post('', async (req, res) => {
    try {
        const entity = req.body;
        const newEntity = await currentService.createAsync(entity);
        if (newEntity != null) {
            res.status(StatusCodes.CREATED).json(newEntity);
        } else {
            res.status(StatusCodes.BAD_REQUEST).json(null);
        }
    } catch (error) {
        console.log(error);
        if (error.statusCode === 409) {
            res.status(StatusCodes.CONFLICT).json({ error: error.message });
        } else {
            res.status(StatusCodes.BAD_REQUEST).json({ error: error.message });
        }
    }
});

// PUT /api/calificaciones/:id
router.put('/:id', async (req, res) => {
    try {
        const id = parseInt(req.params.id);
        const entity = req.body;

        // Ignorar id_alumno e id_materia si vienen en el body
        delete entity.id_alumno;
        delete entity.id_materia;

        entity.id = id;
        const rowsAffected = await currentService.updateAsync(entity);
        res.status(StatusCodes.OK).json(rowsAffected);
    } catch (error) {
        console.log(error);
        if (error.message.includes('No se encontró la calificación')) {
            res.status(StatusCodes.NOT_FOUND).send(`Error: ${error.message}`);
        } else {
            res.status(StatusCodes.BAD_REQUEST).send(`Error: ${error.message}`);
        }
    }
});

// DELETE /api/calificaciones/:id
router.delete('/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const rowCount = await currentService.deleteByIdAsync(id);
        if (rowCount != 0) {
            res.status(StatusCodes.OK).json(null);
        } else {
            res.status(StatusCodes.NOT_FOUND).send(`No se encontró la calificación (id: ${id}).`);
        }
    } catch (error) {
        console.log(error);
        res.status(StatusCodes.INTERNAL_SERVER_ERROR).send(`Error: ${error.message}`);
    }
});

export default router;
