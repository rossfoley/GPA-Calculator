module ApplicationHelper
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
  end

  def stylesheet(*args)
    content_for(:head) { stylesheet_link_tag(*args) }
  end

  def javascript(*args)
    content_for(:head) { javascript_include_tag(*args) }
  end
end
