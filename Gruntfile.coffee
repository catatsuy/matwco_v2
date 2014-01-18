module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  grunt.registerTask 'default', [
    'watch'
    'sass'
    'cssmin'
    'coffee'
  ]

  grunt.initConfig
    sass:
      dist:
        files:
          'public/css/main.css': [
            'public/scss/base.scss'
            'public/scss/main.scss'
          ]
    cssmin:
      compress:
        files:
          'public/css/main.min.css': 'public/css/main.css'
    coffee:
      compile:
        files:
          'public/js/main.js': ['public/js/*.coffee']
    watch:
      coffee:
        files: "<%= coffee.dist.src %>"
        tasks: 'coffee:dist'
      sass:
        files: "<% sass.dist.src %>"
        tasks: 'sass:dist'
