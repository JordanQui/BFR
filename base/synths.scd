SynthDef(\plt_migrationVoicer,
	{|out=0, gate=1, freq, buff, amp=1, speed=0.01, rls=5, w=1, pitch=1, pos=0, freqShift=1,windowSize=0.1,overlap=3,windowRand=0.02, trigRate=1|
    var sig, env, trig;
	env = Env.adsr(0,0,1,rls).ar(2,gate);
	sig = Warp1.ar(1,buff,pos,pitch,windowSize,-1,overlap,windowRand,interp:4) * amp.lag(rls);
	sig = sig  * env;
	sig = sig * 0.35;
    Out.ar(out, Pan2.ar(sig!2,0));
	}).store;

SynthDef(\plt_sine_vintage1,
	{|amp=0.2, gate=1, freq=440, pan=0, atk = 0.001, sus = 2, rls=3, mod,
	vrate = 2, vdepth = 0.008, vdelay = 0.1, vonset = 0, vrateVariation = 0.1, vdepthVariation = 0.1, noiseAmp = 0.2|
	var env, sig, vibrato;
	env = Env.adsr(5, 1, 1, rls).kr(2,gate);
	sig = SinOscFB.ar(freq, 0 );
	sig = sig * SinOsc.ar(0.2).range(0.5,1);
	sig = sig * SinOsc.ar(freq/10);
	sig = sig * env;
	sig = sig * (amp/1.8);
	Out.ar(0, Pan2.ar(sig, pan, 1));
	}).store;

SynthDef(\plt_sine_vintage2,
	{|amp=0.2, gate=1, freq=440, pan=0, atk = 0.001, sus = 2, rls=3, mod,
	vrate = 2, vdepth = 0.008, vdelay = 0.1, vonset = 0, vrateVariation = 0.1, vdepthVariation = 0.1, noiseAmp = 0.2|
	var env, sig, vibrato;
	env = Env.adsr(5, 1, 1, rls).kr(2,gate);
	sig = SinOscFB.ar(freq, Rand(0,1) );
	sig = sig * SinOsc.ar(0.2).range(0.5,1);
	sig = sig * SinOsc.ar(freq/10);
	sig = sig * env;
	sig = sig * (amp/1.8);
	Out.ar(0, Pan2.ar(sig, pan, 1));
	}).store;

SynthDef(\plt_sine_vintage3,
	{|amp=0.2, gate=1, freq=440, pan=0, atk = 0.001, sus = 2, rls=3, mod,
	vrate = 2, vdepth = 0.008, vdelay = 0.1, vonset = 0, vrateVariation = 0.1, vdepthVariation = 0.1, noiseAmp = 0.2|
	var env, sig, vibrato;
	env = Env.adsr(5, 1, 1, rls).kr(2,gate);
	sig = SinOscFB.ar(freq, Rand(0.66,1.5) );
	sig = sig * SinOsc.ar(0.2).range(0.5,1);
	sig = sig * SinOsc.ar(freq/10);
	sig = sig * env;
	sig = sig * (amp/1.8);
	Out.ar(0, Pan2.ar(sig, pan, 1));
	}).store;

SynthDef(\plt_poemPlayer,
	{|out=0, buff, amp|
		var sig;
		sig = PlayBuf.ar(1, buff, 1, 1, 0, 0, 2) * amp;
		Out.ar(out,sig!2);
	}).store;

SynthDef(\plt_singPlant,
	{|out=0, buff, amp, dw, dtime=0.1|
		var sig, delay;
		sig = PlayBuf.ar(2, buff, 1, 1, 0, 0, 2) * 0.1;
		Out.ar(out,sig!2);
	}).store;

SynthDef(\plt_youmna,
	{|out=0, buff, amp, dw, dtime=0.1|
		var sig, delay;
		sig = PlayBuf.ar(2, buff, 1, 1, 0, 0, 2) * 0.5;
		Out.ar(out,sig!2*0.5);
	}).store;

