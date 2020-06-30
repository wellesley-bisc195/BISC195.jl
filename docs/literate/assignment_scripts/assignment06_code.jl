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

