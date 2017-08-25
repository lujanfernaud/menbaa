module ApplicationHelper
  def full_title(page_title = "")
    base_title = "Members Only"
    page_title.empty? ? base_title : base_title + " | " + page_title
  end

  def index?(controller_name, action_name)
    controller_name == "posts" && action_name == "index"
  end

  def login?(controller_name)
    controller_name == "sessions"
  end
end
