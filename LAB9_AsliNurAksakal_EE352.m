I = imread("pout.tif");
M = im2double(I);
Fs = numel(M);
fc = 20000;
y = reshape(M,1,Fs);
t = 0:(1/Fs):(numel(M)-1)/Fs;
c = cos(2*pi*fc*t);

X_dsbsc = y.*c;

X_dsbsc0 = awgn(X_dsbsc,0,"measured");
X_dsbsc5 = awgn(X_dsbsc,5,"measured");
X_dsbsc10 = awgn(X_dsbsc,10,"measured");
X_dsbsc20 = awgn(X_dsbsc,20,"measured");
X_dsbsc30 = awgn(X_dsbsc,30,"measured");

X_dsbsc0c = X_dsbsc0 .* c;
X_dsbsc5c = X_dsbsc5 .* c;
X_dsbsc10c = X_dsbsc10 .* c;
X_dsbsc20c = X_dsbsc20 .* c;
X_dsbsc30c = X_dsbsc30 .* c;


[b,a] = butter(5,fc/(Fs/2),"low");

X_dsbsc0_lpf = 2.*filter(b,a,X_dsbsc0c);
X_dsbsc5_lpf = 2.*filter(b,a,X_dsbsc5c);
X_dsbsc10_lpf = 2.*filter(b,a,X_dsbsc10c);
X_dsbsc20_lpf = 2.*filter(b,a,X_dsbsc20c);
X_dsbsc30_lpf = 2.*filter(b,a,X_dsbsc30c);


X_dsbsc0_rsp = reshape(X_dsbsc0_lpf,291,240);
X_dsbsc5_rsp = reshape(X_dsbsc5_lpf,291,240);
X_dsbsc10_rsp = reshape(X_dsbsc10_lpf,291,240);
X_dsbsc20_rsp = reshape(X_dsbsc20_lpf,291,240);
X_dsbsc30_rsp = reshape(X_dsbsc30_lpf,291,240);

figure(1)
subplot(231)
imshow(I)
title("original image")
subplot(232)
imshow(X_dsbsc0_rsp);
title("original image with 0 dB white noise")
subplot(233)
imshow(X_dsbsc5_rsp);
title("original image with 5 dB white noise")
subplot(234)
imshow(X_dsbsc10_rsp);
title("original image with 10 dB white noise")
subplot(235)
imshow(X_dsbsc20_rsp);
title("original image with 20 dB white noise")
subplot(236)
imshow(X_dsbsc30_rsp);
title("original image with 30 dB white noise")