CKEDITOR.plugins.add 'wiris',

  requires: 'widget,dialog'
  icons: 'wiris'

  init: (editor) ->
    editor.widgets.add 'wiris',

      button: 'Create a wiris math'

      template:
        '<div class="wiris-mathml-formula" style="display:inline-block" data-cke-survive=1></div>'

      allowedContent:
        'div(!wiris-mathml-formula);'

      upcast: (element, data) ->
        data.math_html = element.getHtml();
        return element.name == 'div' && element.hasClass('wiris-mathml-formula')

      downcast: (element) ->
        return

      dialog: 'wiris'

      defaults:
        math_html: '<math xmlns="http://www.w3.org/1998/Math/MathML"></math>'

      init: ->
        return

    editor.on 'paste', (event) ->
      return

    CKEDITOR.dialog.add('wiris', this.path + 'dialogs/wiris.js')