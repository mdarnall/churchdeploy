module.exports = function (grunt) {

  grunt.initConfig({
    lint : {
      all: ['themes/active/js/common.js', 'themes/active/js/alertManager.js']
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
          '<config:lint.all>'],
        dest: 'themes/active/js/common-ck.js'
      }
    }
  });
};
