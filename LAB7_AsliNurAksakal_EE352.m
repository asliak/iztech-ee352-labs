f1 = 50;
f2 = 15;
Fs = 40000;
d = 0.2;
t = 0:1/Fs:d;
fc1 = 3800;
kf = 200;
ml = cos(2*pi*f1*t);
mr = 2*sin(2*pi*f2*t);
c = cos(2*pi*fc1*t);
N = 8001;
fc2 = 10000;

figure(1)
subplot(121)
plot(t,ml)
title('Left channel message signal')
xlabel('Time')
ylabel('Amplitude')

subplot(122)
plot(t,mr)
title('Right channel message signal')
xlabel('Time')
ylabel('Amplitude')

m = (ml+mr) + ((ml-mr).*c)

figure(2)
plot(t,m)
title('Multiplexed signal by the FM Stereo Multiplexer')
xlabel('Time')
ylabel('Amplitude')

s = cos(2*pi*fc2*t + (2*pi*kf*1/Fs*cumsum(m)));

w = linspace(-Fs/2,Fs/2,N);
s_fft = fft(s,N);

figure(3)
plot(w,abs(fftshift(s_fft))/N)
title('Frequency Response of s(t)')
xlabel('Frequency')
ylabel('Amplitude')

mdemod = fmdemod(s,fc2,Fs,kf);

figure(4)
plot(t,mdemod)
title('Demodulated s(t) (the result is the m(t))')
xlabel('Time')
ylabel('Amplitude')


[bl1,al1] = butter(5,(f1+f2)/20000,"low");
m_l = filter(bl1,al1,m);

[bnb1,anb1] = butter(5,[1900/20000,6900/20000],"stop")
m_narrow1 = filter(bnb1,anb1,m)

[bnb2,anb2] = butter(5,[6900/20000,10000/20000],"stop")
m_narrow2 = filter(bnb2,anb2,m)

figure(5)
subplot(221)
plot(t,m_l)
subplot(222)
plot(t,mr)
subplot(223)
plot(t,m_l)
subplot(224)
plot(t,ml)