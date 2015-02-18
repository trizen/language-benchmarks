<?php
function leven($s, $t) {

    if ($s == '') {
        return strlen($t);
    }
    if ($t == '') {
        return strlen($s);
    }

    $s1 = substr($s, 1);
    $t1 = substr($t, 1);

    return ($s[0] == $t[0]
        ? leven($s1, $t1)
        : 1 + min(
                leven($s1, $t1),
                leven($s,  $t1),
                leven($s1,  $t)
              )
          );
}

echo leven($argv[1], $argv[2]), "\n";
?>
