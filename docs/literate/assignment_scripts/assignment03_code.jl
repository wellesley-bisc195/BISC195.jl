# # Instructions for Assignment03
#
# ## Introduction
# 
# Note: this file is runnable in its current state,
# but is incomplete.
# You can run the file from the command line,
# or use the VS Code julia extension to run individual lines.

## To view additional instructions for this assignment, #jl
## see https://wellesley-bisc195.github.io/BISC195.jl/stable/Assignments/assignment03.html #jl

## To view a rendered version of this document, #jl
## see https://wellesley-bisc195.github.io/BISC195.jl/stable/Assignments/assignment03_code.html #jl

# ## Writing real Code
# 
# In assignments 1 and 2, variable and function names
# were often things like `question1` and `question2`.
# From now on, we'll use more informative function and variable names
# so that our code is "self documenting."
# 
# We'll also continue to use doc strings to help understand
# the specifications required for our functions.

# ## Understanding DNA sequences
# 
# We've already done a fair amount of work in assignment 2
# and in lesson 3 to make some functions for understanding DNA sequences.
# Below, I've put a couple of function signatures with docstrings,
# but you can (and should!) copy the necessary functionality
# out of the functions you've already defined, if applicable.
# 
# !!! tip
#     If you defined those functions in the julia REPL,
#     you can go find them from the command line or the julia REPL!
#     In VS Code, open ~/.julia/logs/repl_history.jl.

# ## Question 1 - a `compliment` function

"""
    compliment(base)

Get the DNA compliment of the provided base:

    A <-> T
    G <-> C

Accepts `String` or `Char`, but always returns `Char`.
If a valid base is not provided, the function throws an error.

Examples
≡≡≡≡≡≡≡≡≡≡
    
    julia> compliment('A')
    'T'

    julia> compliment("G")
    'C'

    julia> compliment("T")
    'A'

    julia> compliment('C')
    'G'
"""
function compliment(base)
    ## See Lesson 3 for more info
end

# ## Question 2 - some boolean functions

"""
    ispurine(base)

A boolean function that returns `true` if the base is a purine (A or G)
and `false` if it is not.
The function only supports bases A, C, G, and T (throws an error for other values).
Accepts `String` or `Char`.

Examples
=========

    julia> ispurine('A')
    true

    julia> ispurine("C")
    false

    julia> ispurine('B')
    Error: "Base B not supported")
"""
function ispurine(base)
    ## We haven't made this before, but you should have all the pieces
end

"""
    ispyrimidine(base)

A boolean function that returns `true` if the base is a pyrimidine (C or T)
and `false` if it is not.
The function only supports bases A, C, G, and T (throws an error for other values).
Accepts `String` or `Char`.

Examples
=========

    julia> ispyrimidine('G')
    false

    julia> ispyrimidine("T")
    true

    julia> ispyrimidine('X')
    Error: "Base X not supported"
"""
function ispyrimidine(base)
    ## This is the strict opposite of `ispurine`.
    ## In principle, you can write this in one line - remember `!` means `NOT`.
    ## Eg `isuppercase(x)` means the same thing as `!islowercase(x)`
end

# ## Question 3 - Using boolean functions for composition
#
# For the following function, you should not need to re-write
# the logic checking what kind of base this is.
# You've already written it, and it's in a convenient function!
#
# A big part of programming is re-use;
# if you find yourself writing the same code multiple times,
# you should probably put it in a function and call that instead!

"""
    base_type(base)

Determines whether a base is a purine (A or G) or pyrimidine (T or C),
and returns a `String`.

Examples
≡≡≡≡≡≡≡≡≡≡

    julia> base_type("G")
    "purine"

    julia> base_type('C')
    "pyrimidine"

    julia> base_type('Z')
    Error: "Base Z not supported"

    julia> x = base_type('A'); println(x)
    purine
"""
function base_type(base)
    ## Note: this is different than the `base_type()` we defined in the lesson.
    ## Here, we want a fruitful function that returns the value rather than `print`ing it.
    ## Also, there's no need to re-write the logic. If your `ispurine` / `ispyrimidine` functions work,
    ## you can use them here.
end

# ## Question 4 - Modifying arguments instead of adding a bunch of logic
# 
# One thing that none of our functions can do so far
# is to accept lowercase sequences.
# Most of the time, DNA sequences are written with uppercase letters,
# but we may not be able to count on that.
# 
# If we want to be able to accept lowercase strings,
# one possibility would be to add additional logic, Eg
# 
# `if base == 'G' || base == "G" || base = 'g' || base == "g"`
# 
# But that's a lot of typing -
# especially considering we'd have to do this for every base!
# In programming, it's OK to be lazy (in fact, it's often better)!
# Instead, we can modify the parameters to be formatted the way we expect.
# For example, the `uppercase()` function takes a `String` or `Char`
# and returns the uppercase representation of it.
#
# ```julia
# julia> uppercase('a')
# 'A': ASCII/Unicode U+0041 (category Lu: Letter, uppercase)
# 
# julia> uppercase("attc")
# "ATTC"
# ```
#
# Note that, if you simply use this function on a variable or parameter,
# it will remain unchanged (the function doesn't "mutate" its argument),
# but you can re-assign the variable or parameter.
#
# ```julia
# julia> seq = "attcgc"
# "attcgc"

# julia> uppercase(seq)
# "ATTCGC"

# julia> seq
# "attcgc"

# julia> seq = uppercase(seq)
# "ATTCGC"

# julia> seq
# "ATTCGC"
# ```
#
# Some julia functions *can* mutate their aruments -
# we'll encounter some of those soon.

"""
    gc_content(sequence)

Calculates the GC ratio of a DNA sequence.
The GC ratio is the total number of G and C bases divided by the total length of the sequence.
For more info about GC content, see here:

Example
≡≡≡≡≡≡≡≡≡≡

    julia> gc_content("AATG")
    0.25

    julia> gc_content("cccggg") * 100
    100.0

    julia> gc_content("ATta")
    0.0
"""
function gc_content(sequence)
    ## Start with the same code as `question3()` from assignment 2.
    ## only a small modification is necessary to make this work.
end

# ## Question 5 - Incremental development
# 
# Now that you've learned how to do this,
# go back and modify the functions defined in questions 1-3
# so that they are able to take lowercase arguments.
# You should not copy the code below this line to modify it,
# you should modify it in-place.

