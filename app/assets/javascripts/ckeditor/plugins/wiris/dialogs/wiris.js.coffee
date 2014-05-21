CKEDITOR.dialog.add 'wiris', (editor) ->

  title: 'WIRIS editor'
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
          # Create WIRIS editor
          if window.wiris_editor == undefined
            window.wiris_editor = com.wiris.jsEditor.JsEditor.newInstance({'language': 'en'})
          wiris_editor.insertInto(document.getElementById('editorContainer'))

        setup: (widget) ->
          # Load data to WIRIS editor
          window.wiris_editor.setMathML(widget.data.math_html)
          return

        commit: (widget) ->
          # Save data
          html_data = wiris_editor.getMathML()
          widget.setData('math_html', html_data)
          widget.element.setHtml(html_data)
          return
      }
    ]
  ]

  onLoad: ->
    return

  onOk: ->
    return