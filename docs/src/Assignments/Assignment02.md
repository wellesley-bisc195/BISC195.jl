# [Assignment02](@id assignment02)

[![Assignment 02 - Invitation](https://img.shields.io/badge/Assignment02-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/kCXCpki4)
[![Assignment 02 - Description](https://img.shields.io/badge/02-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment02)
[![Assignment 02 - Rendered](https://img.shields.io/badge/02-Script-blue?style=for-the-badge&logo=open%20badges)](@ref Instructions-for-Assignment02)
[![Assignment 02 - Due](https://img.shields.io/badge/Due-6%2F14%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment02)

## Instructions

As you did with [Assignment01](@ref assignment01),
click the [invite link](https://classroom.github.com/a/kCXCpki4)
to make a new copy of the assignment repository.

Then, clone the repository, and look at the `src/assignment.jl` file,
which contains information for what needs to be done. 

## Unit Tests

You may or may not have noticed that each of your assignments
has automated "unit testing" set up to check that your code works as expected. 

Once you've completed the assignment,
you will see a green checkmark next to the commit in github

![Github CI passing](https://imgur.com/kb5YuDL.png)

You can also check this on your own computer -
with your assignment repository as the working directory, run:

```sh
$ julia --project -e 'using Pkg; Pkg.test()'
```

If you do this before you've completed the assignment,
you'll probably see a bunch of error messages,
along with the test results:

```
Test Summary: | Pass  Fail  Error  Total
Assignment02  |    6     3      5     14
  Setup       |    3                   3
  Question 1  |          2             2
  Question 2  |    1            4      5
  Question 3  |    1     1             2
  Question 4  |    1            1      2
ERROR: LoadError: Some tests did not pass: 6 passed, 3 failed, 5 errored, 0 broken.
```

Unit tests are widely used in computer programing
so that developers can be certain that their code is working the way they intend.
I'm using them here so you can tell how close you are to completing your assignment.
For now, you can just be assured that if all tests pass,
you're done, and if they don't,
you still have some work to do

If you'd like to know more, keep reading.
The information below is not necessary to complete the assignment this week
(though some of the information may be helpful 😉).

### How tests work

Tests take the form of conditional expressions -
that is, things that return `true` or `false`.

```julia
julia> using Test

julia> @test true
Test Passed

julia> @test false
Test Failed at REPL[3]:1
  Expression: false
ERROR: There was an error during testing
```

"Passing" tests are those that evaluate `true`.
"Failing" tests are those that evaluate `false`.
Errors are reported when the expression throws an error
before returning a value,
or when the expression doesn't return either `true` or `false`  .

There are lots of different types of "boolean" expressions,
those that return `true` or `false`.
For example, `==` is used to ask if two values are equal.

```@repl
1 + 1 == 2

x = 3

x == 6 / 2

"3" == x
```

There are also many built-in functions whose role is to check something,
returning a boolean value.

```@repl
isodd(42)

iseven(12)
```

We can define "testsets" that check a bunch of expressions
and report the information

```julia
julia> using Test

julia> @testset "Example tests" begin
           lifeuniverseeverything = 42
           age = 35
           pi = 3.14

           @test iseven(lifeuniverseeverything)
           @test iseven(age)
           @test iseven(pi)
       end
```
```
Test Summary: | Pass  Fail  Error  Total
Example tests |    1     1      1      3
```

!!! warning "Checking Question"
    Which test failed, and which test was an error?
    
    Run the example in the REPL;
    can you find any relevant information in the stacktrace?

If you'd like to examine the tests for this assignment,
take a look inside `test/runtests.jl` in your assignment repository.
A lot of things will likely be unfamiliar,
but you might find some hints for how to finish the assignment...