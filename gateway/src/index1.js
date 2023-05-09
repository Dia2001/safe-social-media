const express = require('express');
const proxy = require('express-http-proxy');
const cors = require('cors');

const app = express();

// Thiết lập middleware cors
app.use(cors());
app.use(express.json())

// Định tuyến tất cả các yêu cầu đến máy chủ user-service
app.use('/api/v1/auth/login', proxy('http://localhost:5010'));

// Định tuyến tất cả các yêu cầu đến máy chủ post-service
app.use('/post', proxy('http://localhost:5000'));

app.listen(9999, () => {
  console.log('API Gateway is running on port 3000');
});