[x,fs]= audioread('audio_signal_0.wav');
sound(x);
info = audioinfo('audio_signal_0.wav');
y= resample(x,1,2);

z= downsample(x,2);

X=fft(x);
Y=fft(y);
Z=fft(z);

L=length(X);
Lb=(0:2:L-1);



a= abs(fftshift(Y));
figure
Ly = length(y);
fy = linspace(-Fs/2,Fs/2,Lz);
plot(fy,a);
title('Plot Y');
xlabel('Frequency ');
ylabel('Magnitude');
% title('Plot Y');
% xlabel('Frequency (Hz)');
% ylabel('Magnitude');

b= abs(fftshift(fft(z)));
figure
Lz = length(z);
fz = linspace(-Fs/2,Fs/2,Lz);
plot(fz,b);
title('Plot z');
xlabel('Frequency');
ylabel('Magnitude');

figure;
A=b-a;
plot(fz,abs(A));
 



%plot(y,'color','b');hold on; %reduces the number of samples by half
% plot(z,'color','r');hold on; %resamples the input sequence, x, at p/q times
                             %the original sample rate.
% plot(abs(A),'color','r');hold on;
% plot(abs(B),'color','b');hold on;
% plot(abs(C),'color','g');hold on;
%sound(y,22050); y with sampling frequency
%sound(x,44100); x with sampling frequnecy
%sound(z,22050);z with sampling frequency
%plot(abs(y));
% plot(abs(z));   
