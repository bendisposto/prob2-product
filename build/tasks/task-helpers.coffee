path = require 'path'
fs = require 'fs-extra'

module.exports = (grunt) ->
  injectPackage: (name, version=null) ->
    packageJson = path.join(grunt.config.get('workDir'), 'package.json')
    packages = JSON.parse(fs.readFileSync(packageJson))
    if !version
      delete packages.packageDependencies[name]
    else
      packages.packageDependencies[name] = version
    fs.writeFileSync(packageJson, JSON.stringify(packages, null, '  '))

  deletePackage: (name) ->
    packageJson = path.join(grunt.config.get('workDir'), 'package.json')
    packages = JSON.parse(fs.readFileSync(packageJson))
    delete packages.packageDependencies[name]
    fs.writeFileSync(packageJson, JSON.stringify(packages, null, '  '))


  injectDependency: (name, version=null) ->
    packageJson = path.join(grunt.config.get('workDir'), 'package.json')
    packages = JSON.parse(fs.readFileSync(packageJson))
    if !version
      delete packages.dependencies[name]
    else
      packages.dependencies[name] = version
    fs.writeFileSync(packageJson, JSON.stringify(packages, null, '  '))


  listPackages: () ->
    grunt.log.writeln 'Packages:'
    packageJson = path.join(grunt.config.get('workDir'), 'package.json')
    packages = JSON.parse(fs.readFileSync(packageJson))
    for p in packages
      grunt.log.writeln p
    grunt.log.writeln '+++'
