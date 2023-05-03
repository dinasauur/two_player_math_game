class Question
  def initialize
    @num_one = rand(0...20)
    @num_two = rand(0...20)
  end

  def answer
    @num_one + @num_two
  end

  def generate_question(name)
    puts "#{name}: What does #{@num_one} plus #{@num_two} equal?"
  end
end