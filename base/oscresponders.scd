// TESTERS

OSCdef(\testSound,
	{|x| ("test sound").postln; {SinOsc.ar(440,mul:0.1)}.play;}, 
'/test');

OSCdef(\testCom,
	{|x| ("-------- test com").postln;}, 
'/testCom');

OSCdef(\testControlInterface,
	{|x| ("-------- test com" + x[1].value).postln;}, '/1/fader1');




// SCENES CONTROLLERS

OSCdef(\sceneControl, 
	{|x| ("scene = " + x[1].value;).postln; ~scene = x[1].value; }, 
'/scene');

OSCdef(\densityControl,
	{|x| ("density = " + x[1].value;).postln; ~density = x[1].value; }, 
'/density');





// RECORD CONTROL


OSCdef(\recordStart,
	{|x| ("record on ").postln; s.record;}, 
'/startRecord');

OSCdef(\recordStop,
	{|x| ("record off ").postln; s.stopRecording;}, 
'/stopRecord');











"================== osc responders".postln;
