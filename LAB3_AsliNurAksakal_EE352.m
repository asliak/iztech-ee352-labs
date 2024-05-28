# Amplitude Modulation
Fs = 20000;
t = 0:1/Fs:0.05;
fm = 100;
fc =  2000;
km1 = 1;
km2 = 2;
km3 = 1/2;
Ac = 1;
n = 10;
m1 = Ac.*cos(2*pi*fm*t);
m2 = Ac*km2.*cos(2*pi*fm*t);   
m3 = Ac*km3.*cos(2*pi*fm*t);

c = Ac.*cos(2*pi*fc*t);
s1 = Ac.*(1 + km1.*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
s2 = Ac.*(1 + km2.*cos(2*pi*fm*t)).*cos(2*pi*fc*t);
s3 = Ac.*(1 + km3.*cos(2*pi*fm*t)).*cos(2*pi*fc*t);

N = 1001;
w = linspace(-Fs/2,Fs/2,N);

figure(1)
subplot(311)
plot(t,s1)
title('s(t) when km = 1')
xlabel('time')
ylabel('envelope magnitude')

subplot(312)
plot(t,s2)
title('s(t) when km = 2')
xlabel('time')
ylabel('envelope magnitude')

subplot(313)
plot(t,s3)
title('s(t) when km = 1/2')
xlabel('time')
ylabel('envelope magnitude')


figure(2)

subplot(311)
plot(w,abs(fftshift(fft(m1,N)/N)))
title('Magnitude Response of m(t)')
xlabel('frequency')
ylabel('magnitude')

subplot(312)
plot(w,abs(fftshift(fft(c,N)/N)))
title('Magnitude Response of c(t)')
xlabel('frequency')
ylabel('magnitude')

subplot(313)
plot(w,abs(fftshift(fft(s1,N)/N)))
title('Magnitude Response of s(t) for km = 1')
xlabel('frequency')
ylabel('magnitude')

x1 = 2.*s1.*s1;
x2 = 2.*s2.*s2;
x3 = 2.*s3.*s3;

[b1,a1] = butter(n,fc/(Fs/2),'low');
x1f = filter(b1,a1,x1);

[b2,a2] = butter(n,fc/(Fs/2),'low');
x2f = filter(b2,a2,x2);

[b3,a3] = butter(n,fc/(Fs/2),'low');
x3f = filter(b3,a3,x3);

x1d = sqrt(abs(x1f));
x2d = sqrt(abs(x2f));
x3d = sqrt(abs(x3f));

mh1 = x1d-1;
mh2 = x2d-1;
mh3 = x3d-1;

figure(3)
subplot(311)
plot(t,mh1)
hold on
plot(t,m1)
title('Demodulated and original message signal when km = 1')

subplot(312)
plot(t,mh2)
hold on
plot(t,m2)
title('Demodulated and original message signal when km = 2')

subplot(313)
plot(t,mh3)
hold on
plot(t,m3)
title('Demodulated and original message signal when km = 1/2')

