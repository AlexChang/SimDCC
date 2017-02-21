function ss = partitionFiles(N, K, F, p)
cn = 2^K;
ss = zeros(N*cn, 1, F);
for i = 0:N-1
    p1 = p((i+1), :, :);
    p2 = p((i+1)+N, :, :);
    p3 = p((i+1)+2*N, :, :);
    p4 = p((i+1)+3*N, :, :);
    ss(i*cn+1, :, :) = ~(p1 | p2 | p3 | p4);        % File 0
    ss(i*cn+16, :, :) = (p1 & p2 & p3 & p4);                    % File 1,2,3,4
    ss(i*cn+12, :, :) = bitxor(ss(i*cn+16, :, :), (p1 & p2 & p3));     % File 1,2,3
    ss(i*cn+13, :, :) = bitxor(ss(i*cn+16, :, :), (p1 & p2 & p4));     % File 1,2,4
    ss(i*cn+14, :, :) = bitxor(ss(i*cn+16, :, :), (p1 & p3 & p4));     % File 1,3,4
    ss(i*cn+15, :, :) = bitxor(ss(i*cn+16, :, :), (p2 & p3 & p4));     % File 2,3,4
    ss(i*cn+6, :, :) = bitxor((ss(i*cn+12, :, :) | ss(i*cn+13, :, :) | ss(i*cn+16, :, :)), (p1 & p2));     % File 1,2
    ss(i*cn+7, :, :) = bitxor((ss(i*cn+12, :, :) | ss(i*cn+14, :, :) | ss(i*cn+16, :, :)), (p1 & p3));     % File 1,3
    ss(i*cn+8, :, :) = bitxor((ss(i*cn+13, :, :) | ss(i*cn+14, :, :) | ss(i*cn+16, :, :)), (p1 & p4));     % File 1,4
    ss(i*cn+9, :, :) = bitxor((ss(i*cn+12, :, :) | ss(i*cn+15, :, :) | ss(i*cn+16, :, :)), (p2 & p3));     % File 2,3
    ss(i*cn+10, :, :) = bitxor((ss(i*cn+13, :, :) | ss(i*cn+15, :, :) | ss(i*cn+16, :, :)), (p2 & p4));    % File 2,4
    ss(i*cn+11, :, :) = bitxor((ss(i*cn+14, :, :) | ss(i*cn+15, :, :) | ss(i*cn+16, :, :)), (p3 & p4));    % File 3,4
    ss(i*cn+2, :, :) = bitxor((ss(i*cn+6, :, :) | ss(i*cn+7, :, :) | ss(i*cn+8, :, :) | ss(i*cn+12, :, :) | ss(i*cn+13, :, :) | ss(i*cn+14, :, :) | ss(i*cn+16, :, :)), p1);   % File 1
    ss(i*cn+3, :, :) = bitxor((ss(i*cn+6, :, :) | ss(i*cn+9, :, :) | ss(i*cn+10, :, :) | ss(i*cn+12, :, :) | ss(i*cn+13, :, :) | ss(i*cn+15, :, :) | ss(i*cn+16, :, :)), p2);  % File 2
    ss(i*cn+4, :, :) = bitxor((ss(i*cn+7, :, :) | ss(i*cn+9, :, :) | ss(i*cn+11, :, :) | ss(i*cn+12, :, :) | ss(i*cn+14, :, :) | ss(i*cn+15, :, :) | ss(i*cn+16, :, :)), p3);  % File 3
    ss(i*cn+5, :, :) = bitxor((ss(i*cn+8, :, :) | ss(i*cn+10, :, :) | ss(i*cn+11, :, :) | ss(i*cn+13, :, :) | ss(i*cn+14, :, :) | ss(i*cn+15, :, :) | ss(i*cn+16, :, :)), p4); % File 4
end
