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

function templ(num, path)
    a = lpad(num, 2, "0")
    t = Template(
            user="wellesley-bisc195",
            authors="Kevin Bonham, PhD <kbonham@wellesley.edu>",
            dir=path,
            julia=v"1.4",
            plugins=[# other than defaults
                SrcDir(file="templates/module_template.jl"),
                Tests(file="templates/tests_template.jl", project=true),
                Readme(file="templates/readme_template.md"),
                !TagBot,
                !CompatHelper,
                Git(ssh=true),
                GitHubActions(;
                    destination="ci.yml",
                    linux=true,
                    osx=false,
                    windows=false,
                    x64=true,
                    x86=false,
                    coverage=false,
                    extra_versions=["1.4"],
                ),
                Replacements(; ASSIGNMENT=a),
            ])

    # replace XX with lesson number
    t("Assignment$a")
end

templ(1, "/Users/ksb/repos/courses") # replace with assignment number, correct path
```

## TODO

- [ ] add `test` and `src` template with assignment set-up

[pkgtemplates]: https://invenia.github.io/PkgTemplates.jl/dev/user/#PkgTemplates.GitHubActions
