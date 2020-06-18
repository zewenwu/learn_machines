
using Printf
using Statistics

# Casting
c2 = Char(120)
println(c2)

i1 = UInt8(trunc(3.14))
println(i1)

f1 = parse(Float64, "1")
println(f1)

i2 = parse(Int8, "1")
println(i2)


### Strings
s1 = "Just some random words \n"
println(s1[1])
println(s1[end])
println(s1[1:4])

s2 = string("Yukiteru", "Amano")
println(s2)
println("Yuno" * "Gasai")

i3 = 2
i4 = 3

println("$i3 + $i4 = $(i3 + i4)" )

### Comments
s3 = """ I
have
many
lines """
println("Takao" > "Hiyama")
println(findfirst(isequal('i'), "Keigo"))
println(occursin("key", "monkey"))

### Conditionals
age = 18
if age >= 5 && age <= 6
    println("You're in Kindergarten")
elseif age >= 7 && age <= 13
    println("You're in Middle School")
elseif age >= 14 && age >= 18
    println("You're in High School")
else
    println("Stay Home")
end

@printf("true || false = %s\n", true || false ? "true" : "false" )
@printf("!true = %s\n", !true ? "true" : "false")

### Looping
i = 1
while i < 20
    if (i % 2) == 0
        println(i)

        # i need to be declared global
        global i += 1
        continue
    end
    global i += 1
    if i > 10
        break
    end
end

i = 1
for i = 1:5
    println(i)
end

for i in [2,4,6]
    println(i)
end

for i = 1:5, j = 2:2:10
    println((i,j))
end

### Array
a1 = zeros(Int32, 2,2)
a2 = Array{Int32}(undef, 5)
a3 = Float64[]
a4 = [1,2,3]

println(a4[1])
println(a4[end])
println(5 in a4)
println(findfirst(isequal(2), a4))

f(a) = (a >= 2) ? true : false
println(findall(f, a4))
println(count(f, a4))

### Array operations
a4 =  [1,2,3]
println(size(a4))
println(length(a4))
println(sum(a4))

splice!(a4, 2:1, [8,9])
println(a4)

splice!(a4, 2:3)
println(maximum(a4))
println(minimum(a4))
println(a4 * 2)
println(a4)

a5 = [1, 3.14, "hallo"]
a6 = [sin, cos, tan] # Function can be defined in an array
for n in a6
    println(n(0))
end

# Matrices
a7 = [1 2 3; 4 5 6]
for n = 1:2, m =1:3
    @printf("%d ", a7[n,m])
end
println()

println(a7[:, 2])
println(a7[2, :])

a8 = collect(1:5)
a9 = collect(2:2:10)
for n in a9 println(n) end

a10 = [n^2 for n in 1:5]
println(a10)

push!(a10, 36)

a11 = [n*m for n in 1:5, m in 1:5]
println(a11)

a12 = rand(0:9, 5,5)
for n = 1:5
    for m = 1:5
        print(a12[n,m])
    end
    println()
end

### Tuples
t1 = (1,2,3,4)
println(t1)
println(t1[1])
for i in t1
    println(i)
end

t2 = ((1,2), (3,4))
println(t2[1][2])

t3 = (sue = ("Sue", 100), paul = ("Paul", 200))
println(t3.sue)

### Dictionaries
d1 = Dict("pi" => 3.14, "e" => 2.718)
println(d1["pi"])
d1["golden"] = 1.618
delete!(d1, "pi")

println(haskey(d1, "pi"))
println(in("pi" => 3.14)) # What does this do?

println(keys(d1))
println(values(d1))

for kv in d1
    println(kv)
end

for(key, value) in d1
    println(key, " : ", value)
end

### Sets
st1 = Set(["Jim", "Pam", "Jim"])
println(st1)

push!(st1, "Michael")
println("Dwight", st1)
st2 = Set(["Stanley", "Meredith"])
println(union(s1, s2))

println(intersect(st1, st2))
println(setdiff(st1, st2))

### Function
getSum(x,y) = x+y
x, y = 1, 2
@printf("%d + %d = %d\n ", x,y, getSum(x,y))

function canIVote(age = 16)
    if age > 18
        println("Can Vote")
    else
        println("Can't Vote")
    end
end
canIVote(13)

v1 = 5
function changeV1()
    global v1 = 10 # this makes it pass by reference
end
changeV1()
println(v1)

function getSum2(args...)
    sum = 0
    for a in args
        sum +=a
    end
    println(sum)
end
getSum2(1,2,3,4)

function next2(val)
    return (val + 1, val + 2)
end
println(next2(5))

function makeMultiplier(num) # this function returns a function
    return function(x) return x * num end
end
mult3 = makeMultiplier(3)
println(mult3(6))

function getSum3(num1::Number, num2::Number)
    num1 + num2
end

function getSum3(num1::String, num2::String)
    return parse(Int32, num1) + parse(Int32, num2)
end

# Anonymous function
v2 = map(x -> x*x, [1,2,3])
println(v2)

v3 = map((x, y) -> x+y, [1,2], [3,4])
println(v3)

v4 = reduce(+, 1:100)
println(v4)

sentence = "This is a string"
sArray = split(sentence)
longest = reduce((x, y) -> length(x) > length(y) ? x : y, sArray)
println(longest)

# Enumrater tupes
@enum Color begin
    red = 1
    blue = 2
    green = 3
end
favColor = green::Color
println(favColor)

# Symbols (use strings as variables)
:Derek
println(:Derek)

d2 = Dict(:pi => 3.14, :e => 2.718)
println(d2[:pi])

### Structs
struct Customer # by default immutable
    name::String
    balance::Float32
    id::Int
end

# mutable struct Customer
#     fields
# endstruct Customer
#     name::String
#     balance::Float32
#     id::Int
# end

bob = Customer("Bob Smith", 10.5, 123)
println(bob.name)

### Abstract type
abstract type Animal end

struct Dog <: Animal
    name::String
    bark::String
end

struct Cat <: Animal
    name::String
    meow::String
end

bowser = Dog("Bowser", "Ruff")
muffin = Cat("Muffin", "Meow")

function makeSound(animal::Dog)
    println("$(animal.name) says $(animal.bark)")
end

function makeSound(animal::Cat)
    println("$(animal.name) says $(animal.meow)")
end

makeSound(bowser)
makeSound(muffin)

### Exception handling
num1 = 10;
num2 = 0;

try
    val = num1/num2
    if (val == Inf)
        error("cant divide by 0")
    else
        println(val)
    end
catch e
    println(e)
end

### Macros
macro doMore(n, exp)
    quote # beginning and ending of code
        for i = 1:$(esc(n))
            $(esc(exp))
        end
    end
end

@doMore(2, println("Hello"))

macro doWhile(exp)
    @assert exp.head == :while
    esc(quote
    $(exp.args[2])
    $exp
end)
end

z = 0
@doWhile while z < 10
    global z += 1
    println(z)
end
