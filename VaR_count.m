
function [VaR] = VaR_count (loss, weight, confidence)

% this function ranks loss with its weight & finds VaR with confidence level
% VaR = the ranked loss whose cumulative weight equals to or just exceeds (1-confidence)
% please do not edit the function

% INPUTS
%    loss: N-by-1, loss scenarios
%    weight: N-by-1, corresponding weight of loss
%    confidence: confidence level of VaR, e.g., 0.99

L = [loss, weight];
L = sortrows(L, 'descend');
cum_weight = cumsum(L(:,2));
N_VaR = size(L(cum_weight < (1-confidence -1e-10),:), 1);   % -1e-10 is to avoid (0.01<0.01)=True
VaR = L(N_VaR+1, 1);