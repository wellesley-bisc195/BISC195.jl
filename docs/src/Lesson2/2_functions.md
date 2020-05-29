# Functions

Before continuing,
be sure to read 
[chapter 3](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap03)

Functions are the parts of a program that do things.
Without functions, all you have is data.
Actually, most of the time if you want data,
you need functions too,
unless you're writing literally everything by hand.

## Recognizing functions

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
In julia, `1 + 1` is just a convenient syntax for `+(1,1)`

```@repl
+(42,7)
*("BISC", "195")
```

When you do even simple things like type something in the REPL,
there are functions being called
to evaluate the expression and print the result.

## Variables, arguments, and scope

In chapter 3 of _Think Julia_, you read that
[variables and parameters are local](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#_variables_and_parameters_are_local)
to functions. 

The more technical way to say that is that the inside of functions
have their own "scope"[^1].
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

We could also have passed a _variable_ as arguments.

```@example args
gb = "Goodbye"

newprint(gb)
```

Inside of `newprint()`, whatever _value_ was passed as the argument
will be substituted everywhere that `my_arg` lives in the function.

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
we're passing `"Huzzah"` as the argument.
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
it's usually a good idea to name your function areguments
and your function arguments different things. 

!!! tip
    Just to reiterate,
    use differentt names for variables that refer to data
    and function arguments.

    And typically, it's also good practice to make your code "self-documenting",
    which means that the names of functions, variables, and arguments
    tells you something about what they're used for.

## Practice

The following examples are intended to reinforce and extend what you've learned.
In many cases, they are intended to expose behavior that may be unintuitive,
or lead to errors that are worth understanding.

!!! warning "Checking Questions"
    1. 

[^1]: **Scope** - The region of a program in which assigned variables are available.
      In julia, scopes tend to be much more restrictive by default than in other languages.
      If you ever get an `UndefVarError` when you think that you've actually defined the variable,
      it's probably not in the right scope. 