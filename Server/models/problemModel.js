const mongoose = require('mongoose');

const subProblem = new mongoose.Schema({
    title: String,
    subtitle: String,
    summary: String,
    description: String,
    article: String,
    coverImage: String,
    contentImage1: String,
    contentImage2: String,
});

const problem = new mongoose.Schema({
    problemArray: [subProblem],
});

module.exports = mongoose.model("Problem", problem);