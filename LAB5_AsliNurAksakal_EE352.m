d = 0.04;
Fs = 20000;
t = linspace(-d/2,d/2,800);
fm = 500;
fc = 6000;
m = 5*sinc(2*pi*fm*t);
c = cos(2*pi*fc*t);
s = m.*c;
n = 5;
[b,a] = butter(n,fc/(Fs/2),'low')
slsb1 = filter(b,a,s);

figure(1)
plot(abs(freqz(b,a,Fs/2)))
title('Filter Response')

N = 800;
z = hilbert(m);

w = linspace(-Fs/2,Fs/2,N)
slsb2 = 1*m.*cos(2*pi*fc*t)+1*(imag(z)).*sin(2*pi*fc*t);

figure(2)
subplot(311)
plot(w,abs(fftshift(fft(s)))/N)
title('Frequency Response of s(t)')
xlabel('Frequency')
ylabel('Amplitude')

subplot(312)
plot(w,abs(fftshift(fft(slsb1)))/N)
title('Frequency Response of slsb1(t)')
xlabel('Frequency')
ylabel('Amplitude')

subplot(313)
plot(w,abs(fftshift(fft(slsb2)))/N)
title('Frequency Response of slsb2(t)')
xlabel('Frequency')
ylabel('Amplitude')


d_ssb2 = slsb2.*c;

[b2,a2] = butter(25,(fc+fm)/2/(Fs/2),'low')
md = filter(b2,a2,d_ssb2)

figure(3)
subplot(211)
plot(w,abs(fftshift(fft(m)))/N)
title('Frequency Response of m(t)')
xlabel('Frequency')
ylabel('Amplitude')

subplot(212)
plot(w,abs(fftshift(fft(md)))/N)
title('Frequency Response of md(t)')
xlabel('Frequency')
ylabel('Amplitude')




