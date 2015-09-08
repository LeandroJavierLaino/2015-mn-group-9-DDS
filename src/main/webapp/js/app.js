"use strict"

var logeoApp = angular.module('logeoApp', []);

logeoApp.controller('logeoCtrl', function(){
	return new Logeo();
});