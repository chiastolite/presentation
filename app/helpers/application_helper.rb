module ApplicationHelper
  def markdown(text)
    RedcarpetCompat.new(text).to_html.html_safe
  end
end
