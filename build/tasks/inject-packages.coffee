path = require 'path'
fs = require 'fs-extra'
workDir = null

module.exports = (grunt) ->
  {injectPackage, deletePackage, injectDependency,listPackages} = require('./task-helpers')(grunt)

  grunt.registerTask 'inject-packages', 'Inject packages into packages.json and node_modules dir', ->
    workDir = grunt.config.get 'workDir'

    deletePackage 'language-c'
    deletePackage 'language-csharp'
    deletePackage 'language-gfm'
    deletePackage 'language-go'
    deletePackage 'language-java'
    deletePackage 'language-less'
    deletePackage 'language-make'
    deletePackage 'language-mustache'
    deletePackage 'language-objective-c'
    deletePackage 'language-perl'
    deletePackage 'language-php'
    deletePackage 'language-property-list'
    deletePackage 'language-python'
    deletePackage 'language-ruby'
    deletePackage 'language-ruby-on-rails'
    deletePackage 'language-sass'
    deletePackage 'language-shellscript'
    deletePackage 'language-source'
    deletePackage 'language-sql'
    deletePackage 'language-text'
    deletePackage 'language-todo'
    deletePackage 'language-toml'
    deletePackage 'language-xml'
    deletePackage 'language-yaml'
    deletePackage 'language-clojure'
    deletePackage 'language-coffee-script'
    deletePackage 'language-css'
    deletePackage 'language-git'
    deletePackage 'language-html'
    deletePackage 'language-hyperlink'
    deletePackage 'language-javascript'
    deletePackage 'language-json'
    deletePackage 'autocomplete-atom-api'
    deletePackage 'autocomplete-css'
    deletePackage 'autocomplete-html'
    deletePackage 'autocomplete-plus'
    deletePackage 'autocomplete-snippets'
    deletePackage 'snippets'
    deletePackage 'git-diff'
    deletePackage 'markdown-preview'
    deletePackage 'open-on-github'
    deletePackage 'spell-check'
    deletePackage 'timecop'
    deletePackage 'archive-view'
    deletePackage 'autoflow'
    deletePackage 'autosave'
    deletePackage 'background-tips'
    deletePackage 'bookmarks'
    deletePackage 'command-palette'
    deletePackage 'dev-live-reload'
    deletePackage 'image-view'
    deletePackage 'incompatible-packages'
    deletePackage 'keybinding-resolver'
    deletePackage 'link'
    deletePackage 'notifications'
    deletePackage 'package-generator'
    deletePackage 'styleguide'
    deletePackage 'tabs'
    deletePackage 'update-package-dependencies'
    deletePackage 'whitespace'
    deletePackage 'wrap-guide'
    deletePackage 'metrics'
    deletePackage 'release-notes'
    deletePackage 'welcome'
    deletePackage 'exception-reporting'
    deletePackage 'deprecation-cop'

# Selected ...

    #deletePackage 'status-bar'
    #deletePackage 'tree-view'
    #deletePackage 'settings-view'
    #deletePackage 'encoding-selector'
    #deletePackage 'go-to-line'
    #deletePackage 'bracket-matcher'
    #deletePackage 'grammar-selector'
    #deletePackage 'find-and-replace'
    #deletePackage 'fuzzy-finder'



# The prebuild-less-task defines which themes have to be present.
# Reduced to atom-dark-ui/base16-tomorrow-dark-theme

    deletePackage 'atom-light-syntax'
    deletePackage 'atom-light-ui'
    deletePackage 'base16-tomorrow-light-theme'
    deletePackage 'one-dark-ui'
    deletePackage 'one-dark-syntax'
    deletePackage 'one-light-syntax'
    deletePackage 'one-light-ui'
    deletePackage 'solarized-dark-syntax'
    deletePackage 'solarized-light-syntax'

    #deletePackage 'atom-dark-syntax' #required
    #deletePackage 'atom-dark-ui' #required
    #deletePackage 'base16-tomorrow-dark-theme' #required
    #deletePackage 'symbols-view' # required by asar?

    injectPackage 'language-b-eventb', '0.2.1'
