const fs = require('fs');

function Logger() {
	this.file_error = "error.log";
	this.file_info = "info.log";
	this.file_debug = "debug.log";
}

Logger.prototype.error = function(type, message) {
	var log = "[" + getDateTime() + "] " + type + " : " + message + "\n";
	fs.appendFile(this.file_error, log, (err) => {
		if (err) throw err;
	});
};

Logger.prototype.info = function(type, message) {
	var log = "[" + getDateTime() + "] " + type + " : " + message + "\n";
	fs.appendFile(this.file_info, log, (err) => {
		if (err) throw err;
	});
};

Logger.prototype.debug = function(type, message) {
	var log = "[" + getDateTime() + "] " + type + " : " + message + "\n";
	fs.appendFile(this.file_debug, log, (err) => {
		if (err) throw err;
	});
};

Logger.prototype.close = function() {
	fclose(this.file_error);
	fclose(this.file_info);
	fclose(this.file_debug);
};

function getDateTime() {

    var date = new Date();

    var hour = date.getHours();
    hour = (hour < 10 ? "0" : "") + hour;

    var min  = date.getMinutes();
    min = (min < 10 ? "0" : "") + min;

    var sec  = date.getSeconds();
    sec = (sec < 10 ? "0" : "") + sec;

    var year = date.getFullYear();

    var month = date.getMonth() + 1;
    month = (month < 10 ? "0" : "") + month;

    var day  = date.getDate();
    day = (day < 10 ? "0" : "") + day;

    return year + ":" + month + ":" + day + ":" + hour + ":" + min + ":" + sec;

}

var logger = new Logger();

module.exports = Logger;
module.exports.logger = logger;