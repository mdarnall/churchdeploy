module.exports = function (grunt) {

  grunt.initConfig({
    lint : {
      all: ['themes/active/js/common.js']
    },

    watch : {
      scripts: {
        files: '<config:lint.all>',
        tasks: 'lint concat'
      }
    },
    concat : {
      dist: {
        src : ['js/*.js',
          'themes/active/js/audio.min.js', 
          'themes/active/js/common.js'],
        dest: 'themes/active/js/common-ck.js'
      }
    }
  });
};
