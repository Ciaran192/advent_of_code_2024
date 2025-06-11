\l get_puzzle_input.q
get_input[]

get_difference:{[l;r]
    sum abs asc[l] - asc r
    }
get_similiarity:{[l;r]
    sum l*sum each l=\:r
    }

0N!"The difference is: ", string get_difference[l;r];
0N!"The similarity is: ",string get_similiarity[l;r];
