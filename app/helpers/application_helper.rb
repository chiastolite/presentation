module ApplicationHelper
  def markdown(text)
    RedcarpetCompat.new(text).to_html.html_safe
  end
  
  def presentation(text)
    Redcarpet::Markdown.new(HTMLwithAlbino).render(text).html_safe
  end

  
  class HTMLwithAlbino < ::Redcarpet::Render::HTML

    def doc_header
      '<div>'
    end
    def header text, level
      @pos_x ||= 0
      (level < 3 ? "</div><div class='step' data-y='0' data-x='#{@pos_x += 1200}'>" : "") + "<h#{level}>#{text}</h#{level}>"
    end
    def doc_footer
      '</div>'
    end
  end
end
