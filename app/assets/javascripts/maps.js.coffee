$ = jQuery

$ ->
  default_attr =
    stroke: "#aabbdd"
    fill: "#7289C3"

  maps =
    europe:
      canvas_x: 280
      canvas_y: 250
      text_x: 25
      text_y: 15
      areas: europe_states
      city_radius: 50
      transform_scale: 0.04
      transform_delta_x: -120
      transform_delta_y: -80
      transform: "s0.04,0.04,0,0t-3000,-1900"
    middle_east:
      canvas_x: 125
      canvas_y: 105
      text_x: 105
      text_y: 20
      label: "Middle\nEast"
      label_fill: "white"
      areas: middle_east_states
      city_radius: 5
      transform_scale: 0.4
      transform_delta_x: -600
      transform_delta_y: -70
      transform: "s0.4,0.4,-1000,-110"
    south_america:
      canvas_x: 125
      canvas_y: 145
      text_x: 95
      text_y: 120
      label: "South\nAmerica"
      areas: south_america_states
      city_radius: 10
      transform_scale: 0.22
      transform_delta_x: 7
      transform_delta_y: 0
      transform: "s0.22,0.22,89,29t-280,-80"
    japan:
      canvas_x: 125
      canvas_y: 125
      text_x: 25
      text_y: 15
      transform: "m0.12,0,0,0.12,0,5"
      areas: japan_paths
      city_radius: 20

  states_canvases = {}
  for m, map of maps
    states_canvases[m] = 
      canvas: Raphael("canvas_#{m}", map.canvas_x, map.canvas_y)

  for s, state of states_canvases
    state.canvas.rect(0,0,maps[s].canvas_x,maps[s].canvas_y).attr(fill: "white")
    if maps[s].areas
      for name, area of maps[s].areas
        transform = area.transform ? maps[s].transform
        fill = area.fill ? default_attr["fill"]
        state.canvas.path(area.path).attr(default_attr).attr(transform: transform, fill: fill)
        color = if area.color then area.color else "black"
        if area.cities
          for city in area.cities
            unless city.observer?
              city_radius = area.dots_size ? maps[s].city_radius
              transform_scale = maps[s].transform_scale
              transform_delta_x = city.label_delta_x ? maps[s].transform_delta_x
              transform_delta_y = city.label_delta_y ? maps[s].transform_delta_y
              city_name = city.name
              dir = city.label_dir ? "up"
              href = "/centers/#{area.name.urlify()}/#{city_name.urlify()}"
              label = state.canvas.popup(city.x*transform_scale+transform_delta_x,city.y*transform_scale+transform_delta_y,city_name, dir).hide()
              dot = state.canvas.circle(city.x,city.y,city_radius).attr
                transform: transform
                fill: color
                stroke: color
                cursor: "pointer"
                href: href
              do (label, dot, city) ->
                dot[0].onmouseover = ->
                    label.toFront().show()
                dot[0].onmouseout = ->
                    label.hide()
    label = maps[s].label ? s.titleize()
    label_fill = maps[s].label_fill ? "black"
    state.canvas.rect(0,0,maps[s].canvas_x,maps[s].canvas_y).attr("stroke-width": 2)
    state.canvas.text(maps[s].text_x,maps[s].text_y, label).attr("font-size": 12, fill: label_fill)

  japan = states_canvases["japan"].canvas
  for city in japan_cities
    city_name = city.name
    href = "/centers/japan/#{city_name.urlify()}"
    label = japan.popup(city.x*0.12,city.y*0.12,city_name).hide()
    dot = japan.circle(city.x,city.y,20).attr
      transform: "m0.12,0,0,0.12,0,5"
      fill: "blue"
      stroke: "blue"
      cursor: "pointer"
      href: href
    do (label, dot, city) ->
      dot[0].onmouseover = ->
          label.toFront().show()
      dot[0].onmouseout = ->
          label.hide()

String::urlify = ->
  this.replace(/'/g, "").replace(/\s/g, "-").toLowerCase()

String::titleize = ->
 @charAt(0).toUpperCase() + @substr(1)

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
