"use strict"

gulp = require("gulp")


###
Config Task Function
@param      {String}    _task is a Task Name
@return     {Function}
###
configTask = (_task) ->
  require("./tasks/#{_task}")(gulp)


###
Stylus Task
Running "stylus_grid"
###
gulp.task "stylus", ->
  configTask "stylus_normalize"
  configTask "stylus_grid"


gulp.task "init", ["stylus"]


gulp.task "default", ->
  gulp.watch "source/stylus/**/*.styl", ["stylus"]