SynthDef(\plt_repeat,
	{|out=0, buff, amp, t_trig=1, rls= 10|
		var sig, env;
		env = Env.perc(0, rls).ar(2, t_trig);
		sig = PlayBuf.ar(1, buff, 1, 1, 0, 0, 2) * env;
		sig = sig * amp;
		Out.ar(out,sig!2);
	}).store;

SynthDef(\plt_warpVoice,
	{|out=0, gate=1, freq, buff, amp=1, speed=0.01, rls=5, w=1, pitch=1, freqShift=1,windowSize=0.1,overlap=3,windowRand=0.02, trigRate=1|
    var sig, env, trig, line;
	line = LFSaw.ar(speed.lag(1),1).range(0,1);
	env = Env.adsr(0,1,1,rls).ar(0,gate);
	sig = Warp1.ar(1,buff,line,pitch,windowSize,-1,overlap,windowRand) * amp.lag(rls);
	sig = sig  * env * 0.25;
    Out.ar(out, Pan2.ar(sig!2,0));
	}).store;

SynthDef(\plt_warpVoiceFreeze,
	{|out=0, t_trig=1, freq, buff, amp=1, speed=0.01, rls=5, w=1, pitch=1, pos=0, freqShift=1,windowSize=0.1,overlap=3,windowRand=0.02, trigRate=1|
    var sig, env, trig, line;
	line = LFSaw.ar(speed.lag(1),pos).range(0,1);
	env = Env.perc(rls,rls).ar(2,t_trig);
	sig = Warp1.ar(1,buff,line,pitch,windowSize,-1,overlap,windowRand) * amp.lag(rls);
	sig = sig  * env * 0.25;
    Out.ar(out, Pan2.ar(sig!2,0));
	}).store;

SynthDef(\plt_kick_808,
	{|out = 0, t_trig=1, freqP = 50, freq = 60, amp = 1, rls = 1, dist = 3, distGain = 1, cfreq = 100, pdec= 0.1|
    var snd, env;
	snd = Ringz.ar(
		in: Impulse.ar(0), // single impulse
		freq: XLine.ar(freqP, freq, pdec),
		decaytime: 100);
	env = EnvGen.ar(Env.perc(0.001, rls), t_trig, doneAction: 2);
	snd = (1.0 - dist) * snd + (dist * (snd.distort));
	snd = snd * env;
	snd = snd * amp.lag(0.01);
	Out.ar(0, Pan2.ar(snd, 0));
	}).store;

SynthDef(\plt_kick_808long,
	{|out = 0, gate=1, freqP = 50, freq = 60, amp = 1, rls = 1, dist = 3, distGain = 1, cfreq = 100, pdec= 0.1|
    var snd, env;
	snd = Ringz.ar(
		in: Impulse.ar(0), // single impulse
		freq: XLine.ar(freqP, freq, pdec),
		decaytime: 100);
	env = EnvGen.ar(Env.adsr(0.001, 0, 1, rls), gate, doneAction: 2);
	snd = (1.0 - dist) * snd + (dist * (snd.distort));
	snd = snd * env;
	snd = snd * 0.9;
	Out.ar(0, Pan2.ar(snd, 0));
	}).store;

SynthDef(\plt_kick_dry,
	{var snd;
    snd = DC.ar(0);
    snd = snd + (SinOsc.ar(XLine.ar(1500, 800, 0.01)) * Env.perc(0.0005, 0.01, curve: \lin).ar);
    snd = snd + (BPF.ar(Impulse.ar(0) * SampleRate.ir / 48000, 6100, 1.0) * 3.dbamp);
    snd = snd + (BPF.ar(Hasher.ar(Sweep.ar), 300, 0.9) * Env.perc(0.001, 0.02).ar);
    snd = snd + (SinOsc.ar(XLine.ar(472, 60, 0.045)) * Env.perc(0.0001, 0.1, curve: \lin).delay(0.005).ar(2));
    snd = snd.tanh;
    Out.ar(\out.kr(0), Pan2.ar(snd, \pan.kr(0), \amp.kr(0.1)));
	}).add;

