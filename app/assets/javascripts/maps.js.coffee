$ = jQuery

$ ->
  europe = Raphael("canvas_europe", 250, 250)

  default_attr =
    stroke: "white"
    transform: "s0.04,0.04,-130,-80"
    fill: "#6666ff"

  europe_fill = europe.rect(0, 0, 250, 250).attr({fill: "white"})

  europe_path = {}
  for name, state of europe_states
    europe_path[name] = europe.path(state.path).attr(default_attr)

  europe_cadre = europe.rect(0, 0, 250, 260).attr({"stroke-width": "2"})
  europe_label = europe.text(25, 15, "Europe").attr({"font-size": 12})

  #for s, state of europe_path
    #state.color = "#6666ff"
    #animate_states(europe, europe_path[state], state)

animate_states = (paper, state, s) ->
  current = null
  s[0].onmouseover = ->
    current && s[current].animate {fill: "#f5f5f5", stroke: "#d5d5d5"}, 300
    s.animate {fill: s.color, stroke: "#d5d5d5"}, 300
    s.toFront()
    paper.safari()
    current = state
  s[0].onmouseout = ->
    s.animate {fill: "#d6d6d6", stroke: "white"}, 300
    s.toFront()
    paper.safari()
