const mongoose = require('mongoose');

const subRemedy = new mongoose.Schema({
    title: String,
    subtitle: String,
    summary: String,
    description: String,
    article: String,
    coverImage: String,
    contentImage1: String,
    contentImage2: String,
});

const remedy = new mongoose.Schema({
    remedyArray: [subRemedy],
});

module.exports = mongoose.model("Remedy", remedy);