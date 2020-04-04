# For use with [`PkgTemplates.jl`][pkgtemplates]

## Usage

```julia
using PkgTemplates

templ = Template(
        user="wellesley-bisc195",
        authors="Kevin Bonham, PhD <kbonham@wellesley.edu>"
        plugins=[# other than defaults
            Readme(file="templates/readme_template.md"),
            Git(ssh=true),
            GitHubActions(),
            Documenter{GitHubActions}()
        ])

# replace XX with lesson number
templ("Lesson XX")
```

## TODO

- [ ] add `test` and `src` template with assignment set-up

[pkgtemplates]: https://invenia.github.io/PkgTemplates.jl/dev/user/#PkgTemplates.GitHubActions
