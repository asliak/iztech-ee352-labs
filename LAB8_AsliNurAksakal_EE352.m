Fs = 2000;
fc = 100;
t = 0:1/Fs:0.5;
kf1 = 80;
kf2 = 1;
kp = 2*pi;
kp2 = 3*pi;
kp3 = 4*pi;

N = 1001;

m = sawtooth(2*pi*10*t + pi/2 ,0.5)

figure (1)
plot(t,m)
title('Message Signal m(t)')
xlabel('Time (s)')
ylabel('Magnitude')

c = cos(2*pi*fc*t)

sfm = cos((2*pi*fc*t)+((2*pi*kf1)*(cumsum(m)*(1/Fs))));

spm = cos((2*pi*fc*t)+(kp.*m));
spm2 = cos((2*pi*fc*t)+(kp2.*m));
spm3 = cos((2*pi*fc*t)+(kp3.*m));

diff_m = (1/Fs).*[diff(m),0];

spm_fm = cos((2*pi*fc*t)+((2*pi*kf2)*(cumsum(diff_m)*Fs)));

figure(2)
subplot(411)
plot(t,m)
title('Message Signal')
xlabel('Time (s)')  
ylabel('Magnitude')

subplot(412)
plot(t,sfm)
title('Frequency Modulated Signal')
xlabel('Time (s)')
ylabel('Magnitude')

subplot(413)
plot(t,spm)
title('Phase Modulated Signal')
xlabel('Time (s)')
ylabel('Magnitude')

subplot(414)
plot(t,spm_fm)
title('Derivation of Phase Modulation from Frequency Modulation')
xlabel('Time (s)')
ylabel('Magnitude')

figure(3)
subplot(311)
plot(t,spm)
title('Spm(t)')
xlabel('Time(s)')
ylabel('Magnitude')

subplot(312)
plot(t,spm2)
title('Spm2(t)')
xlabel('Time(s)')
ylabel('Magnitude')

subplot(313)
plot(t,spm3)
title('Spm3(t)')
xlabel('Time(s)')
ylabel('Magnitude')

w = linspace(-Fs/2,Fs/2,N)

mft = abs(fftshift(fft(m)))/N;
sfmft = abs(fftshift(fft(sfm)))/N;
spmft = abs(fftshift(fft(spm)))/N;
spm_fmft = abs(fftshift(fft(spm_fm)))/N;

figure(4)
subplot(411)
plot(w,mft)
title('Magnitude of the Frequency Response of the Message Signal')
xlabel('Frequency')
ylabel('Magnitude')

subplot(412)
plot(w,sfmft)
title('Magnitude of the Frequency Response of the Frequency Modulated Signal')
xlabel('Frequency')
ylabel('Magnitude')

subplot(413)
plot(w,spmft)
title('Magnitude of the Frequency Response of the Phase Modulated Signal')
xlabel('Frequency')
ylabel('Magnitude')

subplot(414)
plot(w,spm_fmft)
title('Magnitude of the Frequency Response of the Derivation of Phase Modulation from Frequency Modulation')
xlabel('Frequency')
ylabel('Magnitude')


