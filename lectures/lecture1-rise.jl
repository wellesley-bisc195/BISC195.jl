#nb # %% slideshow [markdown] {"slideshow": {"slide_type": "slide"}}
# # A Literate slideshow
# 
# This is some text

%% a code block [code] {"slideshow": {"slide_type": "slide"}}
function hello(x)
    println("Hello, $(x)!")
end

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "fragment"}}
# Some explanation

%% a code block [code] {"slideshow": {"slide_type": "fragment"}}
hello("Students")

#nb # %% a subslide [markdown] {"slideshow": {"slide_type": "slide"}}
# ## Wow!