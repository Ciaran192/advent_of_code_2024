\l get_day_2_input.q
get_input[]

find_safe_reports:{[reports]
    changes:1_/:deltas each reports;
    decreasing:all each changes within -3 -1;
    increasing:all each (changes where not decreasing) within 1 3;
    sum[increasing] + sum decreasing
    }

find_safe_reports[reports]

is_good_report:{[report]
    changes:1_deltas report;
    (
        all changes within -3 -1
    )
    or
    (
        all changes within 1 3
    )
    }
good_report_count:sum i:is_good_report each reports
ok_report_count:sum any each (each[is_good_report]) each r (_/:)' til each count each r:reports where not i
0N!"Accetpable report count: ", string good_report_count + ok_report_count