# Lesson 3 - Functions, conditions, recursion, Oh My!

[![Assignment 03 - Invitation](https://img.shields.io/badge/Assignment03-Repository-blue?style=for-the-badge&logo=open%20badges)](#)
[![Assignment 03 - Description](https://img.shields.io/badge/03-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment03)
[![Assignment 03 - Rendered](https://img.shields.io/badge/03-Script-blue?style=for-the-badge&logo=open%20badges)](@ref Instructions-for-Assignment03)
[![Assignment 03 - Due](https://img.shields.io/badge/Due-6%2F19%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment03)

## Learning objectives

**Concepts** - After completing this lesson, students will be able to:

- Distinguish fruitful functions from void functions
- Recognize boolean values and conditional statments
- Recognize errors resulting resulting from functions expecting boolean values

**Skills** - After completing this lesson, students will be able to:

- Write boolean functions to check the properties of numerical values
- Use alternative evaluation execute different funuctions depending on input
- Recognize recursive functions,
  and identify situations in which they might be useful

**Assignments** - This lesson is complete when students have:

- Read [Chapter 5](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap05)
  and [Chapter 6](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap0)
  of Think Julia.
- Cloned the Assignment 3 repository with github classroom.
- Completed assignment 3 with all tests passing.
- Run all code examples from Lesson 2 on their own computers

## Expanding the repetoire of functions

We can build some useful functions with only the components we've discussed so far,
but they would be somewhat limited.
Let's work on expanding our repertoire
with conditional execution, loops, and recursion.

The following sections assume that you have read
[chapter 5](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap05) and
[chapter 6](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap06)
in _Think Julia_.
You can do chapter 4 if you like
(it lets you play with 🐢's - it's fun!),
but that's not required for now.

### Computer logic - Booleans

All computers are build on boolean (true/false) logic. 
At it's core, the two compoents of computer programs
(data and actions) are composed from "bits",
which are physical objects that can have 2 states,
`0` or `1`, `off` or `on`, `false` or `true`,
and [logical operators](https://en.wikipedia.org/wiki/Logic_gate#Truth_tables).

But we don't need to understand the all the details of how this works at a low-level
(I certainly don't)
to effectively use boolean operations in our code.
There are a couple of things to keep in mind.

As you read in _Think Julia_,