class BottleVerse
  def self.lyrics(number)
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " +
      "#{quantity(number)} #{container(number)} of beer.\n" +
      "#{action(number)}, " +
      "#{quantity(successor(number))} #{container(number - 1)} of beer on the wall.\n"
  end

  def self.action(number)
    return "Go to the store and buy some more" if number == 0

    "Take #{pronoun(number)} down and pass it around"
  end

  def self.container(number)
    return 'bottle' if number == 1

    'bottles'
  end

  def self.quantity(number)
    return 'no more' if number == 0

    number.to_s
  end

  def self.successor(number)
    return 99 if number == 0

    number - 1
  end

  def self.pronoun(number)
    return 'it' if number == 1

    'one'
  end
end

class CountdownSong
  attr_reader :verse_template, :max, :min

  def initialize(verse_template:,max: 99, min: 0)
    @verse_template = verse_template
    @max, @min = max, min
  end

  def song
    verses(max,min)
  end

  def verse(max)
    verse_template.lyrics(max)  
  end

  def verses(max,min)
    max.downto(min).map { |count| verse(count) }.join("\n")
  end
end

# when 6
#   "1 six-pack of beer on the wall, 1 six-pack of beer.\n" +
#   "Take one down and pass it around, #{quantity(count-1)} #{container(count - 1)} of beer on the wall.\n"
# when 7
#   "#{count} #{container(count)} of beer on the wall, #{count} #{container(count)} of beer.\n" +
#   "Take one down and pass it around, 1 six-pack of beer on the wall.\n"
