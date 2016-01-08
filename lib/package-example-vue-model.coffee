module.exports =
class PackageTemplateVueModel
    constructor: ->
        @word = ""
        @times = 0

    count: () ->
      text = atom.workspace.getActiveTextEditor().getText()
      regex = new RegExp('\\b' + @word + '\\b', 'gi')
      matches = text.match(regex)
      @times = matches.length
