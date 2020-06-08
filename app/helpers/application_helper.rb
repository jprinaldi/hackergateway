# frozen_string_literal: true

module ApplicationHelper # :nodoc:
  # Create nav items in Bootstrap 4 style
  def nav_item(url, &block)
    active = "active" if current_page?(url)
    tag.li class: "nav-item #{active}" do
      link_to(url, { class: "nav-link" }, &block)
    end
  end

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(bootstrap_alert(msg_type, message) do
        concat bootstrap_alert_close_button
        concat message
      end)
    end
    nil
  end
end
