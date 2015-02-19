<?php
function tak($x, $y, $z) {
    return ($y < $x ? tak(tak($x - 1, $y, $z), tak($y - 1, $z, $x), tak($z - 1, $x, $y))
                    : $z);
}

echo tak($argv[1], $argv[2], $argv[3]), "\n";
?>
