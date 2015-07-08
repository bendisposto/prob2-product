fs = require 'fs-extra'
path = require 'path'
cp = require 'child_process'
workDir = null

replaceAtomFile = (from) ->
  to = from.replace '/', path.sep
  fs.copySync path.join(__dirname, '..', 'atom', from),
              path.join(workDir, to)

pathFile = (patchFile, targetFile, callback) ->
  console.log ' Applying ' + patchFile
  patchFile = path.join(__dirname, 'patches', patchFile)
  targetFile = path.join(workDir, targetFile.replace('/', path.sep))

  command = 'patch -i ' + patchFile + ' ' + targetFile
  result = cp.exec command, (error, stdout, stderr) ->
    if error
      process.stderr.write error
      process.exit error.code
    else
      callback()

replaceInFile = (file, substr, newSubstr) ->
  file = file.replace('/', path.sep)
  contents = fs.readFileSync(file).toString()
  contents = contents.replace substr, newSubstr
  fs.writeFileSync file, contents

module.exports = (grunt) ->
  grunt.registerTask 'patch-code', 'Patches Atom code', ->
    workDir = grunt.config.get('workDir')
    probVersion = grunt.config.get('probVersion')
    done = @async()

    # Remove broken spec
    fs.removeSync path.join(workDir, 'node_modules', 'coffeestack', 'spec')
    fs.removeSync path.join(workDir, 'node_modules', 'exception-reporting', 'node_modules', 'coffeestack', 'spec')

    # Replace files
    replaceAtomFile 'menus/darwin.cson'
    replaceAtomFile 'menus/win32.cson'
    replaceAtomFile 'menus/linux.cson'

    # Patching
    pathFile 'atom-application.patch', 'src/browser/atom-application.coffee', ->
      file = path.join workDir, 'src/browser/atom-application.coffee'
      replaceInFile file, '#{probVersion}', probVersion
      pathFile 'atom.patch', 'src/atom.coffee', ->
        pathFile 'main.patch', 'src/browser/main.coffee', ->
          pathFile 'prebuild-less-task.patch', 'build/tasks/prebuild-less-task.coffee', ->
            pathFile 'auto-update-manager.patch', 'src/browser/auto-update-manager.coffee', ->
              pathFile 'atom-window.patch', 'src/browser/atom-window.coffee', ->
                pathFile 'workspace.patch', 'src/workspace.coffee', ->
                  pathFile 'Gruntfile.patch', 'build/Gruntfile.coffee', ->
                    if process.platform is 'darwin'
                      pathFile 'atom-Info.patch', 'resources/mac/atom-Info.plist', ->
                        pathFile 'codesign-task.patch', 'build/tasks/codesign-task.coffee', ->
                    #      pathFile 'darwin.patch', 'menus/darwin.cson', ->
                            done()
                    else
                       done()
                    #else if process.platform is 'win32'
                    #  pathFile 'win32.patch', 'menus/win32.cson', ->
                    #    done()
                    #else
                    #  pathFile 'linux.patch', 'menus/linux.cson', ->
                    #    done()
