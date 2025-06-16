raw_text:read0 `:day3input.txt
raw_text:" " sv raw_text
mul_patterns: flip (
    (
    "mul([0-9],[0-9])";
    "mul([0-9],[0-9][0-9])";
    "mul([0-9],[0-9][0-9][0-9])";
    "mul([0-9][0-9],[0-9])";
    "mul([0-9][0-9],[0-9][0-9])";
    "mul([0-9][0-9],[0-9][0-9][0-9])";
    "mul([0-9][0-9][0-9],[0-9])";
    "mul([0-9][0-9][0-9],[0-9][0-9])";
    "mul([0-9][0-9][0-9],[0-9][0-9][0-9])"
    );
    8 9 10 9 10 11 10 11 12 // How many characters to sublist after each pattern appearance
    )

muls:raze {((raw_text ss x[0]) ,' x[1]) sublist\: raw_text} each mul_patterns

compute_sum_of_muls:{[mul_string_list] sum .'[*] ($'["J"]) each "," vs/: -1_'4_'mul_string_list}
-1 "Part 1 answer: ", string compute_sum_of_muls muls;

// Part 2

// Use an asof join to get whether the most recent index appearance of a conditional was a do or not

muls_and_inds:raze {inds,'enlist each (,'[;x[1]] inds:raw_text ss x[0]) sublist\: raw_text} each mul_patterns
mul_tab:`index xasc flip `index`mul_strings!flip muls_and_inds

conditional_locs:raw_text ss/: ("do()";"don't()")
conditional_tab:`index xasc flip `index`is_do!(raze conditional_locs;raze count'[conditional_locs] #' 10b)
update conditional_ind:index from `conditional_tab;

t:update is_do:1b from aj[`index;mul_tab;conditional_tab] where null conditional_ind 
part_2_solution:compute_sum_of_muls exec mul_strings from t where is_do 
-1 "Part 2 answer: ", string part_2_solution;