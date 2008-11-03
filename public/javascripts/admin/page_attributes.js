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
  $('page-attribute-name-field').value = "";
  $('add-page-attribute-popup').hide();
  $('page-attribute-index-field').value = parseInt($('page-attribute-index-field').value) + 1;
}

function page_attribute_removed(id) {
  $(id).remove();
}