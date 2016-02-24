<?php
function num_paths($startsum, $lastcoin) {

    static $coins = array(1, 2, 5, 10, 20, 50, 100, 200);

    if ($startsum == 250) {
        return 1;
    }

    $paths = 0;
    foreach ($coins as $coin) {
        if (($lastcoin >= $coin) && ($startsum <= (250 - $coin))) {
            $paths += num_paths($startsum + $coin, $coin);
        }
    }

    return $paths;
}

echo num_paths($argv[1], $argv[2]), "\n";
?>
