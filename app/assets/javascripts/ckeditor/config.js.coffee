
CKEDITOR.editorConfig = (config) ->

  # Define changes to default configuration here. For example:
  # config.language = 'fr';
  # config.uiColor = '#AADC6E';
  config.extraPlugins += ((if config.extraPlugins.length is 0 then "" else ",")) + "ckeditor_wiris"
  config.baseHref = "/assets/"

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
      'ckeditor_wiris_formulaEditor'
    ]
  ]

  # Load toolbar_Name where Name = Basic.
  config.toolbar = "Formula"

  return