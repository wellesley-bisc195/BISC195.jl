#nb # %% slideshow [markdown] {"slideshow": {"slide_type": "slide"}}
#md # # [Lecture 5 - Container types and indexing](@id lecture5)
#!md # # Lecture 5 - Container types and indexing
#
# **Essential Skills For Computational Biology**  
#
# *2020-06-16*  
#
# Kevin Bonham, PhD

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## Scalars and Containers

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - A "scalar" is a singular value

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - Most of the types you've seen so far are scalars
#   - Eg. `Float64`, `Int64`, `Bool`, `Char`

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - There are also many container types, which store multiple values

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - Containers can usually be accessed by an "index"

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## A Tuple is a simple, ordered container

my_tuple = (1, 1.2, "a string")

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# Each position has an integer index, 
# 1 for the first position, 2 for the second, and so on
my_tuple[1]
#-
my_tuple[3]

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Attempting to access an index that doesn't exist is an error
length(my_tuple)
#-
my_tuple[4]

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## A Vector is a mutable, ordered container
# 
# Vectors can by easily created with `[` and `]`

#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}
my_vector = [1,3,5,7]

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# Each position has an integer index, 
# 1 for the first position, 2 for the second, and so on

#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}
my_vector[1]
#-
my_vector[2]

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Add to the end of a `Vector` with `push!()`

#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}
push!(my_vector, 50);
#-
my_vector

#nb %% A slide [code] {"slideshow": {"slide_type": "subslide"}}
other_vector = [] ## an empty vector
for i in 1:2:10
    push!(other_vector, i)
end
#-
other_vector

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Change the value of a vector by assignment (`=`)

#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}
my_vector[1] = 42;
#-
my_vector

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Index a "slice" with a range
my_vector
#-
my_vector[2:4]

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Attempting to access an index that doesn't exist is an error
length(my_vector)
#-
my_vector[6]

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# # Dictionaries are containers with "key" => "value" pairs
# 
# - Keys can be any scalar type
# - Keys are used as indexes
# - Values can be scalars or other containers
# - Keys are unordered

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Create a Dictionary with `Dict()`
my_dict = Dict("key1"=> 42, "key2"=> 1.8, 5=> "a value")

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## The keys are used to index
my_dict["key1"]
#-
my_dict[5]

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Values can be reassigned
my_dict["key1"] = 3.14

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Attempting to access with a key that doesn't exist is an error
my_dict["I don't exist"]

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# But you can assign a new key-value pair
my_dict["I don't exist... yet"] = "Now I do!"
#-
my_dict["I don't exist... yet"]

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# You can use `haskey()` (a Boolean function) to see if a dictionary already has a key
haskey(my_dict, "key1")
#-
haskey(my_dict, "key1000")

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# # Questions?
