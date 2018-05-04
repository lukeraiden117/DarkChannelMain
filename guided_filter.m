function q = guided_filter(guide, target, radius, eps)

% Guided Filter implementation from "Fast Guided Filter"
% http://arxiv.org/abs/1505.00996
% Algorithm 1
%1: meanI = fmean(I, r)
%meanp = fmean(p, r)
%corrI = fmean(I. ? I, r)
%corrIp = fmean(I. ? p, r)
%2: varI = corrI ? meanI . ? meanI
%covIp = corrIp ? meanI . ? meanp
%3: a = covIp ./ (varI + )
%b = meanp ? a. ? meanI
%4: meana = fmean(a, r)
%meanb = fmean(b, r)
%5: q = meana. ? I + meanb



[h, w] = size(guide);

avg_denom = window_sum_filter(ones(h, w), radius);

mean_g = window_sum_filter(guide, radius) ./ avg_denom;
mean_t = window_sum_filter(target, radius) ./ avg_denom;

corr_gg = window_sum_filter(guide .* guide, radius) ./ avg_denom;
corr_gt = window_sum_filter(guide .* target, radius) ./ avg_denom;

var_g = corr_gg - mean_g .* mean_g;
cov_gt = corr_gt - mean_g .* mean_t;

a = cov_gt ./ (var_g + eps);
b = mean_t - a .* mean_g;

mean_a = window_sum_filter(a, radius) ./ avg_denom;
mean_b = window_sum_filter(b, radius) ./ avg_denom;

q = mean_a .* guide + mean_b;

end