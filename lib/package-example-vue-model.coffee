module.exports =
class PackageTemplateVueModel
    constructor: ->
        @word = ""
        @times = 0
        @isFound = false

    count: () ->
      text = atom.workspace.getActiveTextEditor().getText()
      regex = new RegExp('\\b' + @word + '\\b', 'gi')
      matches = text.match(regex)
      if(matches == undefined)
        @isFound = false
      else
        @times = matches.length
        @isFound = true
