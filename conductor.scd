~conductor = Task({
	loop {
		"scene 1 ============= 'Voices'".postln;
		~scene = 1;
		~density = 12;
		(60*3).wait;


		"scene 2 ============= 'Nardian 1'".postln;
		~scene = 2;
		~density = 20;
		5.wait;
		if(~plt == 2, {
			~poemPlayer.nardean1;
		});
		if(~plt == 4, {
			~poemPlayer.nardean1;
		});
		if(~plt == 6, {
			~poemPlayer.nardean1;
		});
		66.wait;


		"scene 3 ============= 'Kronik'".postln;
		if(~plt == 1, {
			~ipBundle.do({|item| item.sendBundle(nil, ['/startKRONIKScene']) });
			~ipBundle.do({|item| item.sendBundle(nil, ['/moveOnPlant', 2]) });
			});
		3.wait;

		~scene = 3;
		~density = 30;
		~poemPlayer.kronikBack;

		if(~plt == 1, {
			~density = 30;
			});
		if(~plt == 6, {
			~density = 30;
			});
		30.wait;
		if(~plt == 3, {
			~ipBundle.do({|item| item.sendBundle(nil, ['/moveOnPlant', 1]) });
		});
		34.wait;
		~density = 70;
		if(~plt == 3, {
			~ipBundle.do({|item| item.sendBundle(nil, ['/moveOnPlant', 3]) });
		});
		62.wait;
		if(~plt == 3, {
			~ipBundle.do({|item| item.sendBundle(nil, ['/moveOnPlant', 4]) });
		});
		56.wait;
		if(~plt == 3, {
			~ipBundle.do({|item| item.sendBundle(nil, ['/moveOnPlant', 5]) });
		});
		64.wait;
		~density = 30;
		if(~plt == 3, {
			~ipBundle.do({|item| item.sendBundle(nil, ['/moveOnPlant', 6]) });
		});
		60.wait;
		if(~plt == 3, {
			~ipBundle.do({|item| item.sendBundle(nil, ['/stopPoem']) });
		});
		5.wait;


		"scene 5 ============= 'Nardian 2'".postln;
		~scene = 5;
		~density = 15;
		if(~plt == 6, {
			~density = 10;
			});
		if(~plt == 1, {
			~density = 40;
			});
		if(~plt == 2, {
			~density = 40;
			});
		if(~plt == 2, {
			~poemPlayer.nardean2;
			});
		if(~plt == 4, {
			~poemPlayer.nardean2;
			});
		if(~plt == 6, {
			~poemPlayer.nardean2;
			});
		70.wait;


		"scene 6 ============= 'Nap'".postln;
		~scene = 6;
		~density = 44;
		(60*2).wait;
		~scene = 7;
		(60*2).wait;
		~scene = 8;
		(60*1).wait;
		~scene = 6;
		(60*2).wait;

		" ============= 'SILENCE'".postln;
		~scene = nil;
		~voicer.roli.releaseAll;
		7.wait;
		}
	});

"========================================= conductor loaded".postln;
