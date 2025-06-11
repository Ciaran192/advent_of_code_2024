\l get_puzzle_input.q
get_input[]

f:{[l;r]sum abs asc[l] - asc r}
ans:f[l;r]

0N!"The answer is: ", string[ans];
