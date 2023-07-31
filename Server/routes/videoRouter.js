const express = require('express');
const { getVideo } = require('../controllers/youtubeController');
const videoRouter = express.Router();

videoRouter.get('/video', getVideo);

module.exports = videoRouter;