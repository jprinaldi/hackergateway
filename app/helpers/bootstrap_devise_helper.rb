# frozen_string_literal: true

module BootstrapDeviseHelper # :nodoc:
  def errors_sentence
    I18n.t(
      "errors.messages.not_saved",
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase
    )
  end

  def errors_messages
    resource.errors.full_messages
  end

  def error_message_list
    tag.ul(class: "mb-0") do
      errors_messages.each do |message|
        concat tag.li(message)
      end
    end
  end

  def bootstrap_devise_alert
    tag.div(class: "alert alert-danger", role: "alert") do
      concat bootstrap_alert_close_button
      concat tag.h5(errors_sentence)
      concat(error_message_list)
    end
  end

  def bootstrap_devise_error_messages!
    return "" if resource.errors.empty?

    bootstrap_devise_alert
  end
end
