function num_paths(startsum,lastcoin)
    if (startsum==250) then return 1 end
    local paths = 0
    for _,coin in ipairs({1, 2, 5, 10, 20, 50, 100, 200}) do
        if (((lastcoin>=coin) and (startsum<=(250-coin)))) then
            paths = paths + num_paths(startsum + coin, coin)
        end
    end

    return paths
end

print(num_paths(0,250))
