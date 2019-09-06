# frozen_string_literal: true

module ErrorsHelper
  def error_tag(model, attribute)
    return if model.errors.keys.exclude?(attribute)

    content_tag(
      :div,
      model.errors[attribute].first,
      class: 'error-message'
    )
  end
end
