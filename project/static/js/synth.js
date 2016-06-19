var keydict, midicps, synth;

synth = T("OscGen", {
  wave: "saw",
  mul: 0.25
}).play();

keydict = T("ndict.key");

midicps = T("midicps");

T("keyboard").on("keydown", function(e) {
  var freq, midi;
  midi = keydict.at(e.keyCode);
  if (midi) {
    freq = midicps.at(midi);
    return synth.noteOnWithFreq(freq, 100);
  }
}).on("keyup", function(e) {
  var midi;
  midi = keydict.at(e.keyCode);
  if (midi) {
    return synth.noteOff(midi, 100);
  }
}).start();
