module StaticPagesHelper
  def full_title(title)
    base_title = "Poetas"
    
    if title
      base_title + ' - ' + title
    else
      base_title
    end
  end
end
