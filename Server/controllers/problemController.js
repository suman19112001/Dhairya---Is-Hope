const problemModel = require('../models/problemModel');

exports.getProblem = async (req, res) => {
    try {
        const problems = await problemModel.find();
        // const index = Math.floor(Math.random() * problems.length);
        // const problem = problems[index];
        res.status(200).json({
            problem: problems,
            message: "Fetched the problem successfully",
        })
    } catch (error) {
        res.status(500).json({
            error: error,
            message: "Error in fetching the problem !!",
        })
    }
}