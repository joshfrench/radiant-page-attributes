class SimpleBoolean < PageAttribute
  def serialize!
    self.value = (self.value.to_i == 1)
  end
end