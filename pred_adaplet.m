function [y,pred,baru] = pred_adaplet(sig,wavs,mu,hari)

% y          = adaptif koefisien yang terbentuk dari initial koefisien
% Pred_Adapt = Harga saham yang dibentuk dengan adaptif filter dari 
%              koef baru + 1 Hari Prediksi
% sig        = Sinyal yang akan di adaplet - ga boleh kosong
% wavs       = Jenis Wavelet yang digunakan - def = 'symwavf(''sym4'')'
% mu         = Nilai mu untuk tapis adaptif - def = 0.6

if (nargin < 4) hari = 1;end
if (nargin < 3) mu = 0.6; end
if (nargin < 2) wavs = 'symwavf(''sym4'')'; end
if (nargin < 1) help svr; end        

koef  = eval(wavs);
M     = length(koef);
N     = length(sig);
x     = [0 sig];
d     = [sig sig(N)];

% NLMS -nya 
Hadapt = adaptfilt.nlms(M,mu,1,1e-6,koef);
[y,e]   = filter(Hadapt,x,d);

% % Tampilkan Data
% figure();
% plot(0:N,[d' y'],'.-')
% hold on
% title('Hasil Pola Adaplet dengan Data Saham')
% legend('asli','Adaplet')

%% Prediksi dengan Adaptif filter

lama = koef;
baru = Hadapt.coefficients;

pred=[x zeros(1,hari)];
pjg = length(x);
for i=1:hari;
    for j=1:length(baru)
        pred(pjg+i) = pred(pjg+i)+pred(pjg+i-j)*baru(j);
    end
end
pred = round(pred);


% % Tampilkan Data
% figure(1);
% plot(0:N,[d' y'],'.-')
% hold on
% title('Hasil Pola Adaplet BNI')
% legend('asli','Adaplet')

% %% Autokorelasi 
% X = xcorr(e,'coeff');
% [maxX idx] = max(X);
% gambar = X(idx:end);
% 
% figure(2);
% plot(0:N,gambar,'.-')
% grid on
% hold on
% title('Autokorelasi NLMS')
% legend('NLMS')