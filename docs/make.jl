using BISC195
using Documenter
using Literate

lectures = normpath.(readdir(joinpath(@__DIR__, "..", "lectures"), join=true))
filter!(l-> endswith(l, ".jl"), lectures)
lecture_out = joinpath(@__DIR__, "src/Lectures")
!isdir(lecture_out) && mkdir(lecture_out)

for l in lectures
    Literate.markdown(l, lecture_out, documenter=false)
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
            "Lesson1/index.md",
            "Windows Users" => "Lesson1/0_windows.md",
            "Using the Terminal" => "Lesson1/1_terminal.md",
            "Git for Version Control" => "Lesson1/2_git.md",
            "The Julia REPL" => "Lesson1/3_julia_REPL.md",
            "Assignment01" => "Lesson1/4_Assignment01.md"
        ],
        "Lesson 2 - Data Types and Functions" => [
            "Lesson2/index.md",
            "Data Types" => "Lesson2/1_data_types.md",
            "Functions" => "Lesson2/2_functions.md",
            "Assignment02" => "Lesson2/3_Assignment02.md"
        ],
        "Assignments" => "Assignments.md",
        "Lectures" => [
            "Lecture 1 (2020-06-09)" => "Lectures/lecture1.md"
        ]
    ]
)

deploydocs(;
    repo="github.com/wellesley-bisc195/BISC195.jl",
)
