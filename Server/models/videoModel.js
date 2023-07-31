const mongoose = require('mongoose');

const subVideo = new mongoose.Schema({
    title: String,
    subtitle: String,
    summary: String,
    description: String,
    article: String,
    coverImage: String,
});

const video = new mongoose.Schema({
    videoArray: [subVideo],
});

module.exports = mongoose.model("Video", video);