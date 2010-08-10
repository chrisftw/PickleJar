class SimpleTest

  @tests = 0
  @fails = 0
  
  def self.testing(desc)
    puts ""
    print desc
  end
  
  def self.test(&blk)
    value = blk.call()
    @tests += 1
    if value
      puts "."
    else
      @fails += 1
      puts "#{blk.to_s} FAILED."
    end
  end
  
  def self.assert_equal(front, back)
    @tests += 1
    if front == back
      print "."
    else
      @fails += 1
      puts "TEST FAILED. (#{front.inspect}) != (#{back.inspect})"
    end
  end
  
  def self.assert_not_equal(front, back)
    @tests += 1
    if front != back
      print "."
    else
      @fails += 1
      puts "TEST FAILED. (#{front.inspect}) == (#{back.inspect})"
    end
  end
  
  class << self
    alias_method :e, :assert_equal
    alias_method :equal, :assert_equal
    alias_method :ne, :assert_not_equal
    alias_method :not_equal, :assert_not_equal
  end
  
  def self.summary
    puts ""
    if @fails == 0
      puts "All #{@test} passed."
    else
      puts "#{(@tests - @fails)}/#{@tests} test passed."
    end
    return nil
  end
end
