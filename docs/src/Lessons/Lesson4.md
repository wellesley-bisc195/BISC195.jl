# Lesson 4 - Loop-d-loop

[![Assignment 04 - Invitation](https://img.shields.io/badge/Assignment04-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/1vpkAM2r)
[![Assignment 04 - Description](https://img.shields.io/badge/04-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment04)
[![Assignment 04 - Rendered](https://img.shields.io/badge/04-Script-blue?style=for-the-badge&logo=open%20badges)](@ref Instructions-for-Assignment04)
[![Assignment 04 - Due](https://img.shields.io/badge/Due-6%2F18%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment04)

## Learning objectives

**Concepts** - After completing this lesson, students will be able to:

- Compare and contrast `for` loops and `while` loops
- Recognize the difference between `String`s and `Char`s
- Debug errors that occur from writing infinite loops

**Skills** - After completing this lesson, students will be able to:

- Use a `for` loop to accomplish a task incrementally
- Write a `while` loop to repeat code until a condition is met
- Stop a loop before it's complete with `break`

**Assignments** - This lesson is complete when students have:

- Read [Chapter 4](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap04)
  and [Chapter 7](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap07)
  of Think Julia.
- Run all code examples from Lesson 4 on their own computers
- Cloned the Assignment 4 repository with github classroom.
- Completed assignment 4 with all tests passing.

## Repeating code with loops

Writing code is about being lazy -
never write more code than you have to!
We've already seen that we can use functions
to wrap up code that can then be used over and over and over and...

But there are plenty more opportunities for re-using code,
especially "loops."
In the 🐢exercise from [Chapter 4](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap04)
you've seen one use of the `for` loop.

```@example
for i in 1:5
    println(i * 3)
end
```

This loop says, "For each number, 1 to 5, print that number times 3."

The way the computer evaluates this is as a loop -
1. `i` is set to 1, `println(i * 3)`
    1. loop back to the top
2. `i` is set to 2, `println(i * 3)`
    1. loop back to the top
3. etc...

### Using ranges in `for` loops

The `1:5` is a "range", it's all of the integers from 1 to 5.
In julia, there are many ways to express ranges -
and they don't always have to increment by 1!

The easiest way to use ranges is with the `:` syntax,
`<start>:<optional-increment>:<end>`.

```@repl
for even_number in 2:2:10
    println(even_number)
end

for half in 1:0.5:3
    println(half)
end
```

You can even go backwards!

```@repl
function decrement(n)
    for d in n:-1:0
        println(d)
    end
end

decrement(5)
```

For more complicated ranges, we can also use the `range()` function.
Use the REPL `help?` mode to learn about the `range` function
by typing `?` (the prompt should change to `help?>`),
then type `range` and press `enter`.

!!! practice
    Use the `range()` function to make a range
    that goes from `10` to `1000` with 4 entries.

    You should be able to run:

    ```julia
    julia> for i in range(#= your code here =#)
               println(i)
           end
    10.0
    340.0
    670.0
    1000.0
    ```

### While loops

In many cases,
the same loop can be written in many different ways.
For example,

```@repl
function whiledecrement(n)
    while n >= 0 # greater than or equal to
        println(n)
        n = n - 1
    end
end

whiledecrement(5)
```

Where `for` loops march through a predetermined sequence,
`while` loops continue until a particular condition is met.

### Loops and scope

In julia, loops have their own scope
(we talked about [scope back in Lesson 2](@ref scope)).
Functions also have their own scope,
and the way that the scope of loops and the scope of functions interact
can be a bit counter-intuitive.

The best way to get a sense of this is to see some examples.

```@example
i = 5

for i in 1:3
    println(i)
end

println(i)
```

```@example
function strangeloop(j)
    k = 1
    for k in 1:j
        println(k)
    end
    println(k)
end

k = 5

strangeloop(k)

println(k)
```

```julia
m = 10

while m > 0
    print("$m ")
    m = m - 1
end
```
```
ERROR: UndefVarError: m not defined
```

Wait, what happened to `m`?

```julia
while m > 0
    print("$m ")
    break
end
```
```
10
```

This occurs because,
though the `m` in `while m > 0` refers to the `m`
assigned to `10`,
inside the loop,
`m` hasn't been defined.
So the expression `m - 1` throws an error.

In a function, things are a bit different:

```julia
function strangewhile(n)
    while n > 0
        print("$n ")
        n = n - 1
    end
    println("") # getting a newline
    println(n)
end

strangewhile(10)
```
```
10 9 8 7 6 5 4 3 2 1
0
```

Loops inside the function have access to the function arguments.
Re-assigning `n` inside the function
changes what the function-scope `n` refers to,
but doesn't leak outside the function.

```julia
my_n = 5

strangewhile(my_n)
```
```
5 4 3 2 1
0
```
```julia
my_n
```
```
5
```

## Loops and Strings - Strings as containers

Loops can also operate on `String`s,
which are built from `Char`s.

```@repl sidx
my_string = "This is a String";

for c in my_string
    println(c)
end
```

We can also access individual parts of a `String`
by "indexing" them.
The syntax for this in julia is to put the index in `[]`.

We can index with individual numbers...

```@repl sidx
my_string[1]
```

or with ranges...

```@repl sidx
my_string[5:8]
```

Or with the special `end` keyword,
which references the last index of a collection.

```@repl sidx
lastindex(my_string)

my_string[end]

my_string[end-5:end]
```

!!! note
    For those of you that have learned other programming languages
    like python or java,
    you might be confused that the first index is `1` instead of `0`.
    That is because julia uses "1-based" indexing.

    For those of you that have used R or matlab,
    or for those of you that have otherwise never been conditioned
    to think of `0` as the first thing,
    this is probably intuitive.

!!! tip
    Notice that the type of a string indexed by a number
    (or the pieces of a `for` loop) is `Char`, 
    and the type when indexed by a range is a `String`:

    ```julia
    julia> typeof(my_string[1])
    Char

    julia> typeof(my_string[1:2])
    String
    ```

    !!! warning "Checking Question"
        How can you get a single letter `String` with indexing?

## Kmers

Over the next couple of lessons,
we're going to build some functions that help us to find
and count all of the "kmers" of any length in a sequence,
then use them to help us identify DNA sequences from various organisms.

A "kmer" is a sequence (DNA, RNA, or amino acid)
of a given length, `k`. 

It is often useful to know the kmer composition
of a sequence, given different values of `k`.
For example, the 2mer (kmers with length 2) composition
of the sequence "ATATATC" is:
- "AT" = 3
- "TA" = 2
- "TC" = 1
 
Note that all reference frames are valid
that is, we don't just march along by 2s.
So the 3mer composition of the same sequence would be
- "ATA" = 2
- "TAT" = 2
- "ATC" = 1

Another way to say this is that the sum of the counts
of all kmers in a sequence must be equal to
the length of the sequence minus `k` plus 1.

!!! warning "Checking questions"
    1. How many 4mers are in the sequence "ATTCCGTCA"
       (the length of the sequence is 9)
    2. All of the 5mers in the above sequence are unique.
       What are they? 
       Answer below[^1], but don't peek until you've tried it!

## A Brief Introduction to Dictionaries

Earlier, when we wanted to calculate GC content of a DNA sequence,
we looped through a sequence, counted anything that was a `G` or `C`,
and then divided that number by the length of the sequence.

If we want to know the composition of all of the bases in DNA
that would be easy to write out by hand,
because there are only 4 options.
You'll do this for real in Assignment04,
but the [psedocode](https://en.wikipedia.org/wiki/Pseudocode) might look something like this:

```
set variables a,c,g,t to 0
for each base in the sequence
    if the base is 'A', add one to `a`
    or if the base is 'C', add one to `c`
    or if the base is 'G', add one to `g`
    or if the base is 'T', add one to `t`
end
return a,c,g,t
```

But doing something like this for proteins,
where each amino acid might be one of 20 options,
or for kmers where the number of possibilities
increases exponentially with `k`
(there are 16 possible DNA 2mers, 64 possible DNA 3mers, etc)
that would be untenable. 

Another option is to use a data structure called a "Dictionary."
What follows is a very brief introduction to dictionaries,
we'll learn more about them next week. 

Dictionaries store data as `key => value` pairs,
where the `key` can by (almost) any type and is used to access
or alter the `value`.
This is probably confusing, but may be clearer with some examples.

```@repl dicts
my_dict = Dict("apples"=> 4, "bananas" => 1, "strawberries"=>10)
```

Here, the fruits are the `key`s,
and the `Int64s` are the `value`s.
We can access values using the `keys` as the index:

```@repl dicts
my_dict["bananas"]
my_dict["strawberries"] * 2
```

We can check if a dictionary has a particular key
with the boolean function `haskey()`. 

```@repl dicts
haskey(my_dict, "apples")
haskey(my_dict, "kumquat")
```

If we try to access the dictionary with a key that doesn't exist,
we'll get an error.

```julia
julia> my_dict["kumquat"]
```
```
ERROR: KeyError: key "kumquat" not found
```

But we can add new entries to the dictionary if we
assign them to new values.

```@repl dicts
my_dict["kumquat"] = 0
haskey(my_dict, "kumquat")
```

And we can update entries by reassigning them,
as if they are variables.

```@repl dicts
my_dict["apples"] = my_dict["apples"] + 1;
my_dict["apples"]
```

In the assignment,
we'll use dictionaries where the keys are the kmers,
and the values are the counts.
Let's get started!

[^1]: There are 6 kmers of length 4 (9 - 4 + 1),
      ["ATTC", "TTCC", "TCCG", "CCGT", "CGTC", "GTCA"]