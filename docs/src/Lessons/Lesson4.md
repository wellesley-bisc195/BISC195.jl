# Lesson 4 - Loop-d-loop

[![Assignment 04 - Invitation](https://img.shields.io/badge/Assignment04-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/UbCNPRi2)
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

- Read [Chapter 7](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap07)
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
If you were enterprising
and did the 🐢exercise from [Chapter 4](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap04)
even though you didn't have to,
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
1. `i` is set to 2, `println(i * 3)`
    1. loop back to the top
1. etc...

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
    println(tenth)
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

