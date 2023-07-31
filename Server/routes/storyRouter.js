const express = require('express');
const { getStory } = require('../controllers/storiesController');
const storyRouter = express.Router();

storyRouter.get('/story', getStory);

module.exports = storyRouter;