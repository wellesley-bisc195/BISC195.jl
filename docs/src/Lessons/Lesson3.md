# Lesson 3 - Functions, conditions, recursion, Oh My!

[![Assignment 03 - Invitation](https://img.shields.io/badge/Assignment03-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/UbCNPRi2)
[![Assignment 03 - Description](https://img.shields.io/badge/03-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment03)
[![Assignment 03 - Rendered](https://img.shields.io/badge/03-Script-blue?style=for-the-badge&logo=open%20badges)](@ref Instructions-for-Assignment03)
[![Assignment 03 - Due](https://img.shields.io/badge/Due-6%2F18%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment03)

## Learning objectives

**Concepts** - After completing this lesson, students will be able to:

- Distinguish fruitful functions from void functions
- Recognize boolean values and conditional statements
- Recognize errors resulting resulting from functions expecting boolean values

**Skills** - After completing this lesson, students will be able to:

- Write boolean functions to check the properties of numerical values
- Use alternative evaluation execute different funuctions depending on input
- Recognize recursive functions,
  and identify situations in which they might be useful

**Assignments** - This lesson is complete when students have:

- Read [Chapter 5](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap05)
  and [Chapter 6](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap0)
  of Think Julia.
- Cloned the Assignment 3 repository with github classroom.
- Completed assignment 3 with all tests passing.
- Run all code examples from Lesson 2 on their own computers

## Conditional (boolean) execution 

We can build some useful functions with only the components we've discussed so far,
but they would be somewhat limited.
Let's work on expanding our repertoire
with conditional execution, loops, and recursion.

The following sections assume that you have read
[chapter 5](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap05) and
[chapter 6](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap06)
in _Think Julia_.
You can do chapter 4 if you like
(it lets you play with 🐢's - it's fun!),
but that's not required for now.

### [Computer logic - Booleans](@id booleans)

All computers are build on boolean (true/false) logic. 
At it's core, the two compoents of computer programs
(data and actions) are composed from "bits",
which are physical objects that can have 2 states,
`0` or `1`, `off` or `on`, `false` or `true`,
and [logical operators](https://en.wikipedia.org/wiki/Logic_gate#Truth_tables).

But we don't need to understand the all the details of how this works at a low-level
(I certainly don't)
to effectively use boolean operations in our code.
There are a couple of things to keep in mind.

As you read in _Think Julia_,
you can use conditional evalutation (`if` block)
to execute different code under different circumstances.

```@example compliment
function compliment(base)
    if base == 'A'
        return 'T'
    elseif base == 'T'
        return 'A'
    else
        error("Base $base not supported")
    end
end

compliment('A')
```
```julia
julia> compliment('G')
ERROR: Base G not supported
# ...
```

!!! tip
    Notice that we can use variables
    to insert values in strings using "interpolation"
    with `$`

    ```julia
    julia> mystr = "hello";

    julia> myint = 4;

    julia> "Well, $mystr there. 2 + 2 is $myint"
    "Well, hello there. 2 + 2 is 4"
    ```

    Any arbitrary expression can be interpolated,
    though in many cases you'll need parentheses:

    ```julia
    julia> "2+2 is $(2+2)"
    "2+2 is 4"
    ```

    If you want to include an actual `$` sign in a string,
    you must "escape" it with `\`, or use a "raw" string:

    ```julia
    julia> println("That will be \$2.50")
    That will be $2.50

    julia> println(raw"But I don't have $2.50!'")
    But I don't have $2.50!'
    ```


Here, we're trying to make a function
that returns the `compliment` of a DNA base -
that is, the base that would be on the opposite strand.

I've entered the complimentary bases for `A` and `T`,
but we're missing `C` and `G`.

!!! practice
    Define the `compliment()` function
    so that it gives the compliment of `'G'` and `'C'`
    _in addition to_ `'A'` and `'T'`.

    Be sure to use single quotes -
    the reason will become clear shortly.

```@setup compliment
function compliment(base)
    if base == 'A'
        return 'T'
    elseif base == 'T'
        return 'A'
    elseif base == 'G'
        return 'C'
    elseif base == 'C'
        return 'G'
    else
        error("Base $base not supported")
    end
end
```

### Combinatorial logic

In many cases,
we want to test the truth of multiple statements at once.
Combining boolean values has rules and precedence,
and it's possible to string many of them together.

If your statements get too long, it can be challenging to reason about them.
For example, what's the truth of the following statement?
(remember, `||` means "or" and `&&` means "and"):

```julia
true && false || true && true
```

You might figure it out, but personally, my head hurts.
In my experience, though, I am typically only comparing two things,
so the rules are easy, or I'm using the same logic opperators throughout (all `&&` or all `||`).

```@example
function basetype(base)
    if base == 'A' || base == 'G'
        println("That's a purine!")
    elseif base == 'T' || base == 'C'
        println("That's a pyrimidine!")
    else
        error("Base $base not supported")
    end
end

basetype('C')
```

Another, likely less obvious place where combinatorial logic is at play
is in the behavior of `elseif`.
It's important to remember that the first statement in a conditional block
that evaluates to `true` will be executed,
and nothing else will.
For example,

```@example oddhalf
function oddhalf(num)
    if iseven(num)
        println("That's an even number, you should get an Int, but you won't.")
    elseif num == 42
        println("Life, the Universe, and Everything!")
    else
        println("That's an odd number, expect a Float!")
    end
    return num / 2
end

oddhalf(42)
```

Here, there's no way for `elseif num == 42` to ever be true,
since when `num` is 42, the `iseven(num)` gets hit first,
and that part of the block is evaluated.

!!! note
    The julia logic operators `&&` and `||`
    are "short circuiting", which means that
    if the answer can be known before the right-hand side is evaluated,
    then the right-hand side **won't** be evaluated. 
    This feature can be used to introduce
    a more concise conditional evaluation than an `if` block.

    For example,

    ```julia
    julia> function verbosehalf(x)
           iseven(x) && println("That's an even number!")
           iseven(x) || println("That's an odd number!")
           x / 2
       end
    verbosehalf (generic function with 1 method)

    julia> verbosehalf(42)
    That's an even number!
    21.0

    julia> verbosehalf(43)
    That's an odd number!
    21.5
    ```

    When `43` is passed as an argument, `iseven(x)` evaluates to `false`.
    And because `false && <anything>` is always false,
    that line just evaluates to false without ever getting to the `println()` call.
    But `false || <anything>` depends on the right hand statement
    (`false || true` is different than `false || false`),
    the right hand statement must be evaluated.
    
    In this case, those lines are equivalent to

    ```julia
    if iseven(x)
        println("That's an even number!")
    else
        println("That's an odd number!")
    end
    ```

    But be aware, chaining these short-circuit expressions is NOT like `if/elseif/else` since,
    regardless of the outcome of the expression, the following lines _are_ evaluated.
    Eg, if I try to write the `oddhalf()` function from above like this:

    ```julia
    function oddhalf(num)
        iseven(num) && println("That's an even number, you should get an Int, but you won't.")
        num == 42 && println("Life, the Universe, and Everything!")
        println("That's an odd number, expect a Float!")
        return num / 2
    end

    oddhalf(42)
    ```
    ```
    That's an even number, you should get an Int, but you won't.
    Life, the Universe, and Everything!
    That's an odd number, expect a Float!
    21.0
    ```

    Not exactly what we wanted...

!!! warning "Checking Questions"
    1. Referring back to our `compliment` function,
       What happens if you try to pass `"G"` as an argument
       (note the double quotes)?
       Can you explain this behavior?

    2. Evaluate `'G' == "G"` - did you expect it to be `true` or `false`?
    3. What are the types of `'G'` and `"G"`?
    4. Use the `||` operator to modify the `if`/`elseif` statements
       in your [`compliment()` function](@ref booleans) from above
       so that it works with either single-quoted or double-quoted ACGT.

       Note: you should have no more than 3 `elseif`s in your function,
       and you should always return a single-quoted version of the compliment.

## Some notes on recursion

I find recursion difficult to wrap my head around.
To be honest,
I almost told you skip those sections of chapters 5 and 6.
But I think it is valuable to encounter the concept
so that you know it exists,
even if we don't explore the concept in great detail.

In the years I've been programming,
I think I've only written 2 recursive functions.
But there are areas of biology where they can be quite valuable,
and actually easier to understand,
especially those involving phylogenetic trees or
other graph structures, such as those used in genome assembly.

In these cases, we often want to perform and action on a node,
and all the children of that node, which are also nodes,
also with children... and so on.
In fact, this is similar to how many shell programs
interact with your file system
(which is also like a tree).

But beyond noting that it has its uses,
we won't spend much time on recursive functions in this course.

