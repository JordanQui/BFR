~voicer.clap = { |q, chan, note, vel|
	~voicer.roli.prime(\plt_clap);

	if(rand(~density/100).coin, {
		~voicer.roli.put(note, [
			\amp, 0.5,
			\out, 0
			]);
		"claps noteOn: % % %\n".postf(note);
		});
	};
