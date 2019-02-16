var Logger = require('./Logger.js');

exports.rgbToHex = function(red, green, blue) {

  var redHex   = red.toString(16);
  var greenHex = green.toString(16);
  var blueHex  = blue.toString(16);

  var hex = pad(redHex) + pad(greenHex) + pad(blueHex);
  
  if ( hex.length !== 6 ) {
	  Logger.logger.error("INCORRECT_RESULT", "Résultat de la conversion en hexadécimale incorrect");
	  throw "error test";
  }
};

exports.hexToRgb = function(hex) {

  var red   = parseInt(hex.substring(0, 2), 16);
  var green = parseInt(hex.substring(2, 4), 16);
  var blue  = parseInt(hex.substring(4, 6), 16);

  return [red, green, blue];

};

function pad(hex) {
	if ( hex.length === 1 )
		return "0" + hex
	else if ( hex.length === 2 )
		return hex;
}