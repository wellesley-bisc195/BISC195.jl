# # Instructions for Assignment04
#
# ## Introduction
# 
# Note: this file is runnable in its current state,
# but is incomplete.
# You can run the file from the command line,
# or use the VS Code julia extension to run individual lines.

## To view additional instructions for this assignment, #jl
## see https://wellesley-bisc195.github.io/BISC195.jl/stable/Assignments/assignment04.html #jl

## To view a rendered version of this document, #jl
## see https://wellesley-bisc195.github.io/BISC195.jl/stable/Assignments/assignment04_code.html #jl

# ## Base Composition
# 
# We've already seen how to calculate GC content of a DNA sequence
# but sometimes it might be useful to have more information
# about the overall base composition.
# To do this, we can loop through a DNA sequence
# and count each type of base as it occurs.
# 
# But first, let's write a "helper" function
# that does some work to make sure that sequences
# are normalized into a particular form.
# In particular, we'll make sure they're allways uppercase,
# are `String`s rather than `Char`s,
# and don't contain any invalid bases.
# Note: you can convert a `Char` to a `String` with `string(c)`.
#
# ### Question 1

"""
    normalizeDNA(sequence)

Normalizes DNA sequences or bases to uppercase `String`s. 
Throws an error if invalid bases are encountered.

Examples
≡≡≡≡≡≡≡≡≡≡
    julia> normalizeDNA("aaatg")
    "AAATG"

    julia> normalizeDNA("XTG")
    ERROR: Invalid base X encountered

    julia> normalizeDNA(5)
    ERROR: Invalid base 5 encountered

    julia> normalizeDNA('G')
    "G"

    julia> b = normalizeDNA('G');

    julia> typeof(b)
    String
"""
function normalizeDNA(sequence)
    # 1. make sequence into a String
    # 2. make sequence uppercase

    for base in sequence
        if !occursin(base, "ACGT")
            error("Invalid base $base encountered")
        end
    end

    # return the normalized sequence
end

# ### Question 2
# 
# Now, we should be able to set `sequence = normalizeDNA(sequence)`
# in all of our other functions, and never worry about the form of the input.
# 
# The following function returns a `Tuple`,
# which is an immutable structure that contains multiple values.

"""
    basecomposition(sequence)

Counts the number of each type of base
in a DNA sequence and returns a tuple those counts
in the order A, C, G, T

Examples
≡≡≡≡≡≡≡≡≡≡
    julia> basecomposition("AATCGGG")
    (2, 1, 3, 1)

    julia> basecomposition('C')
    (0, 1, 0, 0)

    julia> A,C,G,T = basecomposition("accgggtttt")
    (1, 2, 3, 4)

    julia> A
    1

    julia> T
    4

    julia> basecomposition("BACCGGGTTTT")
    ERROR: Invalid base B encountered    
"""
function basecomposition(sequence)
    sequence = normalizeDNA(sequence) # make uppercase string, check invalid bases
    a = c = g = t = 0 # sets all 4 variables to `0`

    for base in sequence
        # add 1 to each base as it occurs
    end
    
    return a,c,g,t
end

# Hint: If all of your base counts are zeros, 
# What's the type of `base` as you loop through a `String`?

# ### Question 3
#
# Now let's rewrite our `gc_content()` function from Assignment03
# using our `basecomposition()` function.
# This one has the same docstring,
# but should require substantially less code.

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

    julia> gc_content("ATty")
    Error: Invalid base Y encountered
"""
function gc_content(sequence)
    # Be sure to use `basecomposition()` in your answer.
    # Note: Since `basecomposition()` already calls `normalizeDNA`,
    # there's no need to call it here.
end

# ## Kmer Composition
#
# Be sure that you've read the Kmer section
# of Lesson 4 before attempting this question.