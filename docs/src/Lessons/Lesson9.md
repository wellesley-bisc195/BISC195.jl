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
that depends on the types of its arguments.

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

One can even define a method that calls another method
of the same function!
For example,
we can write a `complement()` function that works on `Char`:

```julia
julia> function complement(base::Char)
           base = uppercase(base)
           comps = Dict('A' => 'T',
                        'C' => 'G',
                        'G' => 'C',
                        'T' => 'A',
                        'N' => 'N')
           return comps[base]
       end
complement (generic function with 1 method)
```

And then another function that works on `String`s,
that maps the `complement(::Char)` method onto the `String`.

```julia
julia> function complement(seq::AbstractString)
           map(complement, seq)
       end
complement (generic function with 2 methods)

julia> complement("ATTGC")
"TAACG"
```

This works because `map` on a `String` applies the function
to each element of the `String`, which are `Char`s. 

Some functions have _a ton_ of methods -
you can see them using the `methods()` function:

```julia
julia> methods(complement)
# 2 methods for generic function "complement":
[1] complement(base::Char) in Main at REPL[5]:2
[2] complement(seq::AbstractString) in Main at REPL[3]:2
```

!!! warning "Checking Question"
    How many methods does `+` have?

## Writing your own types

Sometimes, the best way to to solve a problem
is to make a new type.
For example, when you parsed FASTA files
in Assignments 7 and 8,
you were keeping headers and sequences separate - 
this could lead to problems trying to keep them in sync
later when you try to work with them.

Further, most of you solved that assignment
by keeping a bunch of extra vectors around
that stored intermediate sequences,
and had to deal with special-casing the first and last sequence.
That works, but it's a lot to keep track of.

Compare that approach to the following:

```julia
mutable struct FastaRecord
    header
    sequence
end

# these are "accessor" functions - they're not strictly necessary
function header(fr::FastaRecord)
    return fr.header
end

function sequence(fr::FastaRecord)
    return fr.sequence
end

## Note: Simple functions like those above can be written with shortened syntax:
# header(fr::FastaRecord) = fr.header
# sequence(fr::FastaRecord) = fr.sequence

# sequence! updates the sequence field
function sequence!(fr::FastaRecord, seq::AbstractString)
    fr.sequence = seq
end

function parse_fasta(path)
    records = FastaRecord[] # this is special syntax for `Vector{FastaRecord}()`
    for line in eachline(path)
        if startswith(line, '>')
            # if the line is a header, we push! a new record with an empty sequence to the `records` vector
            header = line[2:end]
            push!(records, FastaRecord(header, ""))
        else
            # otherwise, we add the line onto the end of the sequence
            record = records[end]
            newseq = sequence(record) * line
            sequence!(record, newseq)
        end
    end
    return records
end
```

```julia
julia> ex1 = parse_fasta("/Users/ksb/repos/courses/assignment07/data/ex1.fasta")
2-element Array{FastaRecord,1}:
 FastaRecord("ex1.1 | easy", "AATTATAGC")
 FastaRecord("ex1.2 | multiline", "CGCCCCCCAGTCGGATT")
```

We can also write functions like `length` and `gc_content`
that work on our `FastaRecord` type.

```julia
Base.length(fr::FastaRecord) = length(sequence(fr))

# assuming you've already written `gc_content()` that works on `String`s
gc_content(fr::FastaRecord) = gc_content(sequence(fr))
```

!!! warning "Checking Question"
    If multiple methods work for a particular function call,
    how does julia decide which one to use?

    Eg, if I write

    ```julia
    julia> function foo(x::Number, y::Number)
        println("first method")
    end
    foo (generic function with 1 method)

    julia> function foo(x::Float64, y::Number)
                println("second method")
            end
    foo (generic function with 2 methods)

    julia> function foo(x::Float64, y::Float64)
                println("third method")
            end
    foo (generic function with 3 methods)
    ```

    Which method is called when I run `foo(1.0, 1)`?
    What about `foo(42, 1.0)`?
    Try to answer the question before running the code,
    then check to see if you're right.
