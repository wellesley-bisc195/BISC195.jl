# Lesson 7 - Code Re-Use: Packages and Environments


[![Assignment 07 invitation](https://img.shields.io/badge/Assignment07-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/OrKQtjqa)
[![Assignment 07 - Description](https://img.shields.io/badge/07-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment07)
[![Assignment 07 - Rendered](https://img.shields.io/badge/07-Script-blue?style=for-the-badge&logo=open%20badges)](@ref Instructions-for-Assignment07)
[![Assignment 07 - Due](https://img.shields.io/badge/Due-7%14F6%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment07)

## Learning objectives

**Concepts** - After completing this lesson, students will be able to:

- Compare and contrast `Base`, `StdLib`, and other package code
- Explain the uses of project environments

**Skills** - After completing this lesson, students will be able to:

- Use the Package manager `Pkg` to create environments and install/uninstall packages
- Develop a package to use in future assignments

**Assignments** - This lesson is complete when students have:

- Run all code examples from Lesson 7 on their own computers
- Cloned the Assignment 7 repository with github classroom.
- Completed assignment 7 with all tests passing.

## The package ecosystem

Julia is an open-source programming language,
with a large community of researchers, businesses, and others
using the language to develop functionality that suits their interests.

Rather than have everyone contribute their code into the main language,
which would make the code base enormous,
julia (like many programming languages)
has a system to develop and distribute "packages" -
sets of useful functionality that can be installed on your system.

A _lot_ of julia packages have been registered,
and more are in development.
To search through what's available, 
you can check out [julia hub](https://www.juliahub.com/ui/Home).

## Environments

Julia enables you to have separate "environments" in which to run your code.
This means that you can have different packages
(or different versions of packages)
installed on your computer at the same time,
without them interacting.

In julia, environments are tied to directories.
To start a new project,
create a new directory,
then `activate` it from the Pkg REPL.

```julia
julia> mkdir("new_project")
"new_project"

julia> cd("new_project/")

# just type `]` to get the Pkg prompt
(@v1.4) pkg> activate .
 Activating new environment at `~/new_project/Project.toml`

(new_project) pkg>
```

To add new packges to this environment,
use `add` from the Pkg REPL:

```julia
(new_project) pkg> add Microbiome
   Updating registry at `~/.julia/registries/General`
   Updating git-repo `https://github.com/JuliaRegistries/General.git`
  Resolving package versions...
   Updating `~/new_project/Project.toml`
  [3bd8f0ae] + Microbiome v0.6.4
   Updating `~/new_project/Manifest.toml`
  [7d9fca2a] + Arpack v0.4.0
  [68821587] + Arpack_jll v3.5.0+3
  # ... etc
```

And remove them with `rm`

```julia
(new_project) pkg> rm Microbiome
   Updating `~/new_project/Project.toml`
  [3bd8f0ae] - Microbiome v0.6.4
   Updating `~/new_project/Manifest.toml`
  [7d9fca2a] - Arpack v0.4.0
  [68821587] - Arpack_jll v3.5.0+3
  # ... etc
```

In the same way you could do `using Statistics` in the previous lesson
to get access to the `mean()` and `std()` functions defined in that package,
`add`ing a package to your project makes the code available in your project
when you do `using <PackageName>`.

To leave the Pkg REPL, press `<backspace>`.
You should return to the `julia>` prompt.

!!! practice
    Start a new julia project,
    and add the package `BioSequences`
    using the Pkg REPL.
    `BioSequences` is a package designed to work with DNA,
    RNA, and protein sequences.

    1. Packages usually have documentation
       that explains how to use the package.
       Sometimes, documentation is very technical,
       but package documentation is often the best place to start
       when using new functionality.

       Read the first 3 sections of the [`BioSequences` docs](https://biojulia.net/BioSequences.jl/stable/)
       that describe Symbols, Types, and Constructing sequences.

    2. Create a DNA sequence, `seq`, "ATTGC".
       Once constructed, you should be able to do:

       ```julia
       julia> seq
       5nt DNA Sequence:
       ATTGC
       ```
    
    Packages don't just provide additional functions,
    they provide additonal types

    ```julia
    julia> typeof(seq)
    LongSequence{DNAAlphabet{4}}
    ```

    A `LongSequence` from `BioSequences`, unlike a typical julia `String`,
    is _mutable_.
    That is, we can add or remove bases
    just like we can add or remove elements from an array.

    ```
    julia> push!(seq, DNA_A)
    6nt DNA Sequence:
    ATTGCA
    ```

    3. `BioSequences` has functionality for getting the reverse complement
       and counting different base types.

       ```julia
       julia> reverse_complement(seq)
       6nt DNA Sequence:
       TGCAAT
       ```

       Can you write a function that gets the GC content of a `LongSequence`?

## User Packages

It's quite simple to write your own packages as well,
and we'll do that in Assignment07.
Let's go!