To make RISE slideshows,

```julia
julia> using Literate

julia> Literate.notebook(
        "lectures/lecture1.jl", # replace with lecture name
        "lectures/slides",
        execute=false)
```