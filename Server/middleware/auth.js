const jwt = require('jsonwebtoken');
const SECRET_KEY = "vitb";

const auth = (req, res, next) => {
    try {
        let token = req.header.authorization;
        if (token) {
            token = token.split(" ")[1];
            let user = jwt.verify(token, SECRET_KEY);
            req.userId = user.id;
        }
        else {
            return res.status(401).json({ message: "Unauthorized user !!" });
        }
        next();
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Something went wrong !!" });
    }
}
module.exports = auth;