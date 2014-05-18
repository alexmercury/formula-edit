
CKEDITOR.editorConfig = (config) ->

  # Define changes to default configuration here. For example:
  # config.language = 'fr';
  # config.uiColor = '#AADC6E';
#  config.extraPlugins += ((if config.extraPlugins.length is 0 then "" else ",")) + "ckeditor_wiris"
  config.baseHref = "/assets/"
#  config.extraPlugins = 'lineutils'
#  config.extraPlugins = 'widget'

  config.extraPlugins = 'mathjax,my_wiris'

#  config.extraPlugins = 'my_wiris'

  config.toolbar_Formula = [
    [
      "Source"
      "-"
      "Bold"
      "Italic"
    ]
    [
      'Undo'
      'Redo'
    ]
    [
      'my_wiris'
    ]
    [
      'Mathjax'
    ]
  ]

  # Load toolbar_Name where Name = Basic.
  config.toolbar = "Formula"

  config.mathJaxClass = 'my-math';

  config.extraAllowedContent = 'wiris';

  return