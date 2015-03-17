function lcs(xstr, ystr)
    if (xstr == "" or ystr == "") then return "" end;

    local x = xstr:sub(0,1);
    local xs = xstr:sub(2,-1);
    local y = ystr:sub(0,1);
    local ys = ystr:sub(2,-1);

    if x == y then
        return (x .. lcs(xs, ys))
    end

    local lcs1 = lcs(xstr, ys);
    local lcs2 = lcs(xs, ystr);

    if lcs1:len() > lcs2:len() then
        return lcs1
    else
        return lcs2
    end
end

print(lcs(arg[1], arg[2]))
