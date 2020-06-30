# Lesson 5 - Arrays

[![Assignment 05 - Invitation](https://img.shields.io/badge/Assignment05-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/F3lWDTLh)
[![Assignment 05 - Description](https://img.shields.io/badge/05-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment05)
[![Assignment 05 - Rendered](https://img.shields.io/badge/05-Script-blue?style=for-the-badge&logo=open%20badges)](@ref Instructions-for-Assignment05)
[![Assignment 05 - Due](https://img.shields.io/badge/Due-7%2F2%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment05)

## Learning objectives

**Concepts** - After completing this lesson, students will be able to:

- Compare and contrast `Vector`, `Matrix`, and `Tuple` types for storing ordered data
- Differentiate between scalar and vector properties of `String`s
- Explain the uses and limitations of mutable and immutable types
- Recognize when to use copies or references to data

**Skills** - After completing this lesson, students will be able to:

- Solve bugs that occur from attempting to access keys or indexes that don't exist
- Initialize and grow Vectors of different types
- Use indexes, ranges, and loops to access subsets of data
- Use string joining and interpolation to compose complex strings

**Assignments** - This lesson is complete when students have:

- Read [Chapter 8](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap08)
  and [Chapter 10](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap10)
  of Think Julia.
- Run all code examples from Lesson 5 on their own computers
- Cloned the Assignment 5 repository with github classroom.
- Completed assignment 5 with all tests passing.

## String as Array

After reading chapters 8 and 10,
you might have noticed that `String`s act an awful lot like 1D `Array`s (`Vector`s).

Both `String`s and `Vector`s:

1. are ordered collections (`String`s are collections of `Char`, `Vector`s can have any type)
2. can be indexed and sliced

There are many differences, but chief among them is that `Vector`s are "mutable";
that is, we can change the vector by changing individual elements,
adding things, or removing things. 

```@repl
v = collect(2:2:10)

push!(v, 42);
pushfirst!(v, -1);

v

deleteat!(v, 1:2:7);

v
```

`String`s, by contrast, are *immutable*.
This might not be obvious,
since you can do things like

```@repl
s = "a string"
s = s * " " * s
```

It seems like `s` has changed,
but it has not changed by altering the actual object -
instead, we constructed an **entirely new string**
and just reassigned `s` to the new `String`.

!!! warning "Checking Questions"
    1. Assign an empty vector (`[]`) to the variable `v1`,
       then try to `push!` an `Int64`, `Float64`, and `String` to it.
       What is the `typeof` the `Vector`?
    2. Assign `[1.2, 3, 4]` to the variable `v2`.
       What is the type of the second elementt (`v2[2]`)?
       Is that what you expected?
    3. Use `push!()` to add the integer `5` to the vector `v2`.
       What is the type of `v2[4]`?
    4. Use `push!()` to add the `String` `"6"` to the vector `v2`.
       What happens?


`String`s themselves are not `Vector`s,
but we can use `Vector`s of `Char`s
to act like mutable `String`s.

```@repl
vc = collect("Collect makes vector")

push!(vc, 's');
join(vc)
```

The `join()` function takes a vector of `String`s or `Char`s
and creates a new string.

!!! tip
    Remember that you can use the help REPL (press `?` at the REPL)
    to view the docstring of `join()`.

The `join()` function can also take *optional* arguments
that can put a `String` in between each thing that's `join()`ed,

```@repl
join(["I", "love", "the", "julia", "language!"], " 👏 ")
```

and something different between the last two values

```@repl
join(["Head", "shoulders", "knees", "toes"], ", ", ", and ")
```

## Aliasing

Make sure you've read [the section on "aliasing"](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#_aliasing)
in _Think Julia_
prior to answering the following questions.
Even if you already read it, it's worth reading again -
this is a constant source of hard-to-find bugs.

!!! warning "Checking questions"
    For each of the following questions,
    first try to predict the answer,
    then check your answer at the REPL.
    If you were wrong, try to explain the correct answer.

    1. The follwing code assigns 3 variables (`a`, `b`, and `c`) to the float 6.02e24,
       then reassigns one of them (`a`) to the float `3.14`.

       ```julia
       julia> a = b = c = 6.02e24
       6.02e24

       julia> a = 3.14
       3.14
       ```

       What is the value of `b`?

    2. Can you assign `c` to an `Int64`?
    3. The following code assigns 3 variables (`u`, `v`, `w`) to an empty Integer vector,
       then `push!`es the integer `12` to one of them (`u`)

       ```julia
       julia> u = v = w = Int64[]
       0-element Array{Int64,1}
      
       julia> push!(u, 12)
       1-element Array{Int64,1}:
         12
       ```

       What is the value of `v`?

    4. Can you `push!()` a `Float64` to `w`?
    5. Which of the following have the same *type* as `m`
       if `m = [1, 4]`?

       - `n = [5,4,3,2,1]`
       - `o = Int64[]`
       - `p = ["2", "1"]`
       - `q = [1.2, 3.4]

       Hint: you can check by doing eg `n isa (typeof(m))`

## Maps and filters revisited

In [chapter 10 of _Think Julia_](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#_map_filter_and_reduce),
you are introduced to the concept of "map" and "filter" functions,
which apply a function to each element of a collection,
or return only elements that meet a condition respectively.

In the chapter, the examples shown are of
hand-written map and filter functions written with loops,
but these pattterns are so useful that there are
`map()` and `filter()` functions,
each of which take a function as the first argument,
and a collection as the second argument.

For example,

```@example map
function add3(x)
    return x + 3
end

v = map(add3, [1,2,3,4])
```

This is the same as

```@example map
v = Int64[]

for x in [1,2,3,4]
    push!(v, add3(x))
end
```

This type of `map()` returns a copy of the vector,
so the original data will not be altered,
but you can also use `map!()` with the same syntax
to mutate the underlying vector.

Similarly, one can use `filter()` (or, to mutate, `filter!()`)
to perform a filtering function. 
In this case, the function passed as the first argument
must be a boolean function
(anything that returns `true` will be kept).

```@example filter
original = [3.14, 8.5, 25.3, 1.0]

function lessthan5(x)
    return x < 5
end

newv = filter(lessthan5, original)
```

is the same as

```@example filter
newv = Float64[]

for x in original
    if lessthan5(x)
        push!(newv, x)
    end
end
```