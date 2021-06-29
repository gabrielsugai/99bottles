class BottleVerse
  def self.lyrics(count)
    case count
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 6
      "1 six-pack of beer on the wall, 1 six-pack of beer.\n" +
      "Take one down and pass it around, #{count - 1} bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" +
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 7
      "#{count} bottles of beer on the wall, #{count} bottles of beer.\n" +
      "Take one down and pass it around, 1 six-pack of beer on the wall.\n"
    when 2
      "#{count} bottles of beer on the wall, #{count} bottles of beer.\n" +
      "Take one down and pass it around, #{count - 1} bottle of beer on the wall.\n"
    else
      "#{count} bottles of beer on the wall, #{count} bottles of beer.\n" +
      "Take one down and pass it around, #{count - 1} bottles of beer on the wall.\n"
    end
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

