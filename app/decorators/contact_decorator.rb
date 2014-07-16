class ContactDecorator < Draper::Decorator
  include Draper::LazyHelpers
  delegate_all

  def email
    wrap_with_icon model.email, 'email', 'envelope-square'
  end

  def twitter
    wrap_with_icon model.twitter, 'twitter', 'twitter-square'
  end

  def facebook
    wrap_with_icon model.facebook, 'facebook', 'facebook-square'
  end

  private

  def email_link(property)
    if property.present?
      content_tag :span, property
    else
      content_tag :span, "No email address found"
    end
  end

  def twitter_link(property)
    if property.present?
      content_tag :span, property
    else
      content_tag :span, "No twitter found"
    end
  end

  def facebook_link(property)
    if property.present?
      content_tag :span, property
    else
      content_tag :span, "No Facebook information found"
    end
  end

  def wrap_with_icon(property, title, fa_icon)
    if property.present?
      fa_icon("#{fa_icon} 2x fw") + content_tag(:span, property)
    else
      fa_icon("#{fa_icon} 2x fw") + content_tag(:span, "No #{title} available")
    end
  end

end
