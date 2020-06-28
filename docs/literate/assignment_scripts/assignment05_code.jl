# # Instructions for Assignment05
#
# ## Introduction
# 
# Note: this file is runnable in its current state,
# but is incomplete.
# You can run the file from the command line,
# or use the VS Code julia extension to run individual lines.

## To view additional instructions for this assignment, #jl
## see https://wellesley-bisc195.github.io/BISC195.jl/stable/Assignments/assignment05 #jl

## To view a rendered version of this document, #jl
## see https://wellesley-bisc195.github.io/BISC195.jl/stable/Assignments/assignment05_code #jl

# ## Question 1 - Dubugging Practice
#
# At the end of [Chapter 8 of _Think Julia_](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#deb08),
# there is an exercise (8-6) intended to help you debug a string traversal function.
# Below is the initial code with errors.
# Fix it up as described in the chapter.
# 
# Note: you should always be completing the exercises from the book,
# by actually writing and executing the code,
# either in a file or in the REPL.

function isreverse(word1, word2)
    if length(word1) != length(word2)
        return false
    end
    i = firstindex(word1)
    j = lastindex(word2)
    while j >= 0
        j = prevind(word2, j)
        if word1[i] != word2[j]
            return false
        end
        i = nextind(word1, i)
    end
    true
end

# ## Question 2 - Reverse complement
# 
# In Assignment03, you created a function called `complement()`,
# that took a DNA base as an argument,
# and returned its complement (`A <-> T` or `G <-> C`).
# This function does the same thing,
# using a slightly different method.
# Look it over and see if it makes sense.
# If it doesn't, try running some individual pieces in the REPL,
# But don't modify the code (or if you do, make sure you know how to get it back)

"""
    complement(base)

Get the DNA complement of the provided base:

    A <-> T
    G <-> C

Accepts uppercase or lowercase `String` or `Char`,
but always returns an uppercase `Char`.
If a valid base is not provided, the function throws an error.
"""
function complement(base)
    complements = Dict("A" => 'T',
                       "T" => 'A',
                       "G" => 'C',
                       "C" => 'G')
    
    base = uppercase(string(base))
    
    !(base in keys(complements)) && error("Invalid base $base")
    return complements[base]
end

# The "reverse complement" of a DNA sequence is valuable to know,
# since it represents the complementary sequence
# in the expected orientation (5' -> 3').
# If you haven't taken molecular biology and this sounds like gibberish,
# you may want to read up a bit on it [here](https://en.wikipedia.org/wiki/Complementarity_(molecular_biology))
#
# Now, write a function like `isreverse()` above,
# but that checks whether two sequences are the reverse AND complement
# of one another. 
# Note one other difference here - rather than returning `false`
# if the sequences are different lengths, this function should error.

"""
    isreversecomplement(seq1, seq2)

Boolean function that checks whether two DNA seqences
are the reverse complement of one another, irrespective of capitalization.
Returns true if yes, false otherwise.

If any invalid bases are encountered,
or if sequences are different length, throws an error.

Examples
≡≡≡≡≡≡≡≡≡≡

    julia> isreversecomplement("aaatttcg", "cgaaattt")
    true

    julia> if isreversecomplement("C", "A")
               println("Yes!")
           else
               println("No!")
           end
    No!

    julia> isreversecomplement("TX", "AG")
    Error: Invalid base X

    julia> isreversecomplement("G", "CC")
    Error: Cannot compare sequuences of different length
"""
function isreversecomplement(seq1, seq2)
    ## your code here
end

# ## Question 3
# 
# Now let's work on creating a function that _makes_ the reverse complement of a sequence,
# instead of just checking it. 
# First, it's probably helpful to know that julia has a built in `reverse()` function
# that can take a `String` or `Vector` and return it with the indecies reversed.
# 
# ```julia
# julia> reverse([4,3,2,1])
# 4-element Array{Int64,1}:
#  1
#  2
#  3
#  4
# 
# julia> reverse("beep boop")
# "poob peeb"
# ```
# 
# Now, create a function that takes a sequence
# and returns the reverse complement.
# The easiest way to do this is probably to perform a "map"
# of the `complement()` function to each character in the sequence,
# then reverse it (or reverse, then map). 
# You can write the mapping by hand as in the book,
# or use `map()` as described in the lesson.

"""
    reverse_complement(sequence)

Takes a DNA sequence and returns the reverse complement
of that sequence.

Takes lowercase or uppercase sequences,
but always returns uppercase.

Examples
≡≡≡≡≡≡≡≡≡≡
    julia> reverse_complement("AAATTT")
    "AAATTT"

    julia> reverse_complement("GCAT")
    "ATGC"

    julia> rc = reverse_complement("TTGGG");

    julia> println(rc)
    CCCAA
"""
function reverse_complement(sequence)
    ## your code here
end

# ## Question 4a
# 
# [Chapter 9](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#reading_word_lists)
# begins to describe how to work with files.
# The file `words.txt` from _Think Julia_ is in the `data/` directory of the assignment repository.
# First, look at the file from the shell (not a julia REPL)
# using the `head` command.
# 
# ```sh
# $ head data/words.txt
# ```
# 
# By default, `head` prints the first 10 lines.
# How can you change this behavior to show the first 15 lines?
# (Hint: you may need a search engine).
# Put the *shell command* to show the first 15 words of `data/words.txt`
# in a String assigned to the variable `first15`

first15 = "#= put shell command here =#"

# ## Question 4b
# 
# What about the shell command to view the last 15 lines of `data/words.txt`?
# Put this command in a string assigned to the variable `last15`

last15 = "#= put shell command here =#"

# ## Question 5
# 
# Write a function that reads through the words in a file
# with a `for` loop and returns an array with only the words
# that are valid DNA sequences.
# Note: there may be one or more functions from previous Assignments
# that are useful to reuse here.

"""
    find_dna(file)

In a file with one word per line,
returns an array with all words that are valid DNA sequences
(that is, they contain only a, t, g, or c).

Words may be upper- or lowercase,
but returned array will contain only uppercase letters.

Example
≡≡≡≡≡≡≡≡≡
    julia> find_dna("data/words.txt") # assumes you're in Assignment05 directory
    13-element Array{Any,1}:
      "AA"
      "ACT"
      "ACTA"
      "AGA"
      "AT"
      "CAT"
      "GAG"
      "GAGA"
      "GAT"
      "TA"
      "TACT"
      "TAG"
      "TAT"
"""
function find_dna(file)
    ## 1. You probably want to make an empty array
    
    for line in eachline(file)
        ## if the line is valid dna, put it in the array
    end
end