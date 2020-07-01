# # Instructions for Assignment06
#
# ## Introduction
# 
# Note: this file is runnable in its current state,
# but is incomplete.
# You can run the file from the command line,
# or use the VS Code julia extension to run individual lines.

## To view additional instructions for this assignment, #jl
## see https://wellesley-bisc195.github.io/BISC195.jl/stable/Assignments/assignment06 #jl

## To view a rendered version of this document, #jl
## see https://wellesley-bisc195.github.io/BISC195.jl/stable/Assignments/assignment06_code #jl

# ## Question 1 - Reading FASTA files
# 
# A common way to interact with biological sequence data
# is in a format called [`FASTA`](https://en.wikipedia.org/wiki/FASTA_format).
# This is a very simple format, where each "record" (sequence) contains:
# 
# 1. A "header" line, always starting with `>`, that contains a description of the sequence
# 2. The sequence, which can be split across multiple lines
# 
# For example, in the `data/` directory of this assignment,
# there is a file called `cov2_genomes.fasta`,
# which contains some genome sequences of Sars-CoV2
# isolated from humans in the last month.
# Use the shell to take a look at the first 10 lines (`head`)
# of the file.
# 
# Now, let's work on building a julia function
# to help us use this file.

"""
    count_records(path)

Given a path to a `fasta` file,
counts and returns the number of records it contains.

Example
≡≡≡≡≡≡≡≡≡
    julia> count_records("data/cov2_genomes.fasta")
    10
"""
function count_records(path)
    ## Your code here.
end

# Hint - If you're having trouble, the easiest thing to do
# is probably to count lines that start with `>`.

# ## Question 2 - Split the headers
# 
# It's nice to know the number of records the file contains,
# but it's more useful to actually be able to read and store
# those records.
# 
# Let's look again at the headers for these sequences.
# This can be accomplished from the terminal using `grep`.
# The simplest way to use `grep` is with 2 arguments -
# the first argument specifies a pattern to look for,
# and the second is the path to a file (or group of files).
# 
# `grep` will then print to the screen all of the lines
# from the file that match that pattern.
# To see all of the header lines, for example,
# 
# ```sh
# $ grep '>' data/cov2_genomes.fasta
# ```
# 
# Each header has 3 components, separated by `|`
# Write a function that divides the header
# into these 3 components, and returns them as a tuple.

"""
    fasta_header(header)

Divides a fasta header into its component parts,
removing any leading or trailing spaces.

Example
≡≡≡≡≡≡≡≡≡
    julia> fasta_header(">M0002 |China|Homo sapiens")
    ("M0002", "China", "Homo sapiens")

    julia> fasta_header("AAATTC")
    Error: Invalid header (headers must start with '>')

    julia> fasta_header(">Another sequence")
    ("Another sequence",)

    julia> fasta_header(">headers| can | have| any number | of | info blocks")
    ("headers", "can", "have", "any number", "of", "info blocks")
"""
function fasta_header(header)
    startswith(header, '>') || error("Invalid header (headers must start with '>')")

    ## Your code here
end

# A couple of things to note about this function if you're strugling:
# 
# 1. Notice that, even though each header must start with a `>`,
#    the first item in the returned Tuple should not
# 2. The return item should always be a Tuple, even if there's only 1 item
# 3. The `split()` function can divide a `String` by a delimeter.
# 4. You may need to do some searching on the internet.

# ## Question 3 - parse the file
# 
# Alright - let's actually parse the file.
# For now, the easiest thing to do
# is to return two vectors, 
# one containing the parsed identifiers as tuples,
# and one containing the sequences as strings.
# 
# One thing to keep in mind
# is that the sequences in a fasta file
# can be spread out over multipl lines,
# but they'll be much easier to work with as a single string,
# so your function should have a way to join multiple lines
# (remember the `join()` function?).
# 
# I've included a few example files in the "data" directory
# with some example files to test your functions on.
# The examples in the docstring below
# assume that your working directory is the assignment directory.

"""
    function parse_fasta(path)

Reads a fasta-formated file and returns 2 vectors,
one containing parsed headers,
the other containing the entire seqence as a `String`.

Note: function does not validate DNA sequences for correctness.

Example
≡≡≡≡≡≡≡≡≡
    julia> ex1 = parse_fasta("data/ex1.fasta");

    julia> ex1 isa Tuple
    true

    julia> ex1[1]
    2-element Array{Tuple{String,String},1}:
      ("ex1.1", "easy")
      ("ex1.2", "multiline")

    julia> ex1[2]
    2-element Array{String,1}:
    "AATTATAGC"
    "CGCCCCCCAGTCGGATT"

    julia> ex2 = parse_fasta("data/ex2.fasta");

    julia> ex2[1]
    4-element Array{Tuple{String,String},1}:
      ("ex2.1", "oneper")
      ("ex2.2", "wrong")
      ("ex2.3", "wronger")
      ("ex2.4", "wrongest")
    
    julia> ex2[2]
    4-element Array{String,1}:
      "ATCCGT"
      "ATCGTGGaact"
      "ATCGTGGaact"
      "this isn't a dna string,but parse it anyway"
"""
function parse_fasta(path)
    ## Think through the components you need
    ## Does it make sense to define any containers at the beginning?
    ## How will you loop through the file?
    ## What do you need to get from each line?
end

# Tips:
# 
# 1. Build the function in parts
#    - first, see if you can build the vector of headers,
#      ignoring the sequences
#    - next, see if you can collect the sequences,
#      even if they're not joined together properly
# 2. Work on pieces of the function in the REPL.
#    Make sure each expression does what you think it does.
#    
#    For example, if you make a `for` loop to go through each line of the file,
#    add `println()` statements to check the value of each variable
#    in each loop.

# ## Question 4 - Sequence Statistics
# 
# We now have most of the pieces necessary to get some summary statistics
# of CoV2 genomes.
# Note: You may want to grab some code from previous assignments.
#
# Calculate the mean sequence length and standard deviation
# of the CoV2 geneomes in `data/cov2_genomes.fasta`.

## helper code goes here

mean_cov2_length = 0.0
std_cov2_length = 0.0

# Calculate the mean and standard deviation of GC content
# of the CoV2 genomes in `data/cov2_genomes.fasta`.
# GC content should be a number between 0 and 1.
# Note: if you already parsed the fasta file above
# and assigned the results to variables,
# there's no need to re-parse it.

## helper code goes here

mean_cov2_gc = 0.0
std_cov2_gc = 0.0

# ## Bonus Question
# 
# Write a function that will read any proper fasta file
# and returns a tuple with the mean and standard deviation
# of the sequence length and gc content.
# Using this function on `data/ex1.fasta` should return (x,x,x,x).