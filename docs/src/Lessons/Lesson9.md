# Lesson 9 - Types and methods

[![Assignment 09 - Description](https://img.shields.io/badge/09-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment09)
[![Assignment 09 - Due](https://img.shields.io/badge/Due-7%2F20%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment09)

**Assignments** - This lesson is complete when students have:

- Read [Chapter 17](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap17)
  and [Chapter 18](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap18)
  of Think Julia.
- Run all code examples from Lesson 9 on their own computers
- Cloned the Assignment 9 repository with github classroom.
- Completed assignment 9 with all tests passing.

## Types can be scary (but don't have to be)

The first programming language I learned was python,
which has a very lax relationship with types.
When I first started learning julia,
seeing types everywhere freaked me out a little bit.

One bit of good news is that, most of the time,
you don't need to worry _too_ much about types to write julia code.
As you've seen, beyond knowing that things like `split()`
only work on strings,
or seeing a `MethodError` and needing to know what that means,
mostly you can write functions without specifying argument types
and you can get a lot done with built-in types.

But knowing a little bit about types
can lead to simpler and clearer code
and can help you debug problems more easily.
But if it's not immediately obvious how to use types,
or the syntax is a bit clumsy for a bit, that's fine.
It's useful to know this tool exists,
but you don't need to use it all the time.

## Functions vs Methods

As you've seen, a function is an action performed on data.
Most functions have names,
like `length()` or `gc_content()`,
But when you call a function,
what is actually executed is a specific "_method_"
of that function.
That is, a version of the function
that depends on the types of its methods.

When you first define a function,
it only has one method (the one you just defined).

```julia
julia> function somefunc(x)
           println("Fallback method!")
       end
somefunc (generic function with 1 method)
```

But in julia, the same function **name**
can refer to many methods,
with different argument types,
and even different numbers of arguments.

```julia
julia> function somefunc(x::Number)
           println("Number method!!")
       end
somefunc (generic function with 2 methods)

julia> function somefunc(x::AbstractString)
           println("AbstractString method!!")
       end
somefunc (generic function with 3 methods)

julia> function somefunc(x,y)
           println("Two argument method!!")
       end
somefunc (generic function with 4 methods)

julia> somefunc(2.3)
Number method!!

julia> somefunc("woo!")
AbstractString method!!

julia> somefunc([])
Fallback method!

julia> somefunc(1.0, "hey!")
Two argument method!!
```