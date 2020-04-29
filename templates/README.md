# For use with [`PkgTemplates.jl`][pkgtemplates]

## Usage

```julia
using PkgTemplates

struct Replacements <: PkgTemplates.Plugin
    d::Dict{String, Any}
end
Replacements(; kwargs...) = Replacements(Dict(string(k) => v for (k, v) in pairs(kwargs)))

PkgTemplates.user_view(::PkgTemplates.Plugin, t::Template, ::AbstractString) =
    PkgTemplates.getplugin(t, Replacements).d

PkgTemplates.@with_kw_noshow struct Assignment <: PkgTemplates.BasicPlugin
    file::String = "templates/assignment_template.jl"
end

PkgTemplates.source(p::Assignment) = p.file
PkgTemplates.destination(::Assignment) = "src/assignment.jl"

templ = Template(
        user="wellesley-bisc195",
        authors="Kevin Bonham, PhD <kbonham@wellesley.edu>",
        dir="/Users/ksb/repos/courses",
        julia=v"1.2",
        plugins=[# other than defaults
            SrcDir(file="templates/module_template.jl"),
            Tests(file="templates/tests_template.jl", project=true),
            Readme(file="templates/readme_template.md"),
            Git(ssh=true),
            GitHubActions(),
            Documenter{GitHubActions}(),
            Replacements(; ASSIGNMENT="XX"),
            Assignment()
        ])

# replace XX with lesson number
templ("AssignmentXX")
```

## TODO

- [ ] add `test` and `src` template with assignment set-up

[pkgtemplates]: https://invenia.github.io/PkgTemplates.jl/dev/user/#PkgTemplates.GitHubActions
