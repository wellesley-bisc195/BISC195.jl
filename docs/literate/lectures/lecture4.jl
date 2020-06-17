#nb # %% slideshow [markdown] {"slideshow": {"slide_type": "slide"}}
#md # # [Lecture 4 - Scope and Fruitful Functions](@id lecture4)
#!md # # Lecture 4 - Scope and Fruitful Functions
#
# **Essential Skills For Computational Biology**  
#
# *2020-06-16*  
#
# Kevin Bonham, PhD

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## "Scope" is where references live
# 
# - A reference is a human-readable name for data or action
#   - eg. a variable, argument, or function name
# - All references have scope
#   - sometimes the scope is "global" (available everywhere)
#   - sometimes the scope is narrow (eg. inside a loop)
# - In different scopes, the same name may reference different things

#nb %% A slide [code] {"slideshow": {"slide_type": "subslide"}}
i = 3

for i in 1:5
    print(i, " ")
end

#-
#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}
i

#-
#nb %% A slide [code] {"slideshow": {"slide_type": "subslide"}}
myvar = "Green eggs"
function ham(myvar)
    myvar = "ham"
    return myvar
end

#-
#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}
myvar

#-
#nb %% A slide [code] {"slideshow": {"slide_type": "subslide"}}
function decrement4()
    j = 4
    while j > 0
        print(j, " ")
        j = j - 1
    end
    return j
end
decrement4()

#-
#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}

## copy to REPL
j = 4

while j > 0
    print(j, " ")
    j = j - 1
end

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## Fruitful functions and the perils of printing
#
# - returned values are printed in the REPL
# - printed values are not (necessarily) returned

#nb %% A slide [code] {"slideshow": {"slide_type": "subslide"}}

function verbose(thing)
    println(thing)
    return thing
end
#-
#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}
verbose(true)
#-
#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}
verbose(1)
verbose(2)
verbose(3)
#-
#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}
verbose("woah");

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## A reminder: I make mistakes
# 
# - Several people have encountered tests that failed even
#   though they had correct answers
# - Don't bang your head against the wall (for too long)
# - We will still make you work for it
# - Not all difficulty is desirable

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## One other reminder: Helping eachother is ok

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# ### (Just don't copy-paste code from one another)

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Final project ideas
#
# - COVID data analysis
# - SARS-CoV2 evolution / strain analysis
# - Police violence data analysis
# - Your idea here
