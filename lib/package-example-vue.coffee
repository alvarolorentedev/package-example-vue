PackageTemplateVueView = require './package-example-vue-view'
{CompositeDisposable} = require 'atom'

Model =require './package-example-vue-model'
View = require './package-example-vue-view'
ViewModel = require './package-example-vue-view-model'

module.exports = PackageTemplateVue =
  packageTemplateVueView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    model = new Model
    view = new View
    viewModel = new ViewModel(view.getElement(), model)
    @modalPanel = atom.workspace.addModalPanel(item:viewModel.view, visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'package-example-vue:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @packageTemplateVueView.destroy()

  serialize: ->
    packageTemplateVueViewState: @packageTemplateVueView.serialize()

  toggle: ->
    console.log 'PackageExampleVue was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
