module ApplicationHelper
  def def_item_for_member(member, field, content=nil)
    content = general_def_content(member, field).html_safe unless content
    content_tag(:dt, I18n.t(field, scope: "activerecord.attributes.refinery/members/member")) + content_tag(:dd, content) if member.send(field).present?
  end

  def general_def_content(member, field)
    raw(member.send(field))
  end

  def email_def_content(member, email)
    email.gsub(/<\/?p>/, "").split(", ").map {|item| mail_to(item, nil, replace_at: "_at_", replace_dot: "_dot_")}.join("<br/>").html_safe
  end
end
