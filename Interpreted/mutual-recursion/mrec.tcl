proc m {n} {
    if { $n == 0 } { expr 0 } else {
        expr {$n - [f [m [expr {$n-1}] ]]};
    }
}
proc f {n} {
    if { $n == 0 } { expr 1 } else {
        expr {$n - [m [f [expr {$n-1}] ]]};
    }
}

puts [f [lindex $argv 0]]
puts [m [lindex $argv 0]]
