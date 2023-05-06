const express = require("express");
const app = express();

// set port, listen for requests
const PORT = 5009;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});