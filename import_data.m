
function [my_stock_price, my_stock_id, stock_date] = import_data (my_group_id)

% MTH305_A2_data.mat
%    stock_date  : T-by-1
%    stock_id    : N-by-1
%    stock_price : T-by-N
%    assign_stock: Ngroup-by-30, stock id assigned to groups

load('MTH305_A2_Part1_Data.mat')
my_stock_id = assign_stock(my_group_id, :);
[T, N] = size(stock_price);

k = 30;
my_stock_price = NaN(T,k);
for i = 1 : k
    for j = 1 : N
        if strcmp(stock_id{j}, my_stock_id{i})
            my_stock_price(:,i) = stock_price(:,j);
        end
    end
end