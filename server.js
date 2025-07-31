const express = require('express');
const path = require('path');
const app = express();
const port = process.env.PORT || 3000;

// Serve static files from the public folder
app.use(express.static(path.join(__dirname, 'nexus')));

// Fallback route to index.html
app.get('*', (req, res) => {
  res.sendFile(path.join(__dirname, 'nexus', 'index.html'));
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
