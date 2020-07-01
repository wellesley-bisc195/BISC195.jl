#nb # %% slideshow [markdown] {"slideshow": {"slide_type": "slide"}}
#md # # [Lecture 6 - Puzzle time! (Regular Expressions)](@id lecture6)
#!md # # Lecture 6 - Puzzle time! (Regular Expressions)
#
# **Essential Skills For Computational Biology**  
#
# *2020-06-30*  
#
# Kevin Bonham, PhD

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## Strings contain patterns
# 
# Here's a typical list of files from a DNA sequencing run:

sequences = [
    "C0005-3F_L001_R1_001.fastq.gz",
    "C0005-3F_L001_R2_001.fastq.gz",
    "C0005-3F_L002_R1_001.fastq.gz",
    "C0005-3F_L002_R2_001.fastq.gz",
    "C0016-3E_L001_R1_001.fastq.gz",
    "C0016-3E_L001_R2_001.fastq.gz",
    "C0016-3E_L002_R1_001.fastq.gz",
    "C0016-3E_L002_R2_001.fastq.gz",
]

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ##Simple Patterns:
# 
# - `abc` matches literal "abc"
# - `[abc]` matches any one of `a`, `b`, or `c`
# - `[^abc]` matches any character _except_ `a`, `b`, or `c`
# - `[a-z0-9]` matches any lowercase letter or digit

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# Puzzle: https://regexr.com/57ijc

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ##Repeating Patterns:
# 
# - `+` matches 1 or more of a pattern
#   - eg. `[0-9]+` matches one or more digits
# - `*` matches 0 or more of a pattern
# - `?` matches 0 or 1 of a pattern
# - `{N}` matches `N` of a pattern
#   - eg. `[abcdr]{4}` matches `abra` and `cada`, but not `abracadabra`
#   - Can also to ranges; `{2,4}` matches 2 to 4, `{3,}` is 3 or more

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# Puzzle: https://regexr.com/57ik4

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Special Patterns:
# 
# - `.` matches any character, except a new line
# - `\w` matches any word character (same as `[A-Za-z0-9_]`)
# - `\d` matches any digit (same as `[0-9]`)
# - `\s` matches any whitespace (space, tab, newline, etc)
# - If you need to match a character that is otherwise special,
#   "escape" it with `\`
#   - eg. to match a literal period, `\.`

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# Puzzles: 
# - https://regexr.com/57ikd
# - https://regexr.com/57ikg

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## More fun with regular Expressions
# 
# - Use the regexr cheatsheet (or find another one - they're all over)
#   - There are _a lot_ more patterns that can be used
# - https://regexcrossword.com/
# - My most complicated regex to date: 

# ```
# ^([`~]{3,})(?:(?:(?:\\{|\\{\\.|)(julia)(?:;|))|(@(docs|autodocs|ref|meta|index|content|example|repl|eval|setup|raw)))\\s*(?:.*?)(\\}|)\\s*$
# ```

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# > Some people, when confronted with a problem, think "I know, I'll use regular expressions." Now they have two problems. 

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ![xkcd regex](https://imgs.xkcd.com/comics/regular_expressions.png)

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## Regular expressions in julia

for seq in sequences
    m = match(r"^([MC]\d+\-[0-9][EF])_L00.+fastq\.gz", seq)
    println(m.captures[1])
end