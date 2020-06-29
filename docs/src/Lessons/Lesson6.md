# Lesson 6 - Miscellany

[![Assignment 06 - Invitation](https://img.shields.io/badge/Assignment06-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/F3lWDTLh)
[![Assignment 06 - Description](https://img.shields.io/badge/06-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment06)
[![Assignment 06 - Rendered](https://img.shields.io/badge/06-Script-blue?style=for-the-badge&logo=open%20badges)](@ref Instructions-for-Assignment06)
[![Assignment 06 - Due](https://img.shields.io/badge/Due-7%2F6%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment06)

## Learning objectives

**Concepts** - After completing this lesson, students will be able to:

- Compare and contrast plain text and binary file formats
- Select the best data structure for different types of data

**Skills** - After completing this lesson, students will be able to:

- Download files from a url from the command line
- Read files line-by-line and perform actions on each line.

**Assignments** - This lesson is complete when students have:

- Read [Chapter 9](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap09)
  and [Chapter 14](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap14)
  of Think Julia.
- Run all code examples from Lesson 6 on their own computers
- Cloned the Assignment 6 repository with github classroom.
- Completed assignment 6 with all tests passing.

## Beyond `Base` - Statistics

All of the functionality we've used thus far
has been found in the main `julia` library, called `Base`. 
But one of the great things about programming languages, 
especially open-source ones like `julia`,
is that many people have written a lot of other functionality
and shared it with the world in "packages."

This functionality is not available out-of-the-box,
but you can easily bring this world of additional functions and types
into your own code.
Some commonly used packages are installed along with julia
(these are called the "standard library" or "stdlib"),
and others can be installed using the "package manager."

For now, we'll just deal with the packages in `stdlib`.

### Bringing in other functions

Julia was designed for numerical computing,
but there are a many functions commonly used in statistics
that are not available when you first start up julia.
For example, it is often useful to calculate
the mean, median, and standard deviation
of numbers in a vector.

```julia
julia> v = rand(100); # create vector of random numbers

julia> mean(v)
ERROR: UndefVarError: mean not defined

julia> median(v)
ERROR: UndefVarError: median not defined
```

!!! practice
    1. Write a function `my_mean()` that calculates the mean of numbers in a `Vector`.
       Remember, the mean of a series of numbers is the sum of those numbers
       divided by the number of values.

       Hint: What function tells you how many numbers are in a `Vector`?
       
       Hint2: Remember that the `sum()` function can tell you the sum of the numbers
       in a vector.

    2. What is the mean of `v`, defined above?

Defining `my_mean()` isn't so hard, but does your function also work on Tuples?
What about a matrix (a 2-dimensional array) like `m = [1 2; 1 2; 4 5]`?
And what about `my_median()` or `my_standard_deviation()`?
You could probably figure out how to define those functions
given what you've learned so far,
but lots of other people have probably needed this functionality before,
and the code is already written and tested.

In this case, the functionality is part of the stdlib
in the `Statistics` package.
To load the functionality into your own code,
we use the keyword `using`:

```@setup stats
v = rand(100)
```

```@repl stats
using Statistics

mean(v)

median(v)

std(v)
```

!!! warning "Checking Questions"
    1. How does the result form `mean()`? from `Statistics` compare
       to `my_mean()`?
    2. Take a look at [the code](https://github.com/JuliaLang/Statistics.jl/blob/master/src/Statistics.jl#L19-L183)
       for the mean function defined in `Statistics` -
       it's about 150 lines of code!

       This function does a lot more than `my_mean()`,
       and is probably more efficient.
       Looking at the docstring for `mean()`
       (remember, you can see it by doing `?mean` at the REPL),
       Can you find one thing `mean()` can do that `my_mean()` can't?

## Beyond `Base` - other libraries

In the stdlib, there are also packages for
[working with dates](https://docs.julialang.org/en/v1/stdlib/Dates/), 
[generating random numbers](https://docs.julialang.org/en/v1/stdlib/Random/),
and for doing [linear algebra](https://docs.julialang.org/en/v1/stdlib/LinearAlgebra/),
among others,
but a huge amount of additional functionality can be found
in the [broader package ecosystem](https://www.juliahub.com/ui/Packages).

Installing these packages takes just a little bit of extra effort,
and we'll learn about that in future lessons,
but it's important to realize that these packages
are just like the code you've been writing this whole time.
In fact - the lessons you've already completed _are_ packages!

## Practice, practice, practice

Both chapters from _Think Julia_ this week are practical exercises,
but contain a lot of concepts that will be very helpful
as we start to more earnestly deal with biological data.
Several of the assignment questions are based on the examples in the book.
Try to solve the problems in the book before looking at the answers,
as struggling through these practice problems will help
when it comes time to do the assignment.

Good luck!