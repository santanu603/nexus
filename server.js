const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

// Serve static files if needed
app.use(express.static('public'));

// Basic route
app.get('/', (req, res) => {
  res.send('Hello from Elastic Beanstalk Node.js app!');
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
