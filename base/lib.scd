// fill samples library
~lib = ();
~lib.add(\samplesVoices -> PathName(~root ++ "assets/voices").entries.collect({|sf| Buffer.read(s,sf.fullPath);}));
~lib.add(\samplesVoices2 -> PathName(~root ++ "assets/voices2").entries.collect({|sf| Buffer.read(s,sf.fullPath);}));
~lib.add(\poemNardean_1 -> Buffer.read(s,PathName(~root ++ "assets/poems/nardean1.aif").fullPath));
~lib.add(\poemNardean_2 -> Buffer.read(s,PathName(~root ++ "assets/poems/nardean3.aif").fullPath));
~lib.add(\poemKronik -> Buffer.read(s,PathName(~root ++ "assets/poems/kronik.wav").fullPath));
~lib.add(\poemKronik2 -> Buffer.read(s,PathName(~root ++ "assets/poems/backkronick2.wav").fullPath));
~lib.add(\samplesKronik -> PathName(~root ++ "assets/kronikBack3").entries.collect({|sf| Buffer.read(s,sf.fullPath);}));
~lib.add(\samplesYoumna -> PathName(~root ++ "assets/youmna").entries.collect({|sf| Buffer.read(s,sf.fullPath);}));
