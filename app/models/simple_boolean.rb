class SimpleBoolean < PageAttribute
  def serialize!
    self.value = (self.value.to_i == 1)
    true # must return true, or before_save callback halts 
  end
  
  def boolean_value
    self.value.to_i == 1
  end
end