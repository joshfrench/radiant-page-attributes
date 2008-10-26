function toggle_add_page_attribute_popup() {
  var popup = $('add-page-attribute-popup');
  center(popup);
  Element.toggle(popup);
  Field.focus($('page-attribute-name-field'));
}

function valid_page_attribute_name() {
  var stNameField = $('page-attribute-name-field');
  var name = stNameField.value.downcase().strip();
  var result = true;
  if (name == '') {
    alert('Name cannot be empty.');
    return false;
  }
  //    alert('Name must be unique.');
  return result;
}

function page_attribute_loading() {
  $('add-page_attribute-button').disabled = true;
  $('page-attribute-busy').appear();
}

function page_attribute_added(response) {
  // var popup = $('add-page-attribute-popup');
  // Element.toggle(popup)
  // var stNameField = $('page-attribute-name-field');
  // var stIndexField = $('page-attribute-index-field');
  // var index = parseInt(stIndexField.value || 0) + 1;
  // var tab = 'tab-' + index;
  // var caption = stNameField.value;
  // var page = 'page-' + index;
//  tabControl.addTab(tab, caption, page);
  console.log($('add-page-attribute-popup'));
  $('page-attribute-name-field').value = "";
  $('add-page-attribute-popup').hide();
  
  // Element.hide('page-attribute-part-popup');
  // Element.hide('page-attribute-busy');
  // stNameField.value = '';
  // stIndexField.value = (index + 1).toString();
  // $('add-page_attribute-button').disabled = false;
  // Field.focus(stNameField);
//  tabControl.select(tab);
}
