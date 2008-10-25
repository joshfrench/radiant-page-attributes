function toggle_add_structure_popup() {
  var popup = $('add-structure-popup');
  center(popup);
  Element.toggle(popup);
  Field.focus($('structure-name-field'));
}

function valid_structure_name() {
  var stNameField = $('structure-name-field');
  var name = stNameField.value.downcase().strip();
  var result = true;
  if (name == '') {
    alert('Name cannot be empty.');
    return false;
  }
  //    alert('Name must be unique.');
  return result;
}

function structure_loading() {
  $('add-structure-button').disabled = true;
  $('structure-busy').appear();
}

function structure_added() {
  var stNameField = $('structure-name-field');
  var stIndexField = $('structure-index-field');
  var index = parseInt(stIndexField.value || 0) + 1;
  var tab = 'tab-' + index;
  var caption = stNameField.value;
  var page = 'page-' + index;
//  tabControl.addTab(tab, caption, page);
  Element.hide('structure-part-popup');
  Element.hide('structure-busy');
  stNameField.value = '';
  stIndexField.value = (index + 1).toString();
  $('add-structure-button').disabled = false;
  Field.focus(stNameField);
//  tabControl.select(tab);
}
