const mongoose = require('mongoose');

const subBlog = new mongoose.Schema({
    title: String,
    subtitle: String,
    summary: String,
    description: String,
    article: String,
    coverImage: String,
    contentImage1: String,
    contentImage2: String,
});

const blog = new mongoose.Schema({
    blogArray: [subBlog],
});

module.exports = mongoose.model("Blog", blog);