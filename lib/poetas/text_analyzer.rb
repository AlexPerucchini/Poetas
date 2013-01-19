class Poetas::TextAnalyzer

  def initialize(poem)
    @poem_text = poem
  end

  def character_count
    @poem_text.length
  end

  def character_count_nospaces
    @poem_text.gsub(/\s+/, '').length
  end

  def lines_count
    @poem_text.lines.count
  end

  def word_count
    @poem_text.split.length
  end

  def sentence_count
    #actual lines minus minus the whitespace lines in-between paragraphs
    @poem_text.split(/\.|\?|\n|!/).length -  @poem_text.split(/\n\n/).length
  end

  def paragraph_count
    @poem_text.split(/\n\n/).length
  end

  def words_per_sentence
    word_count / sentence_count
  end

  def sentences_per_paragraph
    sentence_count / paragraph_count
  end

  def no_fluff_percentage
    stopwords = %w{the i a by on for of are with just but and to the my I has some in}
    all_words = @poem_text.scan(/\w+/)
    good_words = all_words.select{|word| !stopwords.include?(word)}
    ((good_words.length.to_f/all_words.length.to_f) * 100).to_i

  end
end
