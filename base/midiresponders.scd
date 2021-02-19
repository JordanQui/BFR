~release = 1;
~rootNote = 0;
~density = 25;
~scale = Scale.chromatic(\just);


~makeMidiVoice =
	{
	~voicer = ~voicer ? ();
	~voicer.plant = NPVoicer( Ndef(\plant));

	~voicer.plant.prime(\silence);

	~voicer.noteON = { |q, chan, note, vel|
		~voicer.plant.prime(\plt_clap);

		if(rand(~density/100).coin, {
			~voicer.plant.put(note, [
				\amp, 0.5
				]);
			"noteOn: % % %\n".postf(note);
		});
	};

	~voicer.noteOFF = { |q, chan, vel, note|
		var obj = ~voicer.plant.proxy.objects[note];
		// ("off note : " + note).postln;
		if (obj.notNil) { obj.set(\gate, 0) };
	};

	MIDIdef.noteOn(\plantOn, { |vel, noteNum, chan|
		//scenes
		~voicer.noteON(chan, noteNum, vel);
   	}).enable;

   	MIDIdef.noteOff(\plantOff, { |noteNum, vel, chan|
		var x = case
		{ ~scene != nil } { ~voicer.noteOFF(chan, noteNum, vel); };
   	}).enable;
};







