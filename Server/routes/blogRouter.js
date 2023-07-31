const express = require('express');
const { getBlog } = require('../controllers/blogController');
const blogRouter = express.Router();

blogRouter.get('/blog', getBlog);

module.exports = blogRouter;