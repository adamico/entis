$ = jQuery

$ ->
  europe = Raphael("canvas_europe", 250, 250)

  default_attr =
    stroke: "#aabbdd"
    transform: "s0.04,0.04,-130,-80"
    fill: "#7289C3"

  default_cities_attr =
    stroke: "black"
    transform: "s0.04,0.04,-130,-80"
    fill: "black"

  europe_fill = europe.rect(0, 0, 250, 250).attr({fill: "white"})

  europe_path = {}
  for name, state of europe_states
    europe_path[name] = europe.path(state.path).attr(default_attr)
    europe_path[name].attr(transform: "...m1.43317,0,0,1.43317,-2435.49,-1086.58") if name is "ru"
    color = if state.color then state.color else "black"
    if state.cities
      for city in state.cities
        lbl = europe.popup(city.x*0.04-127,city.y*0.04-80,city.name).hide()
        dot = europe.circle(city.x,city.y,40).attr(default_cities_attr).attr(fill: color, stroke: color).attr
          cursor: "pointer"
        do (lbl, dot) ->
          dot[0].onmouseover = ->
              lbl.toFront().show()
          dot[0].onmouseout = ->
              lbl.hide()

  europe_cadre = europe.rect(0, 0, 250, 260).attr({"stroke-width": "2"})
  europe_label = europe.text(25, 15, "Europe").attr({"font-size": 12})
