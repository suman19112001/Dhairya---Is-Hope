const express = require('express');
const { getRemedy } = require('../controllers/remediesController');
const remedyRouter = express.Router();

remedyRouter.get('/remedy', getRemedy);

module.exports = remedyRouter;