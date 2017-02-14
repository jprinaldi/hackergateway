module BootstrapHelper # :nodoc:
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      recaptcha_error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def bootstrap_alert(msg_type, message, &block)
    content_tag(
      :div,
      message,
      class: "alert #{bootstrap_class_for(msg_type)} "\
             "alert-dismissible fade show",
      &block
    )
  end

  def bootstrap_alert_close_button
    content_tag(
      :button,
      "x",
      type: "button",
      class: "close",
      data: { dismiss: "alert" },
      aria: { label: "Close" }
    )
  end
end
