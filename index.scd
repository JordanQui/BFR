// MIMOSA BOUROUISSA PARIS AOUT 2020                 _______ v2
// -+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-
// -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+

// Quarks.install("JITLibExtensions");


~root = PathName.new(thisProcess.nowExecutingPath).pathOnly;
~rootNote = 0;
~scale = Scale.melodicMajor(\et12);

~soloLoad = Routine {
	// init midi inputs
	MIDIClient.init;
	s.sync;
	MIDIIn.connectAll;
	s.sync;
	// init master tempo clock
	~time = TempoClock.new;
	~time.tempo_(1);

	// load dependencies
	PathName(~root ++ "base/synths.scd").fullPath.load;s.sync;

	PathName(~root ++ "base/init.scd").fullPath.load;s.sync;
	PathName(~root ++ "base/midiresponders.scd").fullPath.load;s.sync;
	

	// // midi ignition
	~makeMidiVoice.value;
	s.sync;
	~voicer.plant.play(out:~bus, group:~sources);

	// // load modules
	// PathName(~root ++ "modules/poemPlayer.scd").fullPath.load;s.sync;
	// PathName(~root ++ "modules/percussions.scd").fullPath.load;s.sync;
	// PathName(~root ++ "modules/shortvoices.scd").fullPath.load;s.sync;
	// PathName(~root ++ "modules/frequencybath.scd").fullPath.load;s.sync;
	// PathName(~root ++ "modules/poemFreezer.scd").fullPath.load;s.sync;
	// PathName(~root ++ "modules/hiHatSeq.scd").fullPath.load;s.sync;
	// PathName(~root ++ "modules/voiceDrum.scd").fullPath.load;s.sync;
	// PathName(~root ++ "modules/kronikBack.scd").fullPath.load;s.sync;
	// PathName(~root ++ "modules/clap.scd").fullPath.load;s.sync;


	// // welcome sound
	Pdef(\x, Pbind(\out, ~bus, \dur, 0.03, \degree, Pseq([[0,3,5,7,9]], 1))).play;s.sync;
	
	// // play conductor
	PathName(~root ++ "conductor.scd").fullPath.load;s.sync;
	~time.sched(0, ~conductor);
	// ~conductor.play;

	// tests
	// PathName(~root ++ "test.scd").fullPath.load;s.sync;

	~lib[\samplesYoumna].postln;

	("LISTENING ON PORT : " + thisProcess.openPorts).postln;
	// s.prepareForRecord("/home/pi/record.aif", 1);
	s.queryAllNodes;
};

s.waitForBoot({ ~soloLoad.play(AppClock) });



