[x,Fs] = audioread('audio_signal_0.wav');
[h,Fs1]= audioread('room_impulse.wav');
y1=conv(x,h);
Z=MyConv(x,h);
Z=real(Z);
filename = 'audio0+roomimpulse.wav';

Z = Z/max(abs(Z));
audiowrite(filename,Z,44100);
a=fft(Z);
a=fftshift(a);
figure
Lz = length(Z);
fz = linspace(-Fs/2,Fs/2,Lz);
plot(fz,abs(a));
title('Plot z');
xlabel('Frequency');
ylabel('Magnitude');




filename = 'audio0+roomimpulfunc.wav';
figure
Lz = length(y1);
fz = linspace(-Fs/2,Fs/2,Lz);
a=fft(y1);
a=fftshift(a);

plot(fz,abs(a));
title('Plot y');
xlabel('Frequency');
ylabel('Magnitude');
%with staudium impulse


[x,Fs] = audioread('audio_signal_0.wav');
[h,Fs1]= audioread('stadium_impulse.wav');
y=conv(x,h);
Z=MyConv(x,h);
Z=real(Z);
filename = 'audio0+stadium_impulsee.wav';
Z = Z/max(abs(Z));
audiowrite(filename,Z,44100);

filename = 'audio0+stadium_impulsefunc.wav';
y=y/max(abs(y));
audiowrite(filename,real(y),44100);
