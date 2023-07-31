const express = require('express');
const app = express();
const mongoose = require('mongoose');
const userRouter = require('./routes/userRouter');
const blogRouter = require('./routes/blogRouter');
const articleRouter = require('./routes/articleRouter');
const problemRouter = require('./routes/problemRouter');
const remedyRouter = require('./routes/remedyRouter');
const storyRouter = require('./routes/storyRouter');
const videoRouter = require('./routes/videoRouter');

app.use(express.json());
app.use('/users', userRouter);
app.use('/blogs', blogRouter);
app.use('/articles', articleRouter);
app.use('/problems', problemRouter);
app.use('/remedies', remedyRouter);
app.use('/stories', storyRouter);
app.use('/videos', videoRouter);
app.get('/', (req, res) => {
    res.send("Dhairya: There is a hope !!");
})
mongoose.connect('mongodb+srv://dhairya:vitb@dhairya-cluster.m86tlsf.mongodb.net/?retryWrites=true&w=majority', {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
    .then(() => {
        app.listen(5000, () => {
            console.log("Listening on port 5000");
        })
    })
    .catch((e) => {
        console.log(e);
        console.log("Error connecting to the DB !!");
    })
