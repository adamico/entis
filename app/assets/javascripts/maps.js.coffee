$ = jQuery

$ ->
  europe = Raphael("canvas_europe", 250, 250)
  middle_east = Raphael("canvas_middle_east", 125, 105)
  south_america = Raphael("canvas_south_america", 125, 145)
  japan = Raphael("canvas_japan", 125, 125)

  europe.rect(0, 0, 250, 250).attr({fill: "white"})
  middle_east.rect(0, 0, 125, 105).attr({fill: "white"})
  south_america.rect(0, 0, 125, 145).attr({fill: "white"})
  japan.rect(0,0, 125, 125).attr({fill: "white"})

  default_attr =
    stroke: "#aabbdd"
    transform: "s0.04,0.04,-130,-80"
    fill: "#7289C3"

  default_cities_attr =
    stroke: "black"
    transform: "s0.04,0.04,-130,-80"
    fill: "black"

  japan.rect(0,0,125,125).attr({"stroke-width": 2})
  japan.text(25, 15, "Japan").attr({"font-size": 12})

  japan_path = {}
  for path in japan_paths
    japan_path[name] = japan.path(path.path).attr
      stroke: "#aabbdd"
      fill: "#7289C3"
      transform: "m0.12,0,0,0.12,0,5"

  for city in japan_cities
    city_name = city.name
    href = "/centers/japan/#{city_name.urlify()}"
    label = japan.popup(city.x*0.12,city.y*0.12,city_name).hide()
    dot = japan.circle(city.x,city.y,10).attr(default_cities_attr).attr
      transform: "m0.12,0,0,0.12,0,5"
      fill: "black"
      stroke: "black"
      cursor: "pointer"
      href: href
    do (label, dot, city) ->
      dot[0].onmouseover = ->
          label.toFront().show()
      dot[0].onmouseout = ->
          label.hide()

  south_america.rect(0, 0, 125, 145).attr({"stroke-width": "2"})
  south_america.text(95, 120, "South\nAmerica").attr({"font-size": 12, fill: "black"})

  south_america_path = {}
  for name, state of south_america_states
    transform = if state.transform then state.transform else "s0.22,0.22,89,29t-280,-80"
    south_america_path[name] = south_america.path(state.path).attr
      stroke: "#aabbdd"
      fill: "#7289C3"
      transform: transform
    color = if state.color then state.color else "black"
    if state.cities
      for city in state.cities
        city_name = city.name
        href = "/centers/#{state.name.urlify()}/#{city_name.urlify()}"
        label = south_america.popup(city.x*0.22+8,city.y*0.22,city_name).hide()
        dot = south_america.circle(city.x,city.y,10).attr(default_cities_attr).attr(transform: "s0.22,0.22,89,29t-280,-80", fill: color, stroke: color).attr
          cursor: "pointer"
          href: href
        do (label, dot, city) ->
          dot[0].onmouseover = ->
              label.toFront().show()
          dot[0].onmouseout = ->
              label.hide()

  middle_east_path = {}
  for name, state of middle_east_states
    transform = if state.transform then state.transform else "s0.4,0.4,-1000,-110"
    middle_east_path[name] = middle_east.path(state.path).attr
      stroke: "#aabbdd"
      fill: "#7289C3"
      transform: transform
    color = if state.color then state.color else "black"
    if state.cities
      for city in state.cities
        city_name = city.name
        href = "/centers/#{state.name.urlify()}/#{city_name.urlify()}"
        label = middle_east.popup(city.x*0.04-15,city.y*0.04+56,city_name).hide()
        dot = middle_east.circle(city.x,city.y,5).attr(default_cities_attr).attr(transform: "s0.4,0.4,-1000,-110", fill: color, stroke: color).attr
          cursor: "pointer"
          href: href
        do (label, dot, city) ->
          dot[0].onmouseover = ->
              label.toFront().show()
          dot[0].onmouseout = ->
              label.hide()

  middle_east.rect(0, 0, 125, 105).attr({"stroke-width": "2"})
  middle_east.text(105, 20, "Middle\nEast").attr({"font-size": 12, fill: "white"})

  europe_path = {}
  for name, state of europe_states
    europe_path[name] = europe.path(state.path).attr(default_attr)
    europe_path[name].attr(transform: "...m1.43317,0,0,1.43317,-2435.49,-1086.58") if name is "ru"
    color = if state.color then state.color else "black"
    if state.cities
      for city in state.cities
        if city.name is "Paris"
          city_name = "Paris-CRAT\nParis-HSVP"
          href = "#"
          modal = getModal()
        else
          city_name = city.name
          href = "/centers/#{state.name.urlify()}/#{city_name.urlify()}"
        label = europe.popup((city.x+55)*0.04-127,city.y*0.04-80,city_name).hide()
        dot = europe.circle(city.x,city.y,40).attr(default_cities_attr).attr(fill: color, stroke: color).attr
          cursor: "pointer"
          href: href
        do (label, dot, city) ->
          dot[0].onmouseover = ->
              label.toFront().show()
          dot[0].onmouseout = ->
              label.hide()
          if city.name is "Paris"
            dot[0].onclick = ->
              modal.modal('show')

  europe.rect(0, 0, 250, 260).attr({"stroke-width": "2"})
  europe.text(25, 15, "Europe").attr({"font-size": 12})

String::urlify = ->
  this.replace(/'/g, "").replace(/\s/g, "-").toLowerCase()


getModal = ->
  modal = $("""
            <div id="paris_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                <h3 class="myModalLabel">Paris TISs</h3>
              </div>
              <div class="modal-body">
                Please choose one of the following TIS in Paris :
                <br />
                <a href="/centers/france/paris-crat" class="btn">Paris-CRAT</a>
                <a href="/centers/france/paris-hsvp" class="btn">Paris-HSVP</a>
              </div>
              <div class="modal-footer">
                <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
              </div>
            </div>
            """)
    .modal
      keyboard: true
      backdrop: true
      show: false
    .on 'hidden', ->
      modal.remove()
      modal = null
  return modal
