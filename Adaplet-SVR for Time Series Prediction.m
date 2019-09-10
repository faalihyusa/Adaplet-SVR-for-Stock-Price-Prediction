clc;
clear all;
close all;

load bnibaru
Close = Close(2431:2691);
proses = Close(1:length(Close)-15);
pembanding = Close(length(proses)+1:end);
hari = 10

%% Bagi data , komen yang tidak diinginkan

% data latih 2 tahun
saham =1;
sig = [Close(saham:length(proses))'];

% data latih 1,5 tahun
% saham = round(length(proses) *0.25); 
% sig = [Close(saham:length(proses))'];
% 
% data latih 1 tahun
% saham = round(length(proses) *0.5);
% sig = [Close(saham:length(proses))'];

%% Adaplet-SVR

MA = [2 5 10 15 20];
nMA = length(MA);
for i=1:hari
	clear sma ema y y2 pred sig2
    % Adaplet
    [y,pred] = pred_adaplet(sig,'symwavf(''sym4'')',0.6);
	sig2 = [sig pred(end)];			% sinyal baru, pjg: N+i
	y2 = pred_adaplet(sig2);		% koef dari sinyal baru
    
	% Moving Average
	sma = zeros(nMA,length(sig2));
	ema = zeros(nMA,length(sig2));
    
	for j=1:nMA
		sma(j,:) = tsmovavg(sig2,'s',MA(j));
		ema(j,:) = tsmovavg(sig2,'e',MA(j));
    end
    
	% prediksi hari ke-i berikutnya
    predictor = [sig2;y2(2:end);sma;ema;]'; %y2 dari 2 sampai end, karena merupakan sinyal yg ditunda
    [q1,mdl] = AdapletSVR(sig',predictor,'gaussian',998.05,3.5245);

    % Gabung prediksi
    sig = [sig q1];
    Jumlah_data_awal         =size(Close(saham:length(proses))')
    Jumlah_data_setelah_pred =size(sig)
end

%% Perhitungan Error Hasil
prediksi = sig(length(sig)-(hari-1):end)';
acuan    = pembanding(1:hari);

[mse,mape] = hitungerror(prediksi,acuan)

figure()
plot(1:size(sig',1),sig','r.-',1:size(sig',1),Close(1:size(sig',1)),'b.-')
grid on
legend('Prediksi','Asli')
title('Prediksi Saham BNI dengan Data Latih 1 hingga 254')
