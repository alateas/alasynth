plot_y_range = [0, 700]
y_height = plot_y_range[1] - plot_y_range[0]
plot_height = 200
canvas = document.getElementById("plotarea")
ctx = canvas.getContext("2d")
ctx.fillStyle = "#FF0000"
ctx.strokeStyle = "black"
ctx.lineWidth = 1
ctx.beginPath()
ctx.rect(0, 0, 1000, 200)
ctx.stroke()
ctx.save()

direction = 1
freq = 440
freq2 = 440

gen = T("sin", {freq:freq, mul:0.25})

x = 0
interval = T("interval", {interval:1000}, (count) ->
  freq = freq+32*direction
  freq2 = freq+32*direction
 
  if count == 7
    interval.stop()
    direction = -direction
    interval.start()  

  y1 = Math.round((plot_height/y_height)*freq)
  y2 = Math.round((plot_height/y_height)*freq2)

  $("#freq").html("freq1: " + freq + " freq2: "+ freq2 + " x: " + x+1 +" y: " + y2)
  ctx.beginPath()
  ctx.moveTo(x,y1)
  ctx.lineTo(x+1, y2)
  ctx.stroke()
  ctx.save()
  x = x + 1

  freqs = T("param", {value:freq}).expTo(freq2, "1000ms")
  gen.set({freq:freqs})
)

$(document).ready(->
  $("#play-button").click(->
    gen.play()
    interval.start()
    $("#pause-button").show()
    $("#play-button").hide()
  )

  $("#pause-button").click(->
    gen.pause()
    interval.stop()
    $("#pause-button").hide()
    $("#play-button").show()
  )
)
