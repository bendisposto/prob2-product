path = require 'path'
fs = require 'fs-extra'
workDir = null

module.exports = (grunt) ->
  {injectPackage, deletePackage, injectDependency,listPackages} = require('./task-helpers')(grunt)

  grunt.registerTask 'inject-packages', 'Inject packages into packages.json and node_modules dir', ->
    workDir = grunt.config.get 'workDir'

    deletePackage 'git-diff'
    deletePackage 'markdown-preview'
    deletePackage 'spell-check'
    deletePackage 'timecop'
    deletePackage 'autosave'
    deletePackage 'background-tips'
    deletePackage 'bookmarks'
    deletePackage 'dev-live-reload'
    deletePackage 'incompatible-packages'
    deletePackage 'styleguide'
    deletePackage 'update-package-dependencies'
    deletePackage 'release-notes'
    deletePackage 'welcome'
    deletePackage 'deprecation-cop'

# Nope!
    deletePackage 'whitespace'
    deletePackage 'wrap-guide'
    deletePackage 'metrics'
    deletePackage 'package-generator'
    deletePackage 'exception-reporting'
    deletePackage 'autoflow'
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
    deletePackage 'open-on-github'
    deletePackage 'atom-light-syntax'
    deletePackage 'atom-light-ui'
    deletePackage 'base16-tomorrow-light-theme'
    deletePackage 'one-dark-ui'
    deletePackage 'one-dark-syntax'
    deletePackage 'one-light-syntax'
    deletePackage 'one-light-ui'
    deletePackage 'solarized-dark-syntax'
    deletePackage 'solarized-light-syntax'

# Selected standard modules

    #deletePackage 'status-bar'
    #deletePackage 'tree-view'
    #deletePackage 'settings-view'
    #deletePackage 'encoding-selector'
    #deletePackage 'go-to-line'
    #deletePackage 'bracket-matcher'
    #deletePackage 'grammar-selector'
    #deletePackage 'find-and-replace'
    #deletePackage 'fuzzy-finder'
    #deletePackage 'archive-view'

    #deletePackage 'autocomplete-plus'
    #deletePackage 'autocomplete-snippets'
    #deletePackage 'snippets'
    #deletePackage 'tabs'
    #deletePackage 'command-palette'
    #deletePackage 'image-view'
    #deletePackage 'language-clojure'
    #deletePackage 'link'
    #deletePackage 'keybinding-resolver'

    #deletePackage 'notifications'




# Community modules
    injectPackage 'language-b-eventb', '0.2.1'
    injectPackage 'language-groovy', '0.4.0'
  #  injectPackage 'pdf-view', '0.22.0'




# Required for building
    #deletePackage 'atom-dark-syntax' #required
    #deletePackage 'atom-dark-ui' #required
    #deletePackage 'base16-tomorrow-dark-theme' #required
    #deletePackage 'symbols-view' # required by asar?
