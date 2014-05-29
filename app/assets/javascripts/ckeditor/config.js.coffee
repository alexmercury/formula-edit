
CKEDITOR.editorConfig = (config) ->

  # Define changes to default configuration here. For example:
  # config.language = 'fr';
  # config.uiColor = '#AADC6E';
#  config.extraPlugins += ((if config.extraPlugins.length is 0 then "" else ",")) + "ckeditor_wiris"
  config.baseHref = "/assets/"

  config.extraPlugins = 'wiris'

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
      'Wiris'
    ]
  ]

  # Load toolbar_Name where Name = Basic.
  config.toolbar = "Formula"

  config.mathJaxClass = 'wiris-mathml-formula';

  config.allowedContent = true;

  return