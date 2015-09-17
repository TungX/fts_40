$(document).on "ready page:load", ->
  time_element = document.getElementById("time-down")
  time_limit = time_element.getAttribute("data-time-limit")
  time_start = time_element.getAttribute("data-time-start")
  time_now = time_element.getAttribute("data-time-now")
  time = time_limit * 60 - (time_now - time_start)

  setInterval (->
    time_element.style.border= "2px solid red";
    if (time > 0)
      c = time--
      h = c / 3600 >> 0
      hour = (if h.toString().length > 1 then "" else "0") + h
      m = (c - h * 3600) / 60 >> 0
      min = (if m.toString().length > 1 then "" else "0") + m
      s = c - (m * 60 + h * 3600) + ""
      sec = (if s.toString().length > 1 then "" else "0") + s
      time_element.textContent = hour + ":" + min + ":" + sec
    else
      time_element.textContent = "00:00:00"
      btn = document.getElementById("finish")
      btn.click()
  ), 1000
