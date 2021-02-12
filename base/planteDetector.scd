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

// Pipe.new("ifconfig en0 | grep \"inet \" | awk '{print $2}'" , "r").getLine.contains("11");
