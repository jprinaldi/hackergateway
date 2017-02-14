module ApplicationHelper
  # Create nav items in Bootstrap 4 style
  def nav_item(url, &block)
    active = "active" if current_page?(url)
    content_tag :li, class: "nav-item #{active}" do
      link_to(url, { class: "nav-link" }, &block)
    end
  end

  def bootstrap_class_for(flash_type)
    { success: "alert-success", error: "alert-danger", recaptcha_error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible fade show") do
               concat content_tag(:button, "x", type: "button", class: "close", data: { dismiss: "alert" }, aria: { label: "Close" })
               concat message
             end)
    end
    nil
  end
end
