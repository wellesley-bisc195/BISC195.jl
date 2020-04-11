```@meta
CurrentModule = BISC195
```

# BISC195 - Essential Skills for Computational Biology

This course is designed to teach you practical skills
for using code to answer biological questions.

We will largely be learning one programming language in particular - 
[`julia`](http://julialang.org) -
but you will learn concepts and practices that should be relevant to any language
(other common languages used in biology are `python`, `R`, and `perl`).
No prior experience with writing code is required to do well in this course.

## Using this course

This course is paired with lectures,
but the written lessons and exercises should stand alone.
And even if you are in the lectures,
there is a lot of important information contained in the written lessons.

This section explains where to find lesson material,
including lessons and assignments,
how to read the written material on this website,
and how to get the most out of taking this course.

### To get the most out of this course, you should:

1. **Thoroughly read all of the lesson content.**
    I have done my best to keep lessons concise, with minimal diversions.
    This keeps things shorter, but it means that most of the content is important.
    If you skip or skim sections, you may miss important concepts
    and have trouble completing assignments.
2. **Run the code in all "Practice," "Exercise," and "Example" blocks.**
    This will be described in more detail later,
    but it is _imperative_ that when their are code examples,
    you run them, and try to understand the output.
    Programming is more about practice than theory,
    and if you are only reading, you will not learn.
3. **Make your own modifications to code in "Practice", "Exercise", and "Example" blocks.**
    You will learn best by doing.
    See what happens when you change spelling,
    leave out parts of a command,
    or add additional text.
    Most of the time, this will produce errors,
    but professional programmers encounter errors _all the time_.
    Learning which mistakes lead to which errors
    is a critical skill in programming.
    I will warn you when going off the beaten path with code
    might be dangerous.
4. **Fail early and fail often. Embrace your error messages.**
    If you never make a mistake, you are not learning how to program.
    If you are practicing enough, trying new things,
    most of the time you will fail.
    This is expected, and _this is a good thing_.
    When you do an experiment in the lab,
    you rarely get an error message when things go wrong.
    Error messages can be daunting at first, but they often contain useful information.
    Appreciate them!

### Reading lesson content

All of the course materials can be found on this website.
Lectures, written content and practice problems, 
readings, and assignments
can all be found with the appropriate lesson.
There are also indices for each type of lesson content.

```@raw html
<!-- TODO: Fill in these links -->
```

- [Lesson index](#)
- [Lecture index](#)
- [Readings index](#)
- [Assignment index](#)

#### Call-out boxes

Each lesson is broken up into multiple pages,
with one major concept or skill per page.
It is a good idea to go through lessons in order,
though each page should stand on its own
(eg practice problems will not carry from one page to the next).

Throughout lessons, there will be colored boxes
that contain different kinds of information:

!!! warning
    These orange boxes will be very rare,
    but are present where you should be especially careful about the inputs to a command.
    In the vast majority of cases,
    messing up an input will not be a problem,
    but in rare cases you can potentially lose data
    or (very rarely) damage your computer.
    
    Ask Kevin if you want advice on keeping your computer backed up.

!!! practice "Examples, practice, and checking questions"
    These purple boxes contain code examples or instructions
    that you should try to run on your own computer.
    They may also contain questions that you should try to answer,
    and often the answer to the question will require writing code.

    I will often ask questions
    that are not explicitly answered earlier in the lesson.
    They may require you to stretch your knowledge,
    try some different approaches,
    or search the internet.
    (Don't look down on googling! It's an essential programming skill!)

    If you get stuck, in most cases
    it should be fine to contiue the lesson,
    but you should be sure that you understand the answers and examples
    in all of these boxes before finishing the lesson.

!!! tip "Tips and tricks"
    These green boxes contain useful tricks
    to make your experience programming easier and more enjoyable.
    Knowing all of them will not be strictly necessary,
    but in many cases they will save you a great deal of time,
    or help you prevent mistakes.

!!! info
    These blue boxes contain additional information
    or further reading you can do if you want to deepen your understanding.
    There is a ton to learn that's beyond the scope of this course,
    but the information in "Info" boxes is not essential to do well.

!!! compat "Windows Users"
    Much of this course is written without respect to computer operating system (OS).
    However, most bioinformatics tools
    are built for unix-based operating systems, such as Linux and Mac OSX.
    In some cases, users of computers running Windows
    will need to jump through some additional hoops,
    or make changes to example code to make it work.
    When that happens, I will explain in this type of box.

#### Code formatting

Throughout the course,
you will see examples of code.
Sometimes, code will appear "inline" with other text,
but will be formatted differently so that it's clearly code.
For example, `x = 2` and `f(x) = 2x + 3`.

Other times, code will appear in a block.
The following is julia code:

```julia
function my_func(x, y)
    for i in 1:x
        println(i + y)
    end
end
```

As you can see, this block of code is formatted differently from normal text.

Sometimes, you will see "command prompts"
such as `$` for the shell or `julia>` for the julia REPL
(don't worry if you don't know what the shell or a REPL are right now). 
In these cases, when copying the code, **do not include the command prompt**.
I will remind you about this again when it comes up,
but just as an example, the following is a shell command and its output:

```sh
$ ls -l ~/Desktop
```
```
  rw-r--r--   1  ksb  staff    30 KiB  Wed Apr  8 20:12:59 2020  C0005_3F_1A_1000k_1_profile.tsv
  rw-rw-r--   1  ksb  staff     4 GiB  Wed Mar 18 15:48:06 2020  ko_profiles.sqlite
  rw-rw-r--   1  ksb  staff     9 MiB  Mon Mar  9 16:41:35 2020  metadata.sqlite
  rw-r--r--   1  ksb  staff     0 B    Fri Mar 27 15:07:47 2020  test.txt
```

In this example, you would type just `ls -l ~/Desktop` and press `enter`.
Notice that in the second block,
there is no command prompt (`$`) a the beginning.
That's because this is output, and is not intended to be run as code.

!!! tip
    As much as possible, when copying code examples,
    try to type the code out yourself,
    rather than just copying and pasting.
    You will learn faster this way,
    and your typos will show you errors that are worth seeing.




```@contents
Depth = 4
```
