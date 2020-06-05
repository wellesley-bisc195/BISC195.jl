using BISC195
using Documenter
using Literate 

lect_src = joinpath(@__DIR__, "literate", "lectures")
lect_out = joinpath(@__DIR__, "src", "Lectures")

for l in readdir(lect_src, join=true)
    isfile(l) || continue
    splitext(l)[2] == ".jl" || continue
    Literate.markdown(l, lect_out)
    Literate.notebook(l, lect_out, execute=false)
end

assig_src = joinpath(@__DIR__, "literate", "assignment_scripts")
assig_out = joinpath(@__DIR__, "src", "Assignments")

for l in readdir(assig_src, join=true)
    isfile(l) || continue
    splitext(l)[2] == ".jl" || continue
    Literate.markdown(l, assig_out, documenter=false)
end

makedocs(;
    modules=[BISC195],
    authors="Kevin Bonham <kevbonham@gmail.com>",
    repo="https://github.com/wellesley-bisc195/BISC195.jl/blob/{commit}{path}#L{line}",
    sitename="BISC195.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://wellesley-bisc195.github.io/BISC195.jl",
        assets=String["assets/admonitions.css"],
    ),
    pages = [
        "Home" => "index.md",
        "Syllabus" => "Syllabus.md",
        "Lesson 1" => [
            "Getting Started"         => "Lessons/Lesson1.md",
            "Assignment01"            => "Assignments/Assignment01.md"
        ],
        "Lesson 2" => [
            "Data Types and Functions" => "Lesson2/index.md",
            "Data Types"               => "Lesson2/1_data_types.md",
            "Functions"                => "Lesson2/2_functions.md",
            "Assignment02"             => "Assignments/Assignment02.md"
        ],
        "Assignments" => "Assignments/Assignments.md",
        "Lectures" => "Lectures/Lectures.md"
    ]
)

deploydocs(;
    repo="github.com/wellesley-bisc195/BISC195.jl",
    push_preview = true
)
