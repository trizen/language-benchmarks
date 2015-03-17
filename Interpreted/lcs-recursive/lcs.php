<?php
function lcs($xstr, $ystr) {

    if ($xstr == '' or $ystr == '') {
        return '';
    }

    $x = $xstr[0];
    $xs = substr($xstr, 1);
    $y = $ystr[0];
    $ys = substr($ystr, 1);

    if ($x == $y) {
        return ($x . lcs($xs, $ys));
    }

    $lcs1 = lcs($xstr, $ys);
    $lcs2 = lcs($xs, $ystr);

    return strlen($lcs1) > strlen($lcs2) ? $lcs1 : $lcs2;
}

echo lcs($argv[1], $argv[2]), "\n";
?>
