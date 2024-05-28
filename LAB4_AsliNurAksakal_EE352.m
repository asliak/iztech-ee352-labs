% Bir sinyalin DSB-SC AM'ini, demodulasyona ugramis halini ve de 
bunlarin Fourier transformasyonlarini plot fonksiyonlari ile gosteren kod.

Am = 2;
fm = 50;
Ac = 1;
fc = 1000;
Fs = 10000;
t = 0:1/Fs:0.1;
ka1 = 1;
ka2 = 0.5;
demod = 1*cos(2*pi*fc*t);
m = Am * cos(2*pi*fm*t);
c = Ac * cos(2*pi*fc*t);

s1 =(1 + ka1*m).*c;
s2 = (1 + ka1*(-1)*m).*c;
s = s1-s2;

s12 =(1 + ka2*m).*c;
s22 = (1 + ka2*(-1)*m).*c;
s_2 = s1-s2;

figure(1)
subplot(311)
plot(t,s1)
title('s1 for ka = 1')
xlabel('Time (s)')
ylabel('Amplitude')

subplot(312)
plot(t,s2)
title('s2 for ka = 1')
xlabel('Time (s)')
ylabel('Amplitude')

subplot(313)
plot(t,s)
title('s for ka = 1')
xlabel('Time (s)')
ylabel('Amplitude')



figure(2)
subplot(311)
plot(t,s12)
title('s1 for ka = 0.5')
xlabel('Time (s)')
ylabel('Amplitude')

subplot(312)
plot(t,s22)
title('s2 for ka = 0.5')
xlabel('Time (s)')
ylabel('Amplitude')

subplot(313)
plot(t,s_2)
title('s for ka = 0.5')
xlabel('Time (s)')
ylabel('Amplitude')

n = 20;
u = s_2.*demod;

[b,a] = butter(n,fc/(Fs/2),'low');
uf = filter(b,a,u);

N = 1001;

w = linspace(-Fs/2,Fs/2,N);

mft = abs(fftshift(fft(m)))/N;
s_2ft = abs(fftshift(fft(s_2)))/N;
uft = abs(fftshift(fft(u)))/N;
yft = abs(fftshift(fft(uf)))/N;

figure(3)
subplot(411)
plot(w,mft)
title('|M(f)|')
xlabel('Frequency')
ylabel('Magnitude')

subplot(412)
plot(w,s_2ft)
title('|S(f)|')
xlabel('Frequency')
ylabel('Magnitude')

subplot(413)
plot(w,uft)
title('|U(f)|')
xlabel('Frequency')
ylabel('Magnitude')

subplot(414)
plot(w,yft)
title('|Y(f)|')
xlabel('Frequency')
ylabel('Magnitude')

figure(4)
plot(t,m)
hold on 
plot(t,uf)
legend('m(t)','y(t)')
xlabel('Time')
ylabel('Magnitude')
