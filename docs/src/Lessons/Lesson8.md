# Lesson 8 - Putting it all together

[![Assignment 08 - Description](https://img.shields.io/badge/08-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment08)
[![Assignment 08 - Due](https://img.shields.io/badge/Due-7%2F14%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment08)

**Assignments** - This lesson is complete when students have:

- Read [Chapter 15](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap15)
  and [Chapter 16](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap16)
  of Think Julia.
- Run all code examples from Lesson 8 on their own computers
- Cloned the Assignment 7 repository with github classroom.
- Completed assignment 7 with all tests passing.

_Book correction_: in the section of chapter 16
[on modifiers](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#modifiers),
the book write a function that is supposed to update a field
of an immutable struct,
so it will throw an error.
You can fix this by making `MyTime` a mutable struct,
or by returning a new instance of `MyTime`.
If you do the later, the function signature
should not have `!`.

(This issue has [already been reported](https://github.com/BenLauwens/ThinkJulia.jl/issues/35) to the book author)

## Development and analysis workflows for scientific computing

Up until now, we have primarily been writing code
that's intended to be re-used.
Code that is well-designed, tested to ensure it functions as intended,
and generic enough to be used in many situations
is an important part of scientific computing.
This kind of code should generally be put into a package.

But this is not the only kind of code.

Often times, we also want to analyze a specific dataset,
perform statistical tests, make plots, etc.
In these cases,
we typically want to include code along with plain-english explanations,
and 
