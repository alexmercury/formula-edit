CKEDITOR.dialog.add 'my_wirisDialog', (editor) ->
  title: 'Abbreviation Properties'
  minWidth: 800
  minHeight: 400
  contents: [
    id: 'wiris-tab-basic'
    label: 'WIRIS'
    elements: [
      {
        type: 'html'
        html: '<div id="editorContainer"></div>'
        onLoad: ->
          if window.wiris_editor == undefined
            window.wiris_editor = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en'})
          wiris_editor.insertInto(document.getElementById('editorContainer'))
        setup: (element) ->
          #@setValue element.getText()
          return

        commit: (element) ->
          #element.setText @getValue()
          return
      }
    ]

  ]
  onShow: ->
#    selection = editor.getSelection()
#    element = selection.getStartElement()
#    if (element)
#      element = element.getAscendant('wisix', true);
#
#    if (!element || element.getName() != 'wisix' || element.data('cke-realelement'))
#      element = editor.document.createElement('wisix')
#      this.insertMode = true
#    else
#      this.insertMode = false
#
#    this.element = element
#
#    if (!this.insertMode)
#      this.setupContent(this.element)

  onOk: ->
    dialog = this
    wiris = editor.document.createElement('wiris')
    wiris.setAttribute 'contenteditable', 'false'
    wiris.setAttribute 'class', 'my-math'
    wiris.setHtml(wiris_editor.getMathML())
#    wiris.setText dialog.getValueOf('tab-basic', 'abbr')
#    id = dialog.getValueOf('tab-adv', 'id')
#    wiris.setAttribute 'id', id  if id
    editor.insertElement wiris
    return