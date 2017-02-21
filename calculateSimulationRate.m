function rs = calculateSimulationRate(K, ss, u)
u = u - 1;
cn = 2^K;
d0 = sum(ss(u(1) * cn + 1, :, :), 3) +  sum(ss(u(2) * cn + 1, :, :), 3) + sum(ss(u(3) * cn + 1, :, :), 3) + sum(ss(u(4) * cn + 1, :, :), 3);
d1 = max(sum(ss(u(1) * cn + 3, :, :), 3), sum(ss(u(2) * cn + 2, :, :), 3)) + ...    % A2 B1
    max(sum(ss(u(1) * cn + 4, :, :), 3), sum(ss(u(3) * cn + 2, :, :), 3)) + ...     % A3 C1
    max(sum(ss(u(1) * cn + 5, :, :), 3), sum(ss(u(4) * cn + 2, :, :), 3)) + ...     % A4 D1
    max(sum(ss(u(2) * cn + 4, :, :), 3), sum(ss(u(3) * cn + 3, :, :), 3)) + ...     % B3 C2
    max(sum(ss(u(2) * cn + 5, :, :), 3), sum(ss(u(4) * cn + 3, :, :), 3)) + ...     % B4 D2
    max(sum(ss(u(3) * cn + 5, :, :), 3), sum(ss(u(4) * cn + 4, :, :), 3));          % C4 D3
d2 = max(max(sum(ss(u(1) * cn + 9, :, :), 3), sum(ss(u(2) * cn + 7, :, :), 3)), sum(ss(u(3) * cn + 6, :, :), 3)) + ...    % A2,3  B1,3  C1,2
    max(max(sum(ss(u(1) * cn + 10, :, :), 3), sum(ss(u(2) * cn + 8, :, :), 3)), sum(ss(u(4) * cn + 6, :, :), 3)) + ...    % A2,4  B1,4  D1,2
    max(max(sum(ss(u(1) * cn + 11, :, :), 3), sum(ss(u(3) * cn + 8, :, :), 3)), sum(ss(u(4) * cn + 7, :, :), 3)) + ...    % A3,4  C1,4  D1,3
    max(max(sum(ss(u(2) * cn + 11, :, :), 3), sum(ss(u(3) * cn + 10, :, :), 3)), sum(ss(u(4) * cn + 9, :, :), 3));        % B3,4  C2,4  D2,3
d3 = max(max(max(sum(ss(u(1) * cn + 15, :, :), 3), sum(ss(u(2) * cn + 14, :, :), 3)), sum(ss(u(3) * cn + 13, :, :), 3)), sum(ss(u(4) * cn + 12, :, :), 3)); % A2,3,4  B1,3,4  C1,2,4  D1,2,3
rs = d0 + d1 + d2 + d3;

