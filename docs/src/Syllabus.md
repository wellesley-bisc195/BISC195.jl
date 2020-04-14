# Syllabus

## Course Info

Course Code: BISC 195  
Course Title: Essential Skills for Computational Biology

### Instructor
|                   |                        |
| :---------------- | :--------------------: |
| **Instructor:**   | Kevin Bonham, PhD      |
| **email:**        | kbonham@wellesley.edu  |
| **Github:**       | kescobo                |
| **Office Hours:** | TBD                    |

### Course Run Info

TBD
<!-- TODO: add class schedule etc -->

## Description

Modern biology depends on computing.
At the same time, many biologists are intimidated by the prospect of programming.
In an era of high-throughput assays
and datasets with thousands of samples containing millions of molecular sequences,
a basic knowledge of computational methods is critical.
Many tools for analyzing vast quantities of molecular data have only command-line interfaces,
and performing statistical tests or plotting these large datasets
is impossible with excel or other software with a graphical user interface.
This course will provide an introduction to essential computational techniques
for biological data analysis using a modern programming language,
focusing on strategies for solving problems rather than specific syntax.

### Learning Objectives

After completing this course, students will be able to:

- Navigate their computer and manipulate files using a command line interface.
- Write a script to perform statistical analyses on and plot a large numerical dataset.
- Find, download, and process large biological sequence datasets from an online source.
- Search for a solution to a novel error or software bug and implement it in code.
- Use a version control system to keep track of changes to their code.

### Prerequisites

This course is an introduction to programming,
but examples will be rooted in molecular and evolutionary biology problems.
Students without prior coursework in biology should be able to succeed with additional effort.

Recommended: Molecular and/or Cell Biology.

### Course Materials

Online textbook (free)

[Think Julia: How to think like a computer scientist](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html)

[Lessons and code repositories](#) <!-- TODO: Add link -->

## Course Schedule

### Lesson 1: Getting Started

[Lesson repository](#)

#### Learning Objectives

**Concepts** - After completing this lesson, students will be able to:

- Compare and contrast computer code meaning and syntax
- Identify common "algorithms" used in their daily lives

**Skills** - After completing this lesson, students will be able to:

- Navigate their computer's file system using a command line interface
- Clone, commit to, and push from a git repository
- Use the `julia` REPL to do basic arithmatic

**Assignments** - This lesson is complete when students have:

- Completed the BISC195 entrance survey
- Completed the BISC195 pretest
- Read the [Preface](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#_preface)
  and [Chapter 1](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap01)
  of Think Julia
- Installed visual studio code and julia on their computers
  - Windows users should also have installed Windows Terminal
- Run all code examples from Lesson 1 on their own computers


### Lesson 2: Types of data, operations on data

[Lesson repository](#)

#### Learning Objectives

**Concepts** - After completing this lesson, students will be able to:

- Distinguish between variables and function arguments
- Identify functions that operate on or modify data
- Compare and contrast common scalar and container data types
- Recognize errors resulting from using functions on datatypes
  that do not have appropriate methods

**Skills** - After completing this lesson, students will be able to:

- Use a plain text editor (VS Code) to modify source code
- Execute functions on different types of arguments in the `julia` REPL
- Use print statements and type introspection methods to
  investigate a data type
- Assign, modify, and copy variables
- Use github and github CI to check answers to homework

**Assignments** - This lesson is complete when students have:

- Read [Chapter 2](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap02)
  and [Chapter 3](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap03)
  of Think Julia.
- Cloned the Assignment 2 repository with github classroom.
- Completed assignment 2 with all tests passing.


### Lesson 3: "Hello, World!" Writing your first program

[Lesson repository](#)

#### Learning Objectives

**Concepts** - After completing this lesson, students will be able to:

- Compare and contrast plain text, code, and scripts.
- Distinguish git remotes and branches.
- Recognize and solve errors associated with missing or incomplete files.
- Identify uses of loops and comprehensions

**Skills** - After completing this lesson, students will be able to:

- Write julia code in a file, and execute it interactively with VS Code.
- Call a julia script from the command line.
- Include julia code written in files for use in the REPL.
- Use the shell to move groups of files.

**Assignments** - This lesson is complete when students have:

- Complete the examples in [Chapter 4](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap04)
  of Think Julia.
- Cloned the Assignment 3 repository with github classroom.
- Completed assignment 3 with all tests passing.


### Lesson 4: Conditional evaluation

[Lesson repository](#)

#### Learning Objectives

**Concepts** - After completing this lesson, students will be able to:

- Identify conditional code blocks, and which values will trigger which branches.
- Compare and constrast boolean operators.
- Combine boolean expressions using `&&` and `||`.

**Skills** - After completing this lesson, students will be able to:

- Use conditional control flow in a function
  to achieve different outputs with different inputs
- Use `println` for debugging.

**Assignments** - This lesson is complete when students have:

- Read [Chapter 5](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#chap05)
  of Think Julia.
- Cloned the Assignment 4 repository with github classroom.
- Completed assignment 4 with all tests passing.





**Skills**

- Write a minimum (not) working example (MWE) of a problem
