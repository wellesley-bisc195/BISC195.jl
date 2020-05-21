# Part 3 - Running julia code

For a lot of this course,
we will be using the julia programming language
rather than the command line.

There are a few different ways to run julia code,
and this section will get you acquaninted with a couple of them.

## The julia REPL

Open julia, which you [should have installed](@ref install_julia) in the first part of this lesson.

Your terminal application should open, running julia:

```
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.4.0 (2020-03-21)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia>
```

Technically speaking,
this is the julia "Read, evaluate, print, loop", or "REPL".

When you enter text at the `julia>` prompt,
the REPL **read**s it,
**evaluate**s it as julia code,
**print**s[^1] the result,
and then **loop**s back to the prompt.

Let's try it! Type `println("Hello, World!")` at the prompt and hit enter.

```@repl
println("Hello, World!")
```

Don't worry if you don't understand all of the components of this command - 
we'll get there.

!!! tip
    As much as possible, try typing out the commands in these lessons,
    rather than copy-pasting.
    It's important to build the muscle memory,
    and to see the errors that appear when you have typos!

    For example, what did I miss here:

    ```@repl
    println(Hello, World!)
    ```

## Running julia from the command line

You can also execute short snippets of code from the command line.

!!! practice "To Do"
    Open your terminal and enter the following:

    ```sh
    $ julia -e 'println("Hello, World!")'
    ```
    ```
    Hello, World!
    ```

The `-e` is a command-line flag that tells julia to just execute the next command as julia code.
Note the use of single quotes (`'`) surrounding the command.

!!! warning "Checking Questions"
    1. What happens if you just enter `julia` at the command line without additional arguments?
    2. What happens if you use double quotes instead of single quotes? 
       Why do you think that is?

## Running julia scripts

Our code is often going to be much more complicated than what we've done so far.
In those cases, and in order to keep a record of what we're doing,
it's useful to put our julia code in a file.

!!! practice "To Do"
    1. Open up VS Code, and create a new file called `hello.jl`.
    2. Type `println("Hello, World!")` into the file and save it.
       Note the path to the directory where you saved the file!
    3. run:

        ```sh
        $ julia <path_to_directory>/hello.jl
        ```
        ```
        Hello, World!
        ```

When code is saved into a file that can be run from the commandline,
it's called a "script."
All of your assigments will be julia code written into files
and commited to code repositories using `git`.

But it's important to realize that all of this code is the same;
it's just text.
That text has specific requirements in order to be parsed
by the julia interpreter,
but whether you run code in the REPL,
from the command line,
or in a script,
it has the same behavior.

[^1]: **print** - In the days before monitors,
    results would literally be printed on a piece of paper.
    These days, "printing" just means displaying the results.
