function p = placeFiles(M, N, K, F)
cnt = fix(M*F/N);
p = zeros(K*N, 1, F);
for i = 1:K*N
    rep = randperm(F, cnt);
    for j = 1:cnt
        p(i, 1, rep(1, j)) = 1;
    end
end