module PoemsHelper

  def text_analyzer(poem)

    poem = poem.body
    line_count = poem.lines.count 
    text = poem
    character_count = text.length

    return "Line count: #{line_count = poem.lines.count }" + "\n"
           "Character count: #{character_count} /n" + ""
  
  end
end
