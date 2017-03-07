%% Growth

%% 
data_in_width = 8;

Coeffs = [112 115 -144 ];

Coeffs_bit = log2(sum(abs(Coeffs)))

total_bits = ceil(Coeffs_bit) + data_in_width

%% 
data_in_width = 24;

Coeffs = [ -1, -3, 0, 24, 65, 86];

Coeffs_bit = log2(sum(abs(Coeffs)))

sum_bit = log2(2*(2^data_in_width -1)) - data_in_width

result_bit = ceil(sum_bit) + ceil(Coeffs_bit) + data_in_width

result_after_shift = result_bit - 8
%% result bit
data_in_width = 24;

cshift = 8;

Coeffs = [ -1, -3, 0, 24, 65, 86];

result_bit = ceil(log2(sum(abs(2*(2^data_in_width - 1)*Coeffs)))) - cshift


%% convert to fixed point

bits = 7; % + 1 +/- (signed bit)

b = [0.12, 0, 0.1]

best_shift = bits-ceil(log2(max(abs(b))))

b_scale =  b * (2^best_shift);

b_scale = int8(round(b_scale))
%%

Clk12 = 12000000;

Clk48 = 48000

scale = Clk12/Clk48
