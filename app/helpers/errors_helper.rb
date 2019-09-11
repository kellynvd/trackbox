# frozen_string_literal: true

# frozen_string_literal: true.

module ErrorsHelper
  def error_tag(model, attribute)
    return if model.errors.keys.exclude?(attribute)

    content_tag(
      :div,
      model.errors[attribute].first,
      class: 'error-message'
    )
  end

  def form_error_tag(model)
    return unless model.errors.any?

    content_tag(
      :div,
      I18n.t(:form_error),
      class: 'error-message'
    )
  end
end
