// Karma configuration
// Generated on Tue Oct 06 2015 20:29:11 GMT-0300 (Hora estándar de Argentina)

module.exports = function(config) {
  config.set({
    basePath: '',
    frameworks: ['jasmine'],
	files: [
	        'node_modules/angular/*.js',
	        'node_modules/angular-animate/*.js',
	        'node_modules/angular-loading-bar/*.js',
	        'node_modules/angular-ui-router/*.js',
	        'node_modules/bootbox/*.js',
	        'node_modules/bootstrap/*.js',
	        'node_modules/jquery/*.js',
	        'node_modules/underscore/*.js',
	        'node_modules/angular-mocks/*.js',
	        'test/logeoTest.js'
    ],
    exclude: [
    ],
    preprocessors: {
    },
    reporters: ['progress'],
    port: 9000,
    colors: true,
    logLevel: config.LOG_INFO,
    autoWatch: true,
    browsers: [
               'Firefox',
               'Chrome'
    ],
	singleRun: true
  })
}
