class BottleVerse
  def self.lyrics(count)
    case count
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" +
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "#{count} #{container(count)} of beer on the wall, #{count} #{container(count)} of beer.\n" +
        "Take it down and pass it around, no more #{container(count - 1)} of beer on the wall.\n"
    when 6
      "1 six-pack of beer on the wall, 1 six-pack of beer.\n" +
      "Take one down and pass it around, #{count - 1} #{container(count - 1)} of beer on the wall.\n"
    when 7
      "#{count} #{container(count)} of beer on the wall, #{count} #{container(count)} of beer.\n" +
      "Take one down and pass it around, 1 six-pack of beer on the wall.\n"
    else
      "#{count} #{container(count)} of beer on the wall, #{count} #{container(count)} of beer.\n" +
      "Take one down and pass it around, #{count - 1} #{container(count - 1)} of beer on the wall.\n"
    end
  end

  def self.container(number)
    case number
    when 1 then 'bottle'
    else 'bottles'
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

