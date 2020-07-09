# [Assignment07](@id assignment07)

[![Assignment 07 invitation](https://img.shields.io/badge/Assignment07-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/OrKQtjqa)
[![Assignment 07 - Description](https://img.shields.io/badge/07-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment07)
[![Assignment 07 - Due](https://img.shields.io/badge/Due-7%2F14%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment07)

## Instructions

Click the assignment 7 invitation above
and clone the repository.
This assignment is going to be a bit different
than assignments in the past,
so read on.

### Building a package

`Assignment07` is a julia package
(actually, all of your assignments have been julia packages).
Let's take a look at it from the command line.

1. Change your current working directory to the assignment directory.
2. List the contents of the directory (take a look back at [Lesson 1](@ref lesson01)
   if you don't remember how).

   In the main directory, you should see (among other things)
   the `src/` directory, which contains the main project code,
   the `test/` directory, which contains the automated tests,
   and the `Project.toml` file, which describes the properties of the package.

3. Look at the contents of `Project.toml`
   (do you remember how to do this from the command line?).
   
   ```
   name = "Assignment07"
   uuid = "67893044-1481-44cf-8ab6-de350e09ee4e"
   authors = ["Kevin Bonham, PhD <kbonham@wellesley.edu>"]
   version = "0.1.0"
   
   [compat]
   julia = "1.4"
   ```
   
   This file is written in a format called `toml`
   (for [Tom's obvious, minimal language](https://en.wikipedia.org/wiki/TOML)).
   It's not julia code, but it has some similar features.

   Open the file in VS Code, and add your name to the list of `authors`.
   Arrays in `toml` files have the same syntax as in `julia`

4. Open a julia REPL, and set the working directory `Assignment07-<username>/`
   Open the Pkg REPL prompt (with `]`),
   and activate the project
   
   ```julia
   (@v1.4) pkg> activate .
   Activating environment at `~/repos/courses/assignment07/Project.toml`
   
   (Assignment07) pkg>
   ```
   
   Now, look at `Project.toml` again -
   you should see a new section `[deps]` that lists `BioSequences`.
   This describes your Package's "dependencies,"
   which are other packages that your package depends on to function correctly.

5. Look at the directory again -
   you should now see that a `Manifest.toml` file has been created.
   This file contains more specific information about the precise
   configuration (versions, names, locations, etc) of all the packages,
   including "indirect" dependencies (the dependencies of your dependencies).
   You should never edit this file manually.

### Adding code

When you execute `using BioSequences`,
julia interprets this as asking to execute the code found in
the `BioSequences` package - specifically the code in `src/BioSequences.jl`.
Take a look at that file on github [here](https://github.com/BioJulia/BioSequences.jl/blob/master/src/BioSequences.jl).

This file contains a `module` definition,
which is declared like this:

```julia
module BioSequences

# code for the module

end
```

A `module` is a container for code that can be called with `using`.
You can define a module right in your REPL:

```julia
julia> module MyModule

       function somefunction()
           println("Hi! I'm a function in MyModule")
       end

       end
Main.MyModule

julia> using .MyModule # the leading `.` is necessary for modules that aren't installed as packages

julia> MyModule.somefunction()
Hi! I'm a function in MyModule
```

Note that `somefunction()` is not available by itself,
you need to tell julia that it's found in `MyModule`
by typing `MyModule.somefunction()`. 
In order to make the function available
without specifying its module, the module must `export` it.

```julia
julia> module MyModule

       export somefunction,
              otherfunction

       function somefunction()
           println("Hi! I'm a function in MyModule")
       end

       function otherfunction()
           println("Me too! Me too!")
       end

       function notexported()
           println("Me too - but I'm not exported :-(")
       end

       end
WARNING: replacing module MyModule.
Main.MyModule

julia> using .MyModule

julia> somefunction()
Hi! I'm a function in MyModule

julia> otherfunction()
Me too! Me too!

julia> notexported()
ERROR: UndefVarError: notexported not defined
Stacktrace:
 [1] top-level scope at REPL[14]:1
 [2] eval(::Module, ::Any) at ./boot.jl:331
 [3] eval_user_input(::Any, ::REPL.REPLBackend) at /Users/julia/buildbot/worker/package_macos64/build/usr/share/julia/stdlib/v1.4/REPL/src/REPL.jl:86
 [4] run_backend(::REPL.REPLBackend) at /Users/ksb/.julia/packages/Revise/tV8FE/src/Revise.jl:1165
 [5] top-level scope at none:0

julia> MyModule.notexported()
Me too - but I'm not exported :-(
```

### Bioinformatics Functionality

Now, let's make Assignment07 into a package that you can reuse
for future assignments.

!!! tip
    In many packages,
    there's so much code that it would be hard to keep track of
    if everything were in the main module file.
    Instead, most of the code is written in separate files,
    and then `include("code_file.jl")` is added to the module file.

    In julia, `include("code_file.jl")`
    executes all of the text contained in `code_file.jl`,
    so it's identical to having that code in the module file itself,
    but it keeps things more orderly.

    Take a look at the `src/AssignmentXX.jl` files
    in your previous assignments,
    and the module file of `BioSequences` linked above.
    They all follow this pattern.


Write and export the following functions in the `Assignment07` module.
You may copy as much code as you like from previous assignments,
but keep in mind that some of the functions have slightly different parameters.

!!! warning "Bonus Challenge"
    You may write all of the code using `String`s for DNA sequences
    as we've been doing.
    However, if you'd like an additional challenge,
    you may try to write the functions using the DNA types from `BioSequences`.
    
    If you'd like to try this,
    edit the file in `test/runtests.jl` to comment out the "Using Strings" testset
    and un-comment the "Using BioSequences" testset.
    Tip - in VS code you can select a whole block of text
    and press `cmd+/` to comment/un-comment
    (for Windows users, it's 'ctrl+/`).

0. `normalizeDNA(sequence)`: This function is already written for you.

1. `compsition(sequence)`:
   Like `basecomposition()` from assignment04,
   but instead of returning a `Tuple` of values,
   return a `Dict`, with keys `'A'`, `'C'`, `'G'`, `'T'`, and `'N'`.

   Examples:

   ```julia
   julia> composition("ACCGGGTTTTN")
   Dict{Char,Int64} with 5 entries:
     'A' => 1
     'G' => 3
     'T' => 4
     'N' => 1
     'C' => 2
    
   julia> composition("AAX")
   ERROR: Invalid base, X
   ```

!!! warning "Bonus Challenge"
    If you're using `BioSequences`, this function already exists:

    ```julia
    julia> using BioSequences

    julia> BioSequences.composition(dna"ACCGGGTTTTN")
    Composition{DNA} with 5 entries:
    DNA_C => 2
    DNA_N => 1
    DNA_A => 1
    DNA_G => 3
    DNA_T => 4
    
    julia> d[DNA_T]
    4
    ```

    You can use functions from BioSequences in your own functions
    by doing `using BioSequences`,
    but if you want to export them from your own package
    or add additional methods,
    you must do an "import": `import BioSequences: composition`

    !!! tip
        This may be true for some other functions too...
        read the documentation,
        be sure that your functions meet the specifications.
        To use `import` on multiple functions, separate them by commas:

        Eg. `import PackageA: func1, func2`

1. `gc_content(seq)`:
   Exactly like `gc_content()` from Assignment 4,
   except that it should accommodate ambiguous bases
   (eg sequences that have `'N'` in them).
   
   Examples:

   ```julia
   julia> gc_content("ATNG")
   0.25
   
   julia> gc_content("ccccggggn")
   0.8888888888888888
   ```

   !!! warning "Bonus Challenge"
       The `BioSequences` tests assume you're passing `LongSequence`s as arguments,
       eg `gc_content(dna"ATNG")`,
       but extra bonus if you can accommodate `String`s as well.

2. `complement(sequence)`:
   Like `complement()` from Assignment 5,
   except that it should accomodate ambiguous bases
   (the complement of `N` is `N`),
   and should work on `String`s rather than `Char`.

   !!! tip
       In julia, you can write functions with the same name for different types.
       These different versions are called the "methods" of the function.

       For example, you could define one version of `complement` that works on `Char`,
       and a different one that works on `String`s.

       ```julia
       julia> function complement(base::Char)
                  comp = Dict('A'=>'T',
                              'T'=>'A',
                              'G'=>'C',
                              'C'=>'G',
                              'N'=>'N')
                  return comp[base]
              end
       complement (generic function with 1 method)
       
       julia> function complement(seq::AbstractString)
                  # some other code here
                  println("string version!")
              end
       complement (generic function with 2 methods)
       
       julia> complement('C')
       'G': ASCII/Unicode U+0047 (category Lu: Letter, uppercase)
       
       julia> complement("ABC")
       string version!
       ```

   Examples:
   
   ```julia
   julia> complement("ATTN")
   "TAAN"
   
   julia> complement("ATTAGC")
   "TAATCG"
   ```

3. `reverse_complement(sequence)`:
   Exactly like `reverse_complement()` from Assignment 5,
   except that it should accomodate ambiguous bases
   (the complement of `N` is `N`).

   Examples:

   ```julia
   julia> reverse_complement("ATTAGC")
   "GCTAAT"
   
   julia> reverse_complement("ATN")
   "NAT"
   ```

4. `parse_fasta(path)`:
   Similar to `parse_fasta()` from Assignment 6,
   with a few changes:
   
   - headers don't need to be split into their component parts.
     That is, the array of headers should just be an array of strings 
     (though the leading `>` should be removed).
   - All sequences should be valid DNA sequences (including `N`s)

   Examples:

   ```julia
   julia> ex1 = parse_fasta("data/ex1.fasta");

   julia> ex1[1]]
   ERROR: syntax: extra token "]" after end of expression
   Stacktrace:
    [1] top-level scope at REPL[6]:1
   
   julia> ex1[1]
   2-element Array{String,1}:
    "ex1.1 | easy"
    "ex1.2 | multiline"
   
   julia> ex1[2]
   2-element Array{String,1}:
    "AATTATAGC"
    "CGCCCCCCAGTCGGATT"
   
   julia> ex2 = parse_fasta("data/ex2.fasta");
   ERROR: invalid base H
   ```

   !!! warning "Bonus Challenge"
       If you want an extra extra challenge,
       try using the `FASTX.jl` package
       to parse fasta files for you.

       If you're writing your own,
       be sure that the sequences stored in your array
       have the type `LongSequence` and not String.