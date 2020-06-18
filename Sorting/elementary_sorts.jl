
# Checks if v is lower than w.
function lower(v, w)
    return v < w
end

# Exchanges the elements a[i] and a[j]
function exchange(a, i, j)
    t = a[i]
    a[i] = a[j]
    a[j] = t
end

# Checks if the array a is sorted
function is_sorted(a)
    for i = 2:length(a)
        if lower(a[i], a[i-1])
            return false
        end
    end
    return true
end

# Sort array a using selection sort
function selection_sort(a)
    N = length(a)
    for i = 1:N
        min = i
        for j = i+1:N
            if (lower(a[j], a[min]))
                min = j
            end
        end
        exchange(a, i, min)
    end
end

# Sort array a using insertion sort
function insertion_sort(a)
    N = length(a)
    for i = 1:N
        for j = i:-1:2
            if lower(a[j], a[j-1]) exchange(a, j, j - 1)
            else break
            end
        end
    end
end

# Sort array a using shell sort
function shell_sort(a)
    N = length(a)
    # Construct initial h of the h-sort
    h = 1
    while (h < N / 3)
        h = 3 * h + 1
    end
    # h-sorting down to h = 1
    while (h >= 1)
        for i = h:N
            for j = i:-h:h
                if lower(a[j], a[j-h]) exchange(a, j, j - h)
                else break
                end
            end
            # Decrease h
            h = h/3
        end
    end
end

function main()

    a = rand(20, 1)

    b = a
    selection_sort(b)
    # println(b)
    println(is_sorted(b))

    b = a
    insertion_sort(b)
    # println(b)
    println(is_sorted(b))

    b = a
    shell_sort(b)
    # println(b)
    println(is_sorted(b))

    println(b)
end

main()
