class Kill
  attr_reader :kill_count

  def initialize
    @kill_count = 0
  end

  def increment!
    @kill_count += 1
  end

  def count
    @kill_count
  end

  def valid?(line)
    line.include?('kill')
  end
end