const videoModel = require('../models/videoModel');

exports.getVideo = async (req, res) => {
    try {
        const videos = await videoModel.find();
        // const index = Math.floor(Math.random() * videos.length);
        // const video = videos[index];
        res.status(200).json({
            video: videos,
            message: "Fetched video successfully !!",
        })
    } catch (error) {
        res.status(500).json({
            error: error,
            message: "Error in fetching the video !!",
        })
    }
}