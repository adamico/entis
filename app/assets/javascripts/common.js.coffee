$ = jQuery

$ ->
  $("#side_menu").affix
    offset:
      top: 0

  if $.browser.msie and parseInt($.browser.version, 10) <= 8
    $("##{id}").corner('6px') for id in ["main", "secondary", "body_content", "side_menu"]
