#!/usr/bin/ruby -w

class Animal
  def initialize(name)
    @name = name
  end

  def make_sound_public()
    puts 'I am a public animal.'
  end

  def cough_public()
    puts 'Cough cough!'
    my_cough_protected()
    my_cough_private()
  end

  def talk()
    puts 'I don\'t talk. I am an animal'
    secret_talk()
  end

  protected

  def make_sound_protected()
    puts 'I am a protected animal.'
  end

  def my_cough_protected()
    puts 'Shy *cough*'
  end

  private

  def secret_talk()
    puts 'I am a talking animal'
  end

  def make_sound_private()
    puts 'I am a private animal.'
  end

  def my_cough_private()
    puts '*Small croaking stifled cough*'
  end

end

class Dog < Animal
  def make_sound_public()
    puts 'I bark bark, and I ain\'t afraid to show it.'
  end

  def cough_public()
    puts 'Bark bark cough'
    my_cough_protected()
    my_cough_private()
  end

  private

  def secret_talk()
    puts 'Bow wow, mi amore.'
  end

end

# Testing animal class
puts 'Testing Animal clas ====================================================='
a = Animal.new('Animal X')
puts '=== make_sound_public() ==='
a.make_sound_public() #'I am a public animal.'
#a.make_sound_protected()
#ERROR - in `<main>': protected method `make_sound_protected' called for #<Animal:0x007ff5820ea590 @name="animal"> (NoMethodError)
#a.make_sound_private()
#ERROR - private method `make_sound_private' called for #<Animal:0x007ff1a90f2678 @name="animal"> (NoMethodError)
puts '=== cough_public() ==='
a.cough_public() #All three cough work
puts '=== talk() ==='
a.talk()

# Testing dog class
puts 'Testing Dog clas ========================================================'
d = Dog.new('Wishbone')
puts '=== make_sound_public() ==='
d.make_sound_public() #'I bark bark, and I ain\'t afraid to show it.'
puts '=== cough_public() ==='
d.cough_public() #'Bark bark cough!' & other stuff
puts '=== talk() ==='
d.talk()
