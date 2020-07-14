module ApplicationHelper
  def title_tag(str)
    content_for :title, h(str)
  end
end
