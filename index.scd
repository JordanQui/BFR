// MIMOSA BOUROUISSA PARIS AOUT 2020                 _______ v2
// -+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-
// -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+-+-+-+-+-+-+-+-+

// Quarks.install("JITLibExtensions");

~plt = 1;
~density = 25;

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
	PathName(~root ++ "base/lib.scd").fullPath.load;s.sync;
	PathName(~root ++ "base/planteDetector.scd").fullPath.load;s.sync;
	PathName(~root ++ "base/synths.scd").fullPath.load;s.sync;
	PathName(~root ++ "base/adresses.scd").fullPath.load;s.sync;
	PathName(~root ++ "base/midiscenes.scd").fullPath.load;s.sync;
	PathName(~root ++ "base/oscresponders.scd").fullPath.load;s.sync;
	PathName(~root ++ "base/remoteStarter.scd").fullPath.load;s.sync;

	// // midi ignition
	~makeMidiVoice.value;
	s.sync;
	~voicer.roli.play;
	//
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

	//
	// // welcome sound
	Pdef(\x, Pbind(\dur, 0.1, \note, Pseq([-12,12], 1))).play;s.sync;
	//
	// // play conductor
	// PathName(~root ++ "conductor.scd").fullPath.load;s.sync;
	// ~time.sched(0, ~conductor);
	// ~conductor.play;

	// tests
	// PathName(~root ++ "test.scd").fullPath.load;s.sync;

	~lib[\samplesYoumna].postln;

	("LISTENING ON PORT : " + thisProcess.openPorts).postln;
	s.prepareForRecord("/home/pi/record.aif", 1);
	};

s.waitForBoot({ ~soloLoad.play(AppClock) });
