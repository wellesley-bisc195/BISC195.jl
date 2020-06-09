#nb # %% slideshow [markdown] {"slideshow": {"slide_type": "slide"}}
#md # # [Lecture 1 - Getting Started](@id lecture1)
#!md # # [Lecture 1 - Getting Started]
# 
# **Essential Skills For Computational Biology**  
#
# *2020-06-08*  
#
# Kevin Bonham, PhD

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Learning Objectives
# After completing this lesson, students will be able to:
# - Navigate their computer's file system using a command line interface
# - Use a plain text editor (VS Code) to modify source code
# - Clone, commit to, and push from a git repository

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## What is a computer program?

#nb %% A slide [code] {"slideshow": {"slide_type": "fragment"}}
function hello(x)
    println("Hello, $(x)!")
end
#-
#nb %% a code block [code] {"slideshow": {"slide_type": "fragment"}}
hello("Students")

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Programs are just things and actions

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - "Things" in computer code are data

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - "Actions" are generally called "functions"

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - Real life is filled with programs

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Computer programs are just things and actions

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - Computer languages are procedural

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - Computer languages are literal

#nb %% a subslide [code] {"slideshow": {"slide_type": "fragment"}}
42 / 2
#-
#nb %% a subslide [code] {"slideshow": {"slide_type": "fragment"}}
## 5 + "2"

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## What are "essential" skills?

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - How do I think about writing a computer program?

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - When the code I've written has an error, what steps do I take to debug it?

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - How do I keep track of the code that I've written?

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - How do I get help when I'm stuck?

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## Course components

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - Readings and exercises from [_Think Julia_](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html)
# ![think julia](https://imgur.com/yGSTdQe.png)

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# - Reading and exercises from [BISC195 docs](https://wellesley-bisc195.github.io/BISC195.jl/dev/)
# ![BISC195 website](https://imgur.com/9AgXhjP.png)

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# - Problem sets on github classroom
# ![Assignment 01](https://imgur.com/Tb7BLuy.png)

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Grading
# ![Assignment 01](https://i.imgur.com/AM6tw55.jpg)

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Assignments

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - There will be ~10 "Assignments," delivered on github classroom

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - All assignments will be worth the same amount

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - All assignments will have automated "unit tests" that will help you complete them

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# - All assignments will have "due dates" to help keep you up with course material,
#   but you will still get full credit for anything turned in by the end of the term.

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Course Schedule
#
# **Dates**: June 8 - July 17, 2020
# 
# **Lecture**: Tu/Th 10-11am - Reserved for lecture
# 
# **Office hours / lab**:  
# - M/W 10am-12pm
# - Tu/Th 1-3pm

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "fragment"}}
# **All students are expected to attend lecture**
# 
# **All students should be able to come to at least two lab periods**

#nb # %% A slide [markdown] {"slideshow": {"slide_type": "subslide"}}
# ## Let's get started!
#
# - Course bible: https://wellesley-bisc195.github.io/BISC195.jl/stable/
# - [Lesson 1 - Getting Started](https://wellesley-bisc195.github.io/BISC195.jl/stable/Lessons/Lesson1/)