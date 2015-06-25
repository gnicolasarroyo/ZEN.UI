"use strict"

concat  = require "gulp-concat"
header  = require "gulp-header"
stylus  = require "gulp-stylus"
pkg     = require "./../package.json"

banner = [
  "/**"
  " * normalize.css - Normalize.css is a customisable CSS file that makes browsers render all elements more consistently and in line with modern standards. The project relies on researching the differences between default browser styles in order to precisely target only the styles that need or benefit from normalizing."
  " * @source  zen.ui.normalize.css"
  " * @version v3.0.3"
  " * @link    https://github.com/bymathias/normalize.styl"
  " * @author  Nicolas Gallagher, Mathias Brouilly"
  " * @license MIT"
  " */"
  ""
].join("\n")

source = [
  "source/stylus/normalize.styl"
]

module.exports = (_gulp)->
  _gulp.src source
    .pipe concat "zen.ui.normalize.styl"
    .pipe stylus
      compress: true
      errors  : true
    .pipe header banner, pkg: pkg
    .pipe _gulp.dest "build/css/"
