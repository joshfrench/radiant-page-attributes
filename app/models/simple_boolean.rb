class SimpleBoolean < PageAttribute
  def true_string
    "Yes"
  end
  
  def serialize!
    self.value = self.value == self.true_string
  end
end