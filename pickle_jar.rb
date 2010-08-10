module PickleJar

  @random = []
  
  def self.add_name(name)
    @random << namecase(name)
    @random.uniq!
    @random
  end
  
  def self.add_names(names)
    if names.kind_of? String
      names = names.split(',')
    elsif !names.kind_of? Array
      raise RuntimeError, "Please use comma delimited string or array with this method."
    end
    @random += names.collect{ |n| namecase(n.strip) }
    @random.uniq!
    @random
  end
  
  def self.remove_name(name)
    @random.delete(namecase(name.to_s))
  end
  
  def self.remove_names(names)
    if names.kind_of? String
      names = names.split(',')
    elsif !names.kind_of? Array
      raise RuntimeError, "Please use comma delimited string or array with this method."
    end
    @random -= names.collect { |n| namecase(n.strip) }
    @random
  end
  
  def self.winner_is
    return "The Pickle Jar is empty..." if @random.length < 1
    mix_it_up
    "THE WINNER IS: (drum roll)...   #{@random.delete_at(0)}"
  end
  
  def self.mix_it_up  # Just for fun...  already random but makes people feel better.
    @random = @random.sort_by{rand}[0..@random.length]
  end

  def self.peek_in_jar
    @random
  end
  
  def self.namecase(name)
    name = name.to_s
    name.strip!
    name.downcase!
    name.gsub(/\b\w/){$&.upcase}
  end

  def self.empty
    @random = []
  end

end
