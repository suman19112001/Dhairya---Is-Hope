const blogModel = require('../models/blogModel');

exports.getBlog = async(req, res) => {
    try {
        const blogs = await blogModel.find();
        // const index = Math.floor(Math.random() * blogs.length);
        // const blog = blogs[index];
        res.status(200).json({
            blog: blogs,
            message: "Fetched a blog",
        })
    } catch (error) {
        res.status(500).json({
            error: error,
            message: "Error in fetching the blog !!",
        })        
    }
}