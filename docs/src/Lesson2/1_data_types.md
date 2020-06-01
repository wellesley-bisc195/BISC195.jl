# Data Types

Programming can be thought of as consiting of 2 things:

1. Data
2. Operations on data

Everything else is just sugar. 

Before continuing,
be sure to read [chapter 2](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap02) of _Think Julia_,
which introduces you to different kinds of values.

The next page will expect you do have read 
[chapter 3](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap03),
which introduces you to the operations part (functions).

These chapters also introduce a number of important concepts like
variable assignment, expressions, flow of execution, and arguments.
All of these concepts will come up again and again,
so if you're still a bit fuzzy on them,
that's ok.

## Practice for Variables, Expressions and Statements

The following examples are intended to reinforce and extend what you've learned.
In many cases, they are intended to expose behavior that may be unintuitive,
or lead to errors that are worth understanding.

!!! warning "Checking Questions"
    1. For each of the following expressions,
       What is the `type` of the value that gets returned after execution?
       
       ```
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

