var gulp = require('gulp');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');

gulp.task('default', function() {
  gulp.start('coffee');
  // place code for your default task here
});


gulp.task('coffee', function() {
  gulp.src('./project/coffee/*.coffee')
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest('./project/static/js/'));
});