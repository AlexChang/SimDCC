function rd = calculateTheoremRate(M, N, K, F)
rd = K * (1 - M/N) * min( N/(K * M) * (1 - (1 - M/N)^K), N/K);