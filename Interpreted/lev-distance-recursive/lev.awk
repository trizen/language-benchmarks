
BEGIN {
    a = ARGV[1];
    b = ARGV[2];
    print levenshteinDistance(a, b);
}

function levenshteinDistance(s, t, s1, t1, distA, distB, distC, minDist) {

    # If either string is empty,
    # then distance is insertion of the other's characters.
    if (length(s) == 0) return length(t);
    if (length(t) == 0) return length(s);

    # Rest of process uses first characters
    # and remainder of each string.
    s1 = substr(s, 2, length(s));
    t1 = substr(t, 2, length(t));

    # If leading characters are the same,
    # then distance is that between the rest of the strings.
    if (substr(s, 1, 1) == substr(t, 1, 1)) {
        return levenshteinDistance(s1, t1);
    }

    # Find the distances between sub strings.
    distA = levenshteinDistance(s1, t1);
    distB = levenshteinDistance(s,  t1);
    distC = levenshteinDistance(s1, t );

    # Return the minimum distance between substrings.
    minDist = distA;
    if (distB < minDist) minDist = distB;
    if (distC < minDist) minDist = distC;
    return minDist + 1; # Include change for the first character.
}
