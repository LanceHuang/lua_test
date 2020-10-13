---
--- 八皇后问题
--- Created by Lance
--- DateTime: 2020/10/13 12:08
---

N = 8 -- 棋盘大小
is_end = false -- 回溯结束标记位

--- 判断第n个皇后，能否放置在第c列
--- @param a table 棋盘
--- @param n number 第n个皇后
--- @param c number 第c列
function is_place_ok(a, n, c)
    for i = 1, n - 1 do
        if (a[i] == c) or -- 同列
                (a[i] - i == c - n) or
                (a[i] + i == c + n) then
            return false
        end
    end
    return true
end

--- 打印棋盘
--- @param a table 棋盘
function print_solution(a)
    for i = 1, N do
        for j = 1, N do
            io.write(a[i] == j and "X" or "-", " ") -- a[i] == j? "X" : "-"
        end
        io.write("\n")
    end
    io.write("\n")
end

--- 回溯添加第n个皇后
--- @param a table 棋盘
--- @param n number 第n个皇后
function add_queen(a, n)
    -- 已结束
    if is_end then
        return
    end

    -- 已有解
    if n > N then
        print_solution(a)
        is_end = true
        return
    end

    for c = 1, N do
        if is_place_ok(a, n, c) then
            a[n] = c
            add_queen(a, n + 1)

            -- 退出循环
            if is_end then
                break
            end
        end
    end
end

-- 运行程序
add_queen({}, 1)