~release = 1;
~rootNote = 0;
~scale = Scale.chromatic(\just);


~makeMidiVoice =
	{
	~voicer = ~voicer ? ();
	~voicer.roli = NPVoicer( Ndef(\roli));

	~voicer.roli.prime(\plt_sine_vintage);

	~voicer.noteOFF = { |q, chan, vel, note|
		var obj = ~voicer.roli.proxy.objects[note];
		// ("off note : " + note).postln;
		if (obj.notNil) { obj.set(\gate, 0) };
	};

	MIDIdef.noteOn(\roliOn, { |vel, noteNum, chan|
		var x = case
		{ ~scene == 1 } { // chants
		   var x = case
		   { ~plt == 1 } { ~voicer.shortVoicesON(chan, noteNum, vel); }
		   { ~plt == 2 } { ~voicer.shortVoicesON(chan, noteNum, vel); }
		   { ~plt == 3 } { ~voicer.shortVoicesON(chan, noteNum, vel); }
		   { ~plt == 4 } { ~voicer.shortVoicesON(chan, noteNum, vel); }
		   { ~plt == 5 } { ~voicer.shortVoicesON(chan, noteNum, vel); }
		   { ~plt == 6 } { ~voicer.shortVoicesON(chan, noteNum, vel); };
		}
		{ ~scene == 2 } { // poem nardean 1
		   var x = case
		   { ~plt == 1 } { ~voicer.hiHatSeqON(chan, noteNum, vel); }
	   	   { ~plt == 2 } { /* poem */ }
	   	   { ~plt == 3 } { ~voicer.shortVoices2ON(chan, noteNum, vel); }
	   	   { ~plt == 4 } { ~voicer.percussions2ON(chan, noteNum, vel); }
	       { ~plt == 5 } { ~voicer.hiHatSeqON(chan, noteNum, vel); }
		   { ~plt == 6 } { ~voicer.shortVoices2ON(chan, noteNum, vel); };
		}
		{ ~scene == 3 } { // kronik poem
		   var x = case
		   { ~plt == 1 } {
			   ~voicer.kronikBackKickON(chan, noteNum, vel);
		   }
		   { ~plt == 2 } {
			   ~voicer.hiHatSeq2ON(chan, noteNum, vel);
		   }
		   { ~plt == 3 } {
			   ~voicer.kronikBackKickON(chan, noteNum, vel);
		   }
		   { ~plt == 4 } {
			   ~voicer.percussions3ON(chan, noteNum, vel);
		   }
		   { ~plt == 5 } {
			   ~voicer.hiHatSeq2ON(chan, noteNum, vel);
			   ~voicer.clap(chan, noteNum, vel);
		   }
		   { ~plt == 6 } {
			   ~voicer.clap(chan, noteNum, vel);
		   };
		}
		{ ~scene == 5 } { // poem nardean 2
		   var x = case
		   { ~plt == 1 } { ~voicer.frequencyBathON(chan, noteNum, vel); }
		   { ~plt == 2 } { ~voicer.frequencyBathON(chan, noteNum, vel); }
	   	   { ~plt == 3 } { ~voicer.voiceDrumON(chan, noteNum, vel); }
	       { ~plt == 4 } { ~voicer.hiHatSeqON(chan, noteNum, vel);  }
		   { ~plt == 5 } { ~voicer.percussions2ON(chan, noteNum, vel); }
		   { ~plt == 6 } { ~voicer.shortVoices2ON(chan, noteNum, vel); };
		}
		{ ~scene == 6 } { // nap
		   var x = case
		   { ~plt == 1 } { ~voicer.frequencyBathON(chan, noteNum, vel); }
		   { ~plt == 2 } { ~voicer.frequencyBathON(chan, noteNum, vel); }
		   { ~plt == 3 } { ~voicer.frequencyBathON(chan, noteNum, vel); }
		   { ~plt == 4 } { ~voicer.frequencyBathON(chan, noteNum, vel); }
		   { ~plt == 5 } { ~voicer.frequencyBathON(chan, noteNum, vel); }
		   { ~plt == 6 } { ~voicer.frequencyBathON(chan, noteNum, vel); };
		}
		{ ~scene == 7 } { // nap
		   var x = case
		   { ~plt == 1 } { ~voicer.frequencyBath2ON(chan, noteNum, vel); }
		   { ~plt == 2 } { ~voicer.frequencyBath2ON(chan, noteNum, vel); }
		   { ~plt == 3 } { ~voicer.frequencyBath2ON(chan, noteNum, vel); }
		   { ~plt == 4 } { ~voicer.frequencyBath2ON(chan, noteNum, vel); }
		   { ~plt == 5 } { ~voicer.frequencyBath2ON(chan, noteNum, vel); }
		   { ~plt == 6 } { ~voicer.frequencyBath2ON(chan, noteNum, vel); };
		}
		{ ~scene == 8 } { // nap
		   var x = case
		   { ~plt == 1 } { ~voicer.frequencyBath3ON(chan, noteNum, vel); }
		   { ~plt == 2 } { ~voicer.frequencyBath3ON(chan, noteNum, vel); }
		   { ~plt == 3 } { ~voicer.frequencyBath3ON(chan, noteNum, vel); }
		   { ~plt == 4 } { ~voicer.frequencyBath3ON(chan, noteNum, vel); }
		   { ~plt == 5 } { ~voicer.frequencyBath3ON(chan, noteNum, vel); }
		   { ~plt == 6 } { ~voicer.frequencyBath3ON(chan, noteNum, vel); };
		}
		;
   	}).enable;

   	MIDIdef.noteOff(\roliOff, { |noteNum, vel, chan|
		var x = case
		{ ~scene != nil } { ~voicer.noteOFF(chan, noteNum, vel); };
   	}).enable;
};
