f:{[l;r]sum abs asc[l] - asc r}
pairs:($'["I"]) each "   " vs/: read0 `$"puzzle 1 input.txt"
l:pairs[;0]
r:pairs[;1]
ans:f[l;r]

0N!"The answer is: ", string[ans];
