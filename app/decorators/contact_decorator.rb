class ContactDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def email
    wrap_with_icon model.email, 'envelope-square'
  end

  def twitter
    wrap_with_icon model.twitter,'twitter-square'
  end

  def facebook
    wrap_with_icon model.facebook, 'facebook-square'
  end

  private

  def wrap_with_icon(property, fa_icon)
    if property.present?
      fa_icon("#{fa_icon} 2x fw") + content_tag(:span, property)
    else
      fa_icon("#{fa_icon} 2x fw", class: 'text-danger') + content_tag(:span, "unavailable")
    end
  end

end
