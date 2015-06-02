class DummyInput
  attr_accessor :messages
  
  def initialize
    @messages = []
  end
  
  def gets
    @messages.shift
  end
end
