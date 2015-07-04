temp = require 'temp'
path = require 'path'
fs = require 'fs'
_s = require 'underscore.string'

module.exports = (grunt) ->
  grunt.loadTasks('tasks')

  if !!grunt.option('workDir')
    workDir = grunt.option('workDir')
  else
    # temp.track()
    if process.platform is 'win32'
      affixes =
        prefix: 'prob2-dev'
        suffix: ''
        dir: process.cwd().split(path.sep)[0]
      workDir = temp.mkdirSync affixes
    else
      workDir = temp.mkdirSync 'prob2-dev'

  grunt.log.writeln '(i) Work dir is ' + workDir

  if grunt.option('showWorkDir')
    cp = require 'child_process'
    cp.exec 'open ' + workDir

  appName = 'ProB'
  installDir = path.join(__dirname, '..', 'dist', process.platform, appName)
  if process.platform is 'darwin'
    installDir += '.app'

  # Get Atom Version from .atomrc
  atomrc = fs.readFileSync(path.join(__dirname, '..', '.atomrc')).toString()
  lines = atomrc.split "\n"
  atomVersion = null
  for line in lines
    [key, value] = line.split '='
    if key.indexOf('ATOM_VERSION') > 0
      atomVersion = _s.trim(value)
  grunt.log.writeln '(i) Atom version is ' + atomVersion

  probVersion = "2.0.0"
  grunt.log.writeln '(i) ProB version is ' + probVersion

  grunt.initConfig
    workDir: workDir
    atomVersion: atomVersion
    probVersion: probVersion
    appName: appName
    installDir: installDir

  tasks = []

  if !grunt.option('workDir')
    tasks = tasks.concat [
      'download-atom',
      'patch-atom-version',
      'inject-packages',
      'bootstrap-atom',
      'copy-resources',
    ]

  tasks = tasks.concat [
    'patch-code',
    'build-app',
    'package-app'
  ]

  grunt.registerTask('default', tasks)
