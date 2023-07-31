const articleModel = require('../models/articleModel');

exports.getArticle = async (req, res) => {
    try {
        const articles = await articleModel.find();
        // const index = Math.floor(Math.random() * articles.length);
        // const article = articles[index];
        res.status(200).json({
            article: articles,
            message: "Fetched the article successfully !!",
        })
    } catch (error) {
        res.status(500).json({
            error: error,
            message: "Error in fetching the article !!",
        })
    }
}