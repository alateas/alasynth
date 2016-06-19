synth = T("OscGen", {wave:"saw", mul:0.25}).play()

keydict = T("ndict.key")
midicps = T("midicps")

T("keyboard").on("keydown", (e) ->
  midi = keydict.at(e.keyCode)
  if midi
    freq = midicps.at(midi);
    synth.noteOnWithFreq(freq, 100)
).on("keyup", (e) ->
  midi = keydict.at(e.keyCode);
  if midi
    synth.noteOff(midi, 100);
).start();
