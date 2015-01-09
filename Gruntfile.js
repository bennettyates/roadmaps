module.exports = function(grunt) {

	grunt.initConfig({
		// express: {
		// 	server: {
		// 		options: {
		// 			server: 'dest/server/server.coffee.js',
		// 			port: 8002,
		// 			bases: 'dest/public'
		// 		}
		// 	}
		// },
		copy: {
			client: {
				files: [
					{ cwd: 'src/', src: '**/*.html', dest: 'dest/', expand: true },
					{ cwd: 'vendor/', src: '**/*', dest: 'dest/client/lib', expand: true }
				]
			}
		},
		handlebars: {
			options: {
				amd: true,
				namespace: false
			},
			all: {
				cwd: 'src',
				src: ['**/*.hbs'],
				dest: 'dest',
				ext: '.hbs.js',
				expand: true
			},
			changed: {
				cwd: 'src',
				src: ['**/*.hbs'],
				dest: 'dest',
				ext: '.hbs.js',
				expand: true,
				filter: grunt.file.changed
			}
		},
		coffee: {
			options: {
				bare: true,
				sourceMap: true
			},
			all: {
				cwd: 'src',
				expand: true,
				flatten: false,
				src: '**/*.coffee',
				dest: 'dest',
				ext: '.coffee.js'
			},
			changed: {
				cwd: 'src',
				expand: true,
				flatten: false,
				src: '**/*.coffee',
				dest: 'dest',
				ext: '.coffee.js',
				filter: grunt.file.changed
			}
		},
		sass: {
			all: {
				cwd: 'src',
				expand: true,
				flatten: false,
				src: '**/*.sass',
				dest: 'dest',
				ext: '.sass.css'
			},
			changed: {
				cwd: 'src',
				expand: true,
				flatten: false,
				src: '**/*.sass',
				dest: 'dest',
				ext: '.sass.css',
				filter: grunt.file.changed
			}
		},
		clean: ['dest'],
		shell: {
			server: {
				command: 'node ./dest/server/server.coffee.js',
				options: {
					async: true,
					stdout: true,
					stderr: true,
					failOnError: true,
					execOptions: {
						cwd: '.'
					}
				}
			},
			mongo: {
				command: 'mongod --dbpath ./data/db',
				options: {
					async: false,
					stdout: true,
					stderr: true,
					failOnError: true,
					execOptions: {
						cwd: '.'
					}
				}
			}
		},
		watch: {
			options: {
				livereload: true
			},
			coffee: {
				files: ['src/**/*.coffee'],
				tasks: ['coffee:changed'],
				options: {
					spawn: false,
				}
			},
			sass: {
				files: ['src/**/*.sass'],
				tasks: ['sass:changed'],
				options: {
					spawn: false,
				}
			},
			handlebars: {
				files: ['src/**/*.hbs'],
				tasks: ['handlebars:changed'],
				options: {
					spawn: false,
				}
			}
		}
	});

	grunt.loadNpmTasks('grunt-contrib-coffee');
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-clean');
	grunt.loadNpmTasks('grunt-contrib-copy');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-handlebars');
	grunt.loadNpmTasks('grunt-express');
	grunt.loadNpmTasks('grunt-shell-spawn');

	grunt.registerTask('compile', ['clean', 'copy', 'coffee:all', 'sass:all', 'handlebars:all']);
	grunt.registerTask('mongo', ['shell:mongo']);
	grunt.registerTask('default', ['compile', 'shell:server', 'watch']);
	// grunt.registerTask('default', ['compile', 'shell:mongodb', 'express:server', 'express-keepalive']);
};