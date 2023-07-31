const mongoose = require('mongoose');

const subArticle = new mongoose.Schema({
    title: String,
    subtitle: String,
    summary: String,
    description: String,
    coverImage: String,
});

const article = new mongoose.Schema({
    articleArray: [subArticle],
});

module.exports = mongoose.model("Article", article);