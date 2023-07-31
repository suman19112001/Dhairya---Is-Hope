const express = require('express');
const { getArticle } = require('../controllers/articleController');
const articleRouter = express.Router();

articleRouter.get('/article', getArticle);

module.exports = articleRouter;