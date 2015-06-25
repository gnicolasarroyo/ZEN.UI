"use strict"

concat  = require "gulp-concat"
header  = require "gulp-header"
stylus  = require "gulp-stylus"
pkg     = require "./../package.json"

banner = [
  "/**"
  " * <%= pkg.name %> - <%= pkg.description %>"
  " * @source  zen.ui.grid.css"
  " * @version v<%= pkg.version %>"
  " * @link    <%= pkg.homepage %>"
  " * @author  <%= pkg.author %>"
  " * @license <%= pkg.license %>"
  " */"
  ""
].join("\n")

source = [
  "source/stylus/grid/variables.styl" 
  "source/stylus/grid/mixins.styl"
  "source/stylus/grid/grid.styl"
]

module.exports = (_gulp)->
  _gulp.src source
    .pipe concat "zen.ui.grid.styl"
    .pipe stylus
      compress: true
      errors  : true
    .pipe header banner, pkg: pkg
    .pipe _gulp.dest "build/css/"

