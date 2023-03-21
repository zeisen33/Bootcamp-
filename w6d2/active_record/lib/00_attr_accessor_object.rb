require 'byebug'


class AttrAccessorObject
  def self.my_attr_accessor(*names)
  # send *names to my_attr_reader
  # send *names to my_attr_writer
    # debugger
    self.send(:my_attr_reader, *names)
    self.send(:my_attr_writer, *names)
  end
  
  def self.my_attr_reader(*names)
    names.each do |name|
      define_method(name) do
        self.instance_variable_get("@#{name}")
      end
    end
  end

  def self.my_attr_writer(*names)
    names.each do |name|
      define_method("#{name}=") do |set_value|
        self.instance_variable_set("@#{name}", set_value)
      end
    end
  end
end
