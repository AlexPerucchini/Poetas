module StaticPagesHelper
  def full_title(title)
    base_title = "Poetas"
    if title.empty?
      base_title 
    else
      "#{base_title} - #{title}"
    end
  end
end
