const mongoose = require('mongoose');

const userSchema = mongoose.Schema(
    {
        email: {
            type: String,
            required: true,
            lowercase: true,
        },
        name: {
            type: String,
            required: true,
            default: "abc",
        },
        password: {
            type: String,
            required: true,
        }
    }, { timestamps: true }
)
module.exports = mongoose.model("user", userSchema);