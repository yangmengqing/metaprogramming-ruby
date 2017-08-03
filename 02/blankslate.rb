class BlankSlate
  #instance_methods.each { |m| BlankSlate.hide(m) }
  def self.hide(name)
    if instance_methods.include?(name) and name.to_s !~ /^(__|instance_eval|object_id)/
      @hidden_methods ||= {}
      @hidden_methods[name] = instance_method(name)
      undef_method name
    end
  end
  instance_methods.each { |m| hide m }
end
