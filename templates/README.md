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
                Git(ssh=true, branch="trunk"),
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

templ(7, "/Users/Danielle/Documents/bisc195/assignments") # replace with assignment number, correct path
```
templ(5, "/Users/ksc/repos/courses")
# replace this path with anything that makes sense on my local

# this will generate a new environment
# open new environment and template in VSCode
# change due date in assignment patch, %2F is a dash
# can do a markdown preview to see if it worked
# can remove description
# go to github classroom
# push assignment information 
# within organization wellesley-bisc195, make a new repository, make it public, don't change anything else
# copy url and go back to assignment repository. 
# git remote set-url origin git@github.com:wellesley-bisc195/Assignment05.git
# git commit -am "changed date"
# git push -u origin trunk
# go to github repository, go to settings, and make it a template repository
# go to github classroom and make a new assignment, add assignment title, don't add a deadline, visibility should be private don't grant students edit access
# enable feedback pull requests, and create assignments
# copy assignment invitation url and go back to README.md
# replace # in invitation with the url, make sure to delete the hash and then paste url it in
# commit changes, push changes
# come back to github assignment 5 repository to make sure that the link works
# do for assignments 6-10, make due dates Thursday and Sunday, starting at 7/6

## TODO

- [ ] add `test` and `src` template with assignment set-up

[pkgtemplates]: https://invenia.github.io/PkgTemplates.jl/dev/user/#PkgTemplates.GitHubActions
