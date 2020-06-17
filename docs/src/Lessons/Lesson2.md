# Lesson 2 - Data Types and Functions

[![Lecture 2 - slides](https://img.shields.io/badge/Lecture02-Slides-purple?style=for-the-badge)](@ref lecture2)
![Lecture 2 - date](https://img.shields.io/badge/Date-6%2F11%2F2020-orange?style=for-the-badge)

[![Assignment 02 - Invitation](https://img.shields.io/badge/Assignment02-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/kCXCpki4)
[![Assignment 02 - Description](https://img.shields.io/badge/02-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment02)
[![Assignment 02 - Rendered](https://img.shields.io/badge/02-Script-blue?style=for-the-badge&logo=open%20badges)](@ref Instructions-for-Assignment02)
[![Assignment 02 - Due](https://img.shields.io/badge/Due-6%2F14%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment02)

## Learning Objectives

**Concepts** - After completing this lesson, students will be able to:

- Distinguish between variables and function arguments
- Identify functions that operate on or modify data
- Compare and contrast common scalar and container data types
- Recognize errors resulting from using functions on datatypes
  that do not have appropriate methods

**Skills** - After completing this lesson, students will be able to:

- Use a plain text editor (VS Code) to modify source code
- Execute functions on different types of arguments in the `julia` REPL
- Use print statements and type introspection methods to
  investigate a data type
- Assign, modify, and copy variables
- Use github and github CI to check answers to homework

**Assignments** - This lesson is complete when students have:

- Read [Chapter 2](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap02)
  and [Chapter 3](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap03)
  of Think Julia.
- Cloned the Assignment 2 repository with github classroom.
- Completed assignment 2 with all tests passing.
- Run all code examples from Lesson 2 on their own computers

## Data Types

Programming can be thought of as consiting of 2 things:

1. Data
2. Operations on data

Everything else is just sugar. 

Before continuing,
be sure to read [chapter 2](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap02) of _Think Julia_,
which introduces you to different kinds of values.

The next section will expect you do have read 
[chapter 3](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap03),
which introduces you to the operations part (functions).

These chapters also introduce a number of important concepts like
variable assignment, expressions, flow of execution, and arguments.
All of these concepts will come up again and again,
so if you're still a bit fuzzy on them,
that's ok.

### Practice

The following examples are intended to reinforce and extend what you've learned.
In many cases, they are intended to expose behavior that may be unintuitive,
or lead to errors that are worth understanding.

!!! warning "Checking Questions"
    1. For each of the following expressions,
       What is the `type` of the value that gets returned after execution?
       
       ```julia
       julia> 1+2
       3

       julia> 3 / 2
       1.5

       julia> "42 * 6"
       "42 * 6"

       julia> "42" * "6"
       "426"
       ```
    
    2. Assign each of these values to a different variable (eg `my_sum = 1+2`).
       And use the `typeof()` function to test your answers above.
       For example   
       
       ```julia
       julia> x = "42" * "6"
       "426"   
       
       julia> typeof(x)
       String
       ```
    
    3. What is the difference between the following expressions?

       ```julia
       julia> "AATTCC"^2
       "AATTCCAATTCC"

       julia> println("AATTCC"^2)
       AATTCCAATTCC
       ```

       What happens if you assign each of these expressions to a variable?

    4. What is the difference between `Float64` and `Int64`?
       
       Are there situations where one is obviously preferred over the other
       in a math problem?

    5. Without evaluating the following expressions,
       try to guess what the return type will be, `Int64` or `Float64`.

       ```julia
       julia> 1 + 1

       julia> 2. - 2.

       julia> 3 * 3.

       julia> 4. * 4

       julia> 5 / 5

       julia> "6" + "6.0"

       julia> 1e7 + 1
       ```

       Now evaluate them - did you get them right?
       use `typeof()` if you're not sure.


!!! tip
    When you are working with really big numbers such as `1,000,000`, do not include the commas if you want `julia` to recognize it as an integer. For example, if you were to run this code:

    ```julia
    julia> 1,000,000
    (1, 0, 0)
    ```

    you can see that `julia` thinks that `1,000,000` is a group of 3 integers (`1`, `0`, and `0`)!
    Instead, `julia` allows you to use underscores to break up large integers.

    ```julia
    julia> 1_000_000
    1000000
    ```

    !!! note
        But be careful! ["Overflow"](https://en.wikipedia.org/wiki/Integer_overflow)
        can occur when you try to use giant numbers.
        Watch:

        ```julia
        julia> 2^61
        2305843009213693952

        julia> 2^62
        4611686018427387904

        julia> 2^63
        -9223372036854775808

        julia> 2^64
        0
        ```
        
        What happened?
        Integers, like all types of data,
        are stored in memory as bits -
        sequences of `1`s and `0`s.
        In julia, the primary integer type is `Int64`,
        which uses 64 bits,
        63 of which are used for the magnitude,
        and one for the sign (`+` or `-`).

        The value `2^63` would require 65 bits
        to hold in memory.

## Functions

Before continuing,
be sure to read 
[chapter 3](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap03)

Functions are the parts of a program that do things.
Without functions, all you have is data.
Actually, most of the time if you want data,
you need functions too,
unless you're writing literally everything by hand.

### Recognizing functions

Functions are bits of code that do things.
Remember the [video from Lesson 1](@ref first-steps)?
(seriously, go back and watch it if you didn't before).
The kids are providing dad a list of functions.

```
get(peanut_butter)
get(jelly)
get(toast)
spread(toast, peanut_butter)
spread(toast, jelly)
```

In julia, it's typically easy to recognize functions because they have the structure:

1. `function_name`
2. `(`
3. `arguments, separated, by, commas`
4. `)`

So in the expression

```@repl
println("Hello", " ", "world!")
```

The `function_name` is `println`
and there are 3 arguments (in this case, all `String`s).

But functions show up in other ways too. 
All of the math you were doing in the previous section
was calling functions.
In julia, `1 + 1` is just a convenient syntax[^1] for `+(1,1)`

```@repl
+(42,7)
*("BISC", "195")
```

When you do even simple things like type something in the REPL,
there are functions being called
to evaluate the expression and print the result.

### [Variables, arguments, and scope]@id scope

In chapter 3 of _Think Julia_, you read that
[variables and parameters are local](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#_variables_and_parameters_are_local)
to functions. 

The more technical way to say that is that the inside of functions
have their own "scope"[^2].
This will start to become familiar as you write more code,
but it can be confusing at first.

Also potentially confusing is the difference between a `variable`
and an `argument`.
They are similar in various ways,
but treating them in the same way,
_especially naming them the same thing_,
is an easy way to get yourself confused.

Let's see an example:

```@example args
function newprint(my_arg)
    println(my_arg, ", students!")
end

newprint("Hello there")
```

This should seem pretty straightforward.
The function `newprint()` takes a single argument,
and prints that, appending `", students!"`.
Inside the function,
the value passed as an argument - `"Hello there"` -
is passed in everywhere you see `my_arg`,
but `my_arg` doesn't exist outside the function.

```@repl args
my_arg
```

We could also have passed a _variable_ as the argument.

```@example args
gb = "Goodbye"

newprint(gb)
```

Same thing - the _variable_ `gb` refers to the _value_ `"Goodbye"`,
and will be substituted everywhere that `my_arg` lives in the function.

Let's look at a slightly more confusing example.

```julia
some_arg = "Woah"
other_arg = "Huzzah"

function nelly(some_arg)
    println(some_arg, ", Nelly!")
end

nelly(other_arg)
``` 

What do you expect?
Try it out and see if you're right.

When we call `nelly(other_arg)`,
we're passing the value `"Huzzah"` as the argument.
So inside the scope of the function,
`some_arg` is `"Huzzah"`.

What about `some_arg` outside of the function?

```@setup args2
some_arg = "Woah"
other_arg = "Huzzah"

function nelly(some_arg)
    println(some_arg, ", Nelly!")
end

nelly(other_arg)
```
```@example args2
some_arg
```

Here, we're outside of the function scope,
so `some_arg` is `"Woah"`.

Because of this possibility for confusion,
it's usually a good idea to name your function arguments
and your variables different things. 

!!! tip
    Just to reiterate,
    use different names for variables that refer to data
    and function arguments.

    And typically, it's also good practice to make your code "self-documenting",
    which means that the names of functions, variables, and arguments
    tells you something about what they're used for.

### Practice

The following examples are intended to reinforce and extend what you've learned.
In many cases, they are intended to expose behavior that may be unintuitive,
or lead to errors that are worth understanding.

!!! warning "Checking Questions"
    1. For each of the expressions ending with `# ?`,
       try to predict what the output will be.
       Then, run them in the REPL and see if you were correct.

       ```julia
       julia> x = 4; # putting `;` prevents the "print" part "read-eval-print-loop"
       
       julia> x # ?
       ```
       ```julia
       julia> y = 2.0;

       julia> y + x # ?
       ```
       ```julia
       julia> z = y * 2;

       julia> z # ?
       ```
    2. Write a function called `multisquare()` that

       - takes **2 arguments**
       - multiplies them together
       - returns the product raised to the second power

       Once you've defined the function,
       you should be able to run

       ```julia
       julia> multisquare(2, 5)
       100

       julia> multisquare("2","5")
       "2525"

       julia> multisquare(1,2.0,3.0)
       ERROR: MethodError: no method matching multisquare(::Int64, ::Float64, ::Float64)
       # ... stack trace

       julia> multisquare(1,"2")
       ERROR: MethodError: no method matching *(::Int64, ::String)
       # ... stack trace
       ```
       
       Your output will also contain "stack traces"[^3] for each error.
       Don't worry about trying to understand it right now
       (though it will be very helpful later on).

    3. Both `multisquare(1,2.0,3.0)` and `multisquare(1,"2")` raise `MethodError`s.
       Notice that the former says "no method matching `multisquare(`...",
       while the later says "no method matching `*(`..."
       What accounts for this difference?

    4. Everything we've done here so far is using `julia`,
       but the same concepts are applicable on the command line too,
       just with different syntax.

       When you change directories with 
       
       ```sh
       $ cd ~/Desktop 
       ```

       `cd` is a function and `~/Desktop` is the argument

       Can you identify the function and the argument(s)
       in the following shell commands?

       ```sh
       $ ls -l ~/Documents
       ```
       ```sh
       $ mv ace-ventura1.mov /home/kevin/Movies
       ```

## Key Terms

[^1]: **Syntax** - The rules that govern how characters in your code files
      are translated into instructions that the computer understands.
      Julia has one kind of syntax, and the shell has another.
      One of my great hopes for this course is that you'll come to recognize that,
      though you will learn some syntax for these specific languages,
      most of the skills you're learning are transferrable
      to learning any programming language.
[^2]: **Scope** - The region of a program in which assigned variables are available.
      In julia, scopes tend to be much more restrictive by default than in other languages.
      If you ever get an `UndefVarError` when you think that you've actually defined the variable,
      it's probably not in the right scope.
[^3]: **Stack trace** - This part of error messages can be super daunting at first,
      especially as your programs get more complicated,
      but can also be incredibly helpful when debugging.
      Essentially, they are displaying the [stack diagram](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#stack_diagrams)
      for your program where the error occured,
      including pointing to the specific line in the code files
      (or REPL block number) where the error occurred.
