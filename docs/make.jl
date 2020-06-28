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
        "Lesson 1 - Getting Started" => [
            "Lesson docs"  => "Lessons/Lesson1.md",
            "Assignment01" => "Assignments/Assignment01.md"
        ],
        "Lesson 2 - Data Types and Functions" => [
            "Lesson docs"  => "Lessons/Lesson2.md",
            "Assignment02" => "Assignments/Assignment02.md"
        ],
        "Lesson 3 - Building functions and composition" => [
            "Lesson docs"  => "Lessons/Lesson3.md",
            "Assignment03" => "Assignments/Assignment03.md"
        ],
        "Lesson 4 - Building functions and composition" => [
            "Lesson docs"  => "Lessons/Lesson4.md",
            "Assignment04" => "Assignments/Assignment04.md"
        ],
        "Lesson 5 - Building functions and composition" => [
            "Lesson docs"  => "Lessons/Lesson5.md",
            "Assignment05" => "Assignments/Assignment05.md"
        ],
        "Assignment Index" => "Assignments/Assignments.md",
        "Lecture Index"    => "Lectures/Lectures.md"
    ]
)

deploydocs(;
    repo="github.com/wellesley-bisc195/BISC195.jl",
    push_preview = true,
    devbranch="trunk",
)
