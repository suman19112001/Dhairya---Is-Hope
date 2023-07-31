const remedyModel = require('../models/remedyModel');

exports.getRemedy = async (req, res) => {
    try {
        const remedies = await remedyModel.find();
        // const index = Math.floor(Math.random() * remedies.length);
        // const remedy = remedies[index];
        res.status(200).json({
            remedy: remedies,
            message: "Fetched remedy successfully !!",
        })
    } catch (error) {
        res.status(500).json({
            error: error,
            message: "Error in fetching the remedy !!",
        })
    }
}