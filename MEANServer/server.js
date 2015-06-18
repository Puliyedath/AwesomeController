var express = require('express');
var path = require('path');
var app = express();

var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());

app.use(express.static(path.join(__dirname, './client')));
app.set('views', path.join(__dirname, './client/views'));
app.set('view engine', 'ejs');

require('./config/mongoose.js');
require('./config/routes.js')(app);

var server = app.listen(1232, function() {
  console.log('cool stuff on: 1232');
});

var io = require("socket.io").listen(server);

socket.on("connection", function () {
	console.log("Socket connection has been established!");

	socket.on("clickTest", function(data) {
		console.log(data);
	})
})