class BottleVerse
  def self.lyrics(count)
    if count == 6
      "1 six-pack of beer on the wall, 1 six-pack of beer.\n" +
      if (count-1) == 6
        "Take one down and pass it around, 1 six-pack of beer on the wall.\n"
      elsif (count-1) == 1
        "Take one down and pass it around, #{count - 1} bottle of beer on the wall.\n"
      else
        "Take one down and pass it around, #{count - 1} bottles of beer on the wall.\n"
      end
    elsif count == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" +
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif count == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{count} bottles of beer on the wall, #{count} bottles of beer.\n" +
      if (count-1) == 6
        "Take one down and pass it around, 1 six-pack of beer on the wall.\n"
      elsif (count-1) == 1
        "Take one down and pass it around, #{count - 1} bottle of beer on the wall.\n"
      else
        "Take one down and pass it around, #{count - 1} bottles of beer on the wall.\n"
      end
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

