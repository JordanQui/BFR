// init adresses
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
