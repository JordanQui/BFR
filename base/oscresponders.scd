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






// FROM TOUCHOSC


OSCdef(\muter, {|x|
	if(x[1].value == 1,
	{"--------------".postln;
		~ipBundle.do({|item| item.sendBundle(nil, ['/unmutePlante', nil]); });
	},{
		"--------------".postln;
		~ipBundle.do({|item| item.sendBundle(nil, ['/mutePlante', nil]); });
	}); }, '/1/mute');
OSCdef(\volume,
	{|x|
	 ~ipBundle.do({|item| item.sendBundle(nil, ['/setVolumeALL', x[1].value ]); });
	 }, '/1/gain');





// ON ALL PLANTES


OSCdef(\unmute, {|x|
	"===== unmute osc".postln;
	~remoteStarter.lunchInstall;
	~remoteStarter.unmuteInstall;
}, '/unmutePlante');

OSCdef(\mute, {|x|
	"===== mute osc".postln;
	~remoteStarter.muteInstall;
}, '/mutePlante');

OSCdef(\setVolumeALL, {|x|
	("-------- volume" + x[1].value).postln;
	s.volume = x[1].value.squared.ampdb;
	     },'/setVolumeALL');

~remoteStarter = ~remoteStarter ? ();
~remoteStarter.lunchInstall = {
	"lunch install".postln;
	~conductor.play;
};
~remoteStarter.muteInstall = {
	"mute function".postln;
	s.mute;
};
~remoteStarter.unmuteInstall = {
	"unmute function".postln;
	s.unmute;
};


"================== osc responders".postln;
