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

  def bootstrap_devise_alert
    content_tag(:div, class: "alert alert-danger", role: "alert") do
      concat bootstrap_alert_close_button
      concat content_tag(:h5, errors_sentence)
      concat(content_tag(:ul, class: "mb-0") do
        errors_messages.each do |message|
          concat content_tag(:li, message)
        end
      end)
    end
  end

  def bootstrap_devise_error_messages!
    return "" if resource.errors.empty?
    bootstrap_devise_alert
  end
end
