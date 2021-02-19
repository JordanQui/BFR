// INIT GROUP EFFECTS

~sources = Group.new;
~effects = Group.after(~sources);    
~bus = Bus.audio(s, 2);         
~rvb = Synth(\rvb, [\inBus, ~bus], ~effects);



// PLANT IP DETECTOR


{
	var ip = Pipe.new("hostname -I | awk '{print $1}'" , "r").getLine;

	var x = case
		{ ip.contains("101") } { ~plt = 1 }
		{ ip.contains("102") } { ~plt = 2 }
		{ ip.contains("103") } { ~plt = 3 }
		{ ip.contains("104") } { ~plt = 4 }
		{ ip.contains("105") } { ~plt = 5 }
		{ ip.contains("106") } { ~plt = 6 };
	ip.postln;
	( "============== WE ARE ON PLANT " ++ ~plt ).postln;
}.value;




// INIT UDP ADRESS


~ipPlant1 = NetAddr("192.168.11.101", 57120);
~ipPlant2 = NetAddr("192.168.11.102", 57120);
~ipPlant3 = NetAddr("192.168.11.103", 57120);
~ipPlant4 = NetAddr("192.168.11.104", 57120);
~ipPlant5 = NetAddr("192.168.11.105", 57120);
~ipPlant6 = NetAddr("192.168.11.106", 57120);

~ipBundle = [
	~ipPlant1,
	~ipPlant2,
	~ipPlant3,
	~ipPlant4,
	~ipPlant5,
	~ipPlant6
	];


"================= adress loaded".postln;



// FILL SAMPLE LIBRARY


~lib = ();
~lib.add(\samplesVoices -> PathName(~root ++ "assets/voices").entries.collect({|sf| Buffer.read(s,sf.fullPath);}));
~lib.add(\samplesVoices2 -> PathName(~root ++ "assets/voices2").entries.collect({|sf| Buffer.read(s,sf.fullPath);}));
~lib.add(\poemNardean_1 -> Buffer.read(s,PathName(~root ++ "assets/poems/nardean1.aif").fullPath));
~lib.add(\poemNardean_2 -> Buffer.read(s,PathName(~root ++ "assets/poems/nardean3.aif").fullPath));
~lib.add(\poemKronik -> Buffer.read(s,PathName(~root ++ "assets/poems/kronik.wav").fullPath));
~lib.add(\poemKronik2 -> Buffer.read(s,PathName(~root ++ "assets/poems/backkronick2.wav").fullPath));
~lib.add(\samplesKronik -> PathName(~root ++ "assets/kronikBack3").entries.collect({|sf| Buffer.read(s,sf.fullPath);}));
~lib.add(\samplesYoumna -> PathName(~root ++ "assets/youmna").entries.collect({|sf| Buffer.read(s,sf.fullPath);}));


"================= library loaded".postln;



