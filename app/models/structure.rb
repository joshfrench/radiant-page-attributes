class Structure
  def file_name
    name.gsub(" ", '').underscore
  end
  
  def partial_name
    "_#{file_name}"
  end
  
  def definition_path
    
  end
end
