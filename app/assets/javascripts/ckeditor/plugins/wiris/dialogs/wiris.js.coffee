CKEDITOR.dialog.add 'wiris', (editor) ->

  title: 'WIRIS editor'
  minWidth: 800
  minHeight: 350

  contents: [
    id: 'wiris-tab-basic'

    label: 'WIRIS'

    elements: [
      {
        type: 'html'

        html: '<iframe id="wiris_iframe_window" src="/wiris/editor" style="width: 100%; height: 350px;"></iframe>'

        setup: (widget) ->
          # Load data to WIRIS editor

          wiris_editor = document.getElementById('wiris_iframe_window').contentWindow['wiris_editor']
          if wiris_editor != undefined
            wiris_editor.setMathML(widget.data.math_html)

          return

        commit: (widget) ->
          # Save data
          wiris_editor = document.getElementById('wiris_iframe_window').contentWindow['wiris_editor']
          if wiris_editor != undefined
            html_data = wiris_editor.getMathML()
            widget.setData('math_html', html_data)

            iframe = widget.element.getChild(0)

            if iframe.is('iframe')
              console.log 'Iframe'
              console.log iframe.$.contentWindow
              iframe_html_content = '<!DOCTYPE html><html>' +
              '<head><script src="' + CKEDITOR.plugins.wiris.mathjax_js_url + '"></script>' +
              '' +
              '</head>' +
              '<body>' + html_data +
              '</body></html>'

#              console.log iframe.getFrameDocument()
              console.log iframe.$.document

              iframe.$.src = "data:text/html;charset=utf-8," + escape(iframe_html_content)

#              iframe.$.contentDocument.setHtml(iframe_html_content);
#              console.log iframe.$.contentDocument.setHtml(iframe_html_content);


#            widget.element.setHtml(html_data)
          return
      }
    ]
  ]

  onLoad: ->
    return

  onOk: ->
    return