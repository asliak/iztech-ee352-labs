% Farkli katsayilara ve farkli frekanslara sahip sinyallerin kendilerinin 
% ve Fourier transformasyonu hallerinin plot fonksiyonu ile gosterimi.

a1 = 1;
a2 = 2;
a3 = 3/8;
f = 300;
Fs = 20000;
Fs1 = 1000;
fi = pi/2;
fi1 = pi/4;
fi2 = (6*pi)/5;
t = 0:1/Fs:0.015
t1 = 0:1/Fs1:0.015

x1 = a1*cos(2*pi*f*t+fi)
x2 = a2*cos(2*pi*f*t+fi)
x3 = a3*cos(2*pi*f*t+fi)

x11 = a1*cos(2*pi*f*t+fi)
x12 = a1*cos(2*pi*f*t+fi1)
x13 = a1*cos(2*pi*f*t+fi2)

x111 = a1*cos(2*pi*f*t+fi)
x112 = a1*cos(2*pi*f*t1+fi)

figure(1)
plot(t,x1)
xlabel('time')
ylabel('signal')
hold on 
plot(t,x2)
hold on
plot(t,x3)
legend('A=1','A=2','A=3/8')

figure(2)
plot(t,x11)
xlabel('time')
ylabel('signal')
hold on 
plot(t,x12)
hold on
plot(t,x13)
legend('fi=pi/2','fi=pi/4','fi=6pi/5')

figure(3)
plot(t,x111)
xlabel('time')
ylabel('signal')
hold on
plot(t1,x112)
legend('Fs=20kHz','Fs=1kHz')

f2 = 500;
t2 = 0:1/Fs:0.01;
x = a2*cos(2*pi*f2*t2);
N = length(x);
w = linspace(-Fs/2,Fs/2,N)
magnitude = abs(fftshift(fft(x)/N))

figure(4)
subplot(121)
plot(w,magnitude)
xlabel('freq')
ylabel('signal')
title('magnitude of x(t)s fft')

subplot(122)
plot(t2,x)
xlabel('time')
ylabel('signal')
title('x(t)')

fh=2000;
h = 1/2*(exp(j*2*pi*fh*t2)+exp(-1*j*2*pi*fh*t2));
y = fft(x).*fft(h)

figure(5)
subplot(121)
plot(w,abs(fftshift(fft(h)/N)))
xlabel('freq')
ylabel('signal')
title('magnitude of h(t)s fft')

subplot(122)
plot(t2,h)
xlabel('time')
ylabel('signal')
title('h(t)')

figure(6)
subplot(121)
plot(w,abs(fftshift(fft(x)/N)))
xlabel('freq')
ylabel('signal')
title('x(t)//input')

subplot(122)
plot(w,abs(fftshift(y)))
xlabel('freq')
ylabel('signal')
title('y(t)s fft//output')
