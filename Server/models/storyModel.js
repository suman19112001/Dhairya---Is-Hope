const mongoose = require('mongoose');

const subStory = new mongoose.Schema({
    title: String,
    subtitle: String,
    summary: String,
    description: String,
    article: String,
    coverImage: String,
});

const story = new mongoose.Schema({
    storyArray: [subStory],
});

module.exports = mongoose.model("Story", story);