var express = require('express');
var path = require('path');
var app = express();

var bodyParser = require('body-parser');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded());

app.use(express.static(path.join(__dirname, './client')));
app.set('views', path.join(__dirname, './client/views'));
app.set('view engine', 'ejs');

// require('./config/mongoose.js');
// require('./config/routes.js')(app);

app.get('/', function(req, res) {
	res.render('index');
})

var server = app.listen(1232, function() {
  console.log('cool stuff on: 1232');
});

var io = require("socket.io").listen(server);

io.sockets.on("connection", function (socket) {
	console.log("Socket connection has been established!");

	socket.on("userName", function (data) {
		console.log("user '"+data.userName+"' is connected on "+socket.id);
        socket['userName'] = data.userName;
	})

	socket.on("clickTest", function(data) {
		console.log("in server socket");
		console.log(data);
	})

	socket.on("OPressed", function (data) {
		console.log("["+socket.userName+"] received 'O'");
	})

	socket.on("XPressedUp", function (data) {
		console.log("["+socket.userName+"] received 'X Up!'");
	})

	socket.on("XPressedDown", function (data) {
		console.log("["+socket.userName+"] received 'X Down!'");
	})

	socket.on("YPressed", function (data) {
		console.log("["+socket.userName+"] received 'Y'");
	})

	socket.on("down", function (data) {
		console.log("["+socket.userName+"] received 'DOWN'");
	})

	socket.on("up", function (data) {
		console.log("["+socket.userName+"] received 'UP'");
	})

	socket.on("right", function (data) {
		console.log("["+socket.userName+"] received 'RIGHT'");
	})

	socket.on("left", function (data) {
		console.log("["+socket.userName+"] received 'LEFT'");
	})
})
