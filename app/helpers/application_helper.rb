module ApplicationHelper
  def def_item_for_center(center, field, content=nil)
    content = general_def_content(center, field).html_safe unless content
    content_tag(:dt, I18n.t(field, scope: "activerecord.attributes.refinery/centers/center")) + content_tag(:dd, content) if center.send(field).present?
  end

  def general_def_content(center, field)
    raw(center.send(field))
  end

  def email_def_content(center, email)
    email.gsub(/<\/?p>/, "").split("<br />").map {|item| mail_to(item, nil, replace_at: "_at_", replace_dot: "_dot_")}.join("<br/>").html_safe
  end

  def is_selected?(page)
    path = request.path
    path = path.force_encoding('utf-8') if path.respond_to?(:force_encoding)

    # Ensure we match the path without the locale, if present.
    if ::Refinery.i18n_enabled? and path =~ %r{^/#{::I18n.locale}/}
      path = path.split(%r{^/#{::I18n.locale}}).last
      path = "/" if path.blank?
    end

    # First try to match against a "menu match" value, if available.
    return true if page.try(:menu_match).present? && path =~ Regexp.new(page.menu_match)

    # Find the first url that is a string.
    url = [page.url]
    url << ['', page.url[:path]].compact.flatten.join('/') if page.url.respond_to?(:keys)
    url = url.last.match(%r{^/#{::I18n.locale.to_s}(/.*)}) ? $1 : url.detect{|u| u.is_a?(String)}

    # Now use all possible vectors to try to find a valid match
    [path, URI.decode(path)].include?(url) || path == "/#{page.id}"
  end
end
