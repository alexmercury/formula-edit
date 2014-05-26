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
              iframe.$.onload = ->
                ibody = iframe.getFrameDocument().getBody()

                ibody.setHtml(html_data)
                iwindow = iframe.getWindow()
                unless iwindow.mathjax_init
                  iwindow.mathjax_init = ->
                    MathJax.Hub.Queue(["Typeset", MathJax.Hub])


                if iwindow.mathjax_init()
                  iframe.setStyles
                    height: '60px' #ibody.$.offsetHeight + "px"
                    overflov: 'hidden'

              iframe.$.src = iframe.$.src

          return
      }
    ]
  ]

  onLoad: ->
    return

  onOk: ->
    return