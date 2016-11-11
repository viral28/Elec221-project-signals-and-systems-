[x,fs]= audioread('audio_signal_0.wav');
fc=250;
C=tan(pi*fc/fs);
G1=sqrt(10);
R=0.0001;
b0=(1+sqrt(G1)*R*C+G1*(C)^2)/(1+R*C+C^2);
b1=(2*(G1*C^2-1))/(1+R*C+C^2);
b2=(1-sqrt(G1)*R*C+G1*(C)^2)/(1+R*C+C^2);
a0=1;
a1=(2*(C^2-1))/(1+R*C+C^2);
a2=(1-R*C+C^2)/(1+R*C+C^2);

bbase=[b2 b1 b0];
abase=[a2 a1 a0];
x1 =filter(bbase, abase, x);
figure;
freqz(bbase,abase,441000);
x1=x1/max(abs(x1));
audiowrite('audio0+baseboost.wav',x1,44100);

%trable boost

b0=(G1+sqrt(G1)*R*C+(C)^2)/(1+R*C+C^2);
b1=(2*(C^2-G1))/(1+R*C+C^2);
b2=(G1-sqrt(G1)*R*C+(C)^2)/(1+R*C+C^2);
a0=1;
a1=(2*(C^2-1))/(1+R*C+C^2);
a2=(1-R*C+C^2)/(1+R*C+C^2);

btreble=[b2 b1 b0];
atrable=[a2 a1 a0];
y=filter(btreble, atrable, x);
figure;
freqz(btreble,atrable,44100);
y=y/max(abs(y));
audiowrite('audio0+trebleboost.wav',y,44100);

%feeding output of base to boost
y=filter(btreble, atrable, x1);

%cascading two filters
a=conv(abase,atrable);
b=conv(bbase,btreble);
y=filter(b, a, x);
figure;
freqz(b,a,44100);

