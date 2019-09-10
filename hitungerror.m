function [mse,mape] = hitungerror(X,Y)
% input pertama
% input kedua

error = X-Y;
kuadraterror = error.^2;
sumXY = sum(kuadraterror);
mse = sumXY/length(kuadraterror);

error2 = abs(X-Y);
bagi = error2./X;
jumlah = bagi.*100;
mape = (sum(jumlah)/length(jumlah))*100;


