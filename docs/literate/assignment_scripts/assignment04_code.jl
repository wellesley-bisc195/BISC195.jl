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

Examples  
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
# Be sure that you've read the sections of Lesson 4
# on kmers and dictionaries before attempting the following questions.
# 
# What we'd like to do is to get a count of all of the unique kmers in a DNA sequence
# But we can't simply generate all possible kmers
# (there are too many for even small-ish values of k).
# 
# ### Question 4
# 
# Let's think of the process in pseudocode,
# a plain-language high-level description of what we want to happen.
# Here, `sequence` represents some DNA sequence,
# and `k` is an integer representing the length of each kmer.
# 
# ```
# make a dictionary to store kmers
# for each base in sequence
#   get a kmer of the base and the next (k-1) bases
#   make sure the kmer is a valid DNA sequence 
#   if this kmer is a key the dictionary
#       add 1 to the value referenced by that kmer
#   otherwise
#       make a new entry in the dictionary with a value of 1
# ```

"""
   kmercount(sequence, k)

Finds all kmers in a sequence,
returning a dictionary of those kmers
and the number of times they appear in the sequence.

Examples
≡≡≡≡≡≡≡≡≡≡

    julia> kmercount("ggg", 3)
    Dict{Any,Any} with 1 entry:
    "GGG" => 1

    julia> kmercount("ATATATATA", 4)
    Dict{Any,Any} with 2 entries:
    "TATA" => 3
    "ATAT" => 3

    julia> kmercount("ATATATATAx", 4)
    ERROR: Invalid base X encountered

    julia> kmercount("A", 2)
    ERROR: k must be a positive integer less than the length of the sequence
"""
function  kmercount(sequence, k)
    1 <= k <= length(sequence) || error("k must be a positive integer less than the length of the sequence")
    kmers = Dict() # initialize dictionary
    
    # We're going to loop through the string with numerical index,
    # each time grabbing the bases at position i through i+k-1.
    # What is the last index that we should search?    
    stopindex = 0

    for i in 1:stopindex
        kmer = "" # Change to index the sequence from i to i+k-1
        kmer = normalizeDNA(kmer) 
        #   if this kmer is a key the dictionary
        #       add 1 to the value referenced by that kmer
        #   otherwise
        #       make a new entry in the dictionary with a value of 1

    end
    return kmers
end