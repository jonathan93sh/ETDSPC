
bits = 7; % + 1 +/-

fs = 48000;

fc = 8000;

order = 10;

omegac = fc * (2*pi/fs)

b = fir1(order, omegac/pi);

best_shift = bits-ceil(log2(max(b)))

b_scale =  b * (2^best_shift);

b_scale = int8(round(b_scale))