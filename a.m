[xn fs]=wavread('signal_name.wav');
nf=1024; %number of point in DTFT
Y = fft(xn,nf);
f = fs/2*linspace(0,1,nf/2+1);
plot(f,abs(Y(1:nf/2+1)));

f=fs/2*linspace(0,1,44100/2+1);