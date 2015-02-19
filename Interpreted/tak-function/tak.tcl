proc tak {x y z} {
    if { $y < $x } { tak [tak [expr {$x - 1}] $y $z] [tak [expr {$y - 1}] $z $x] [tak [expr {$z - 1}] $x $y] } else {
        expr { $z }
    }
}

puts [tak [lindex $argv 0] [lindex $argv 1] [lindex $argv 2]]
