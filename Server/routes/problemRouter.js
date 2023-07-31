const express = require('express');
const { getProblem } = require('../controllers/problemController');
const problemRouter = express.Router();

problemRouter.get('/problem', getProblem);

module.exports = problemRouter;