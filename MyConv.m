function Y= MyConv(x, h)
X=fft(x);
H=fft(h);
H(numel(X))=0;
a=X.*H;
Y=ifft(a);

