ws: read0 `$"day4input.txt";

// Part 1

// Step 1: Get all the locations of X
mask:ws = "X"
xLocs:raze {x,'@[where each mask;x]} each til count mask // get the 2-d locations of X

// Step 2: Based on these locations, generate all the index lists 
// we need to check for MAS

l:enlist 1+til 3
nl:neg l
z:enlist 3#0
directions:-1_(l;nl;z) cross (l;nl;z) 
directions:.[,'] each directions // add to each index to get possible MAS sublists

searchOneSquare:{[square] (+/:[square]) each directions}
possibilities: each[.[ws]] each raze searchOneSquare each xLocs
result:sum "MAS" ~/: possibilities
0N!result;

// Part 2

isMASSquare:{[corners]
    cases:("MSMS";"MMSS";"SMSM";"SSMM");
    any corners ~/: cases
    }
mask:ws = "A"
aLocs:raze {x,'@[where each mask;x]} each til count mask // get the 2-d locations of A
MASCandidates:each[.[ws]] each {+[x] each l cross l:-1 1} each aLocs // get the corners surrounding each A
result:sum isMASSquare each MASCandidates
0N!result;
