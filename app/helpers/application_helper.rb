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
end
