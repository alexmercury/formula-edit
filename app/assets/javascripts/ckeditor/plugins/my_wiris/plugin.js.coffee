CKEDITOR.plugins.add 'my_wiris',
  icons: 'my_wiris'
  init: (editor) ->
    editor.addCommand('my_wirisDialog', new CKEDITOR.dialogCommand('my_wirisDialog'))

    editor.ui.addButton 'my_wiris',
      label: 'Insert Math Formula'
      command: 'my_wirisDialog'
      toolbar: 'insert'

#    editor.on 'doubleclick', (evt) ->
#      getWIRIS = (el) ->
#        if el.is('wiris')
#          return el
#        else
#          getWIRIS(el.getParent())
#
#      element = getWIRIS(evt.data.element)
#
#      element.dialog = 'my_wirisDialog'
#
#      return
#
#    if editor.contextMenu
#      editor.addMenuGroup "my_wirisGroup"
#      editor.addMenuItem "my_wirisItem",
#        label: "Edit Abbreviation"
#        icon: @path + "icons/my_wiris.png"
#        command: "my_wiris"
#        group: "my_wirisGroup"
#
#      editor.contextMenu.addListener (element) ->
#        abbrItem: CKEDITOR.TRISTATE_OFF  if element.getAscendant("wiris", true)


    CKEDITOR.dialog.add( 'my_wirisDialog', this.path + 'dialogs/my_wiris.js' );