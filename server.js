const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;

// Serve static files from the public folder
app.use(express.static(path.join(__dirname)));

// Fallback route to index.html
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname,'index.html'));
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
