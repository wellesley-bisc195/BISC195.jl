# Part 3 - The Julia REPL

Open julia, which you [should have installed](@ref install_julia) in the first part of this lesson.

Your terminal application should open, running julia:

```
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.4.0 (2020-03-21)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia>
```

Technically speaking,
this is the julia "Read, evaluate, print, loop", or "REPL".

When you enter text at the `julia>` prompt,
the REPL **read**s it,
**evaluate**s it as julia code,
**print**s[^1] the result,
and then **loop**s back to the prompt.

Let's try it! Type `println("Hello, World!")` at the prompt and hit enter.

```@repl
println("Hello, World!")
```

Don't worry if you don't understand all of the components of this command - 
we'll get there.

!!! tip
    As much as possible, try typing out the commands in these lessons,
    rather than copy-pasting.
    It's important to build the muscle memory,
    and to see the errors that appear when you have typos!

    For example, what did I miss here:

    ```@repl
    println(Hello, World!)
    ```

## First steps - arithmetic in julia

Today we will be learning how to perform basic arithmetic calculations in Julia.

Similar to what you learned in math class, `+`, `-`, `*`, and `/` are used for addition, subtraction, multiplication, and division. Try it out for yourself!

```@repl
38 + 2

44 - 4

8 * 5

80 / 2
```

And for exponentiating numbers, you can use `^`.

```@repl
6^2 + 4
```

The order of operations works just like in math too -
[remember PEMDAS](https://en.wikipedia.org/wiki/Order_of_operations)
(or **P**lease **E**xcuse **M**y **D**ear **A**unt **S**ally):

```@repl
6^2 + 4 # exponent comes before division

6^(2 + 4) # parentheses cause the addition to happen first
```


# Values and Types

In computer science, a **value** is just some data that can be manipulated by a program. In this lesson, we have encountered many different values, such as numbers or words.

In the previous section, you may have noticed that the result of dividing 80 by 2 was `40.0` and not `40`.

This is because computer scientists differentiate between numbers with and without decimal points as two different data types. In Julia, numbers with decimal points like `40.0` belong to the type `Float64`, and numbers without decimal points like  `40` belong to
the type `Int64`.

!!!Note:

When you are working with really big numbers such as `1,000,000`, do not include the commas if you want Julia to recognize it as an integer. For example, if you were to run this code:

```julia
1,000,000
```

you would see that Julia thinks that `1,000,000` is a list of integers!

Strings, which are sequences of characters fall under the type `String`. Basically, any characters defined within quotes are strings, even if they are numbers.

For example, explore what happens if you were to use the `typeof()` function on `2`.

```@repl
typeof("2")
```


[^1]: In the days before monitors,
    results would literally be printed on a piece of paper.
    These days, "printing" just means displaying the results.