SynthDef(\plt_kick_acoustique,
	{ arg out = 0, freq = 50, mod_freq = 5, mod_index = 5, sustain = 0.4, amp = 0.8, beater_noise_level = 0.025;
	var pitch_contour, drum_osc, drum_lpf, drum_env;
	var beater_source, beater_hpf, beater_lpf, lpf_cutoff_contour, beater_env;
	var kick_mix;
	pitch_contour = Line.kr(freq*2, freq, 0.02);
	drum_osc = PMOsc.ar(	pitch_contour,
				mod_freq,
				mod_index/1.3,
				mul: 1,
				add: 0);
	drum_lpf = LPF.ar(in: drum_osc, freq: 1000, mul: 1, add: 0);
	drum_env = drum_lpf * EnvGen.ar(Env.perc(0.005, sustain), 1.0, doneAction: 2);
	beater_source = WhiteNoise.ar(beater_noise_level);
	beater_hpf = HPF.ar(in: beater_source, freq: 500, mul: 1, add: 0);
	lpf_cutoff_contour = Line.kr(6000, 500, 0.03);
	beater_lpf = LPF.ar(in: beater_hpf, freq: lpf_cutoff_contour, mul: 1, add: 0);
	beater_env = beater_lpf * EnvGen.ar(Env.perc, 1.0, doneAction: 2);
	kick_mix = Mix.new([drum_env, beater_env]) * 2 * amp;
	Out.ar(out, [kick_mix, kick_mix])
	}).add;

SynthDef(\plt_ksample,
	{|out=0, buff, amp|
		var sig;
		sig = PlayBuf.ar(1, buff, 1, 1, 0, 0, 2) * amp;
		Out.ar(out,sig!2);
	}).store;

SynthDef(\plt_hihat,
	{|out = 0, pan = 0, amp = 1, rel=0.1, res=0.2, gain=1, vel, ffreq, dec=0.1, atk=0.001|
    var click, clickAmp;
    var noise, noiseAmp, noiseSource;
    var snd;
    noiseAmp = EnvGen.ar(Env.perc(atk, dec, curve: 9), doneAction: 2);
	noiseSource = ClipNoise.ar;
    noise = Mix( BPF.ar(noiseSource, ffreq.linexp(0,127,1e3,20e3), res)) * gain * noiseAmp;
    snd = noise;
    Out.ar(out, Pan2.ar(snd, pan, amp));
	}).add;

SynthDef(\plt_clap, {
    |out = 0, amp = 0.5, pan = 0, dur = 1|
    var env1, env2, snd, noise1, noise2;

    // noise 1 - 4 short repeats
    env1 = EnvGen.ar(
        Env.new(
            [0, 1, 0, 0.9, 0, 0.7, 0, 0.5, 0],
            [0.001, 0.009, 0, 0.008, 0, 0.01, 0, 0.03],
            [0, -3, 0, -3, 0, -3, 0, -4]
        )
    );

    noise1 = WhiteNoise.ar(env1);
    noise1 = HPF.ar(noise1, 600);
    noise1 = LPF.ar(noise1, XLine.kr(7200, 4000, 0.03));
    noise1 = BPF.ar(noise1, 1620, 3);

    // noise 2 - 1 longer single
    env2 = EnvGen.ar(Env.new([0, 1, 0], [0.02, 0.18], [0, -4]), doneAction:2);

    noise2 = WhiteNoise.ar(env2);
    noise2 = HPF.ar(noise2, 1000);
    noise2 = LPF.ar(noise2, 7600);
    noise2 = BPF.ar(noise2, 1230, 0.7, 0.7);

    snd = noise1 + noise2;
    snd = snd * 2;
    snd = snd.softclip;

    Out.ar(out, Pan2.ar(snd,pan,amp));
	}).add;

"synths loaded ------------------------------------------------".postln;
