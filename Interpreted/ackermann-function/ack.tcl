interp recursionlimit {} [expr {10000}]

namespace import ::tcl::mathop::*

proc ack {m n} {
    if {! $m} {
        incr n
    } elseif {! $n} {
	incr m -1
        ack $m 1
    } else {
        incr n -1
        ack [- $m 1] [ack $m $n]
    }
}

puts [ack [lindex $argv 0] [lindex $argv 1]]
