function [YFit,mdl2] = AdapletSVR(Target,predictor,kernel,C,KernelScale)

if (nargin < 5) KernelScale = 'auto';end
if (nargin < 4) C = 1; end
if (nargin < 3) kernel = 'linear'; 
                KernelScale = NaN; end
if (nargin < 2) help svr; end  



n = size(predictor,1);
rng default
% mdl2 = fitrsvm(predictor(1:n-1,:),Target,'KernelFunction','gaussian','KernelScale',1/sqrt(0.05),'Standardize',true);
mdl2 = fitrsvm(predictor(1:n-1,:),Target,'BoxConstraint',C,...
                                         'KernelFunction',kernel,...
                                         'KernelScale',KernelScale,...
                                         'Standardize',true);
YFit = predict(mdl2,predictor(end,:));
YFit = round(YFit);