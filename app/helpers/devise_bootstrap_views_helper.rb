module DeviseBootstrapViewsHelper
  def bootstrap_devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t(
      "errors.messages.not_saved",
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase
    )

    html = <<-HTML
    <div class="alert alert-danger alert-block" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button>
      <h5>#{sentence}</h5>
      <ul class="mb-0">#{messages}</ul>
    </div>
    HTML

    html.html_safe
  end
end
