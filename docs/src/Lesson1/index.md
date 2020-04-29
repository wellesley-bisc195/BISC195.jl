# Getting started

This file contains instructions for completing today's lesson.
It is written in a language called "markdown",
which allows plain text to be easily converted
into nicely formatted webpages like the one you're looking at now.
But we'll come back to this.

To complete this lesson, follow the instructions below.

!!! tip
    It is even more important than usual
    to read and follow instructions
    when it comes to computers and programming.
    We will be interacting with our computers
    using procedural language - that is,
    language that follows a strict set of procedures.
    Skipping steps or doing things out of order
    can lead to unexpected results.

```@contents
Pages = ["Lesson1/index.md", "Lesson1/0_windows.md","Lesson1/1_terminal.md", "Lesson1/2_git.md"]
Depth = 3
```

## First steps

Most modern computer code is just text
that tells a computer what to do.
The part that is complicated is that code tends to be:

1. Literal - the computer can only do exactly what you specifically tell it;
   it won't try to guess your meaning
   and it doesn't understand nuance.
1. Procedural - you must provide **all** of the commands
   and you must provide them **in the correct order**

[Watch this video](https://www.youtube.com/watch?v=cDA3_5982h8)
to get a sense of why this matters so much.

In this course,
we'll be primarily interacting with that computer code as plain text,
but there are a bunch of tools that people have built
to make that job a bit easier.

### Installing your IDE

One of those tools is an "Integrated Development Environment" or "IDE".
This is basically just a text editor with a bunch of bells and whistles.

There are a number of different text editors to chose from,
but in this course, we're going to use [Visual Studio Code](https://code.visualstudio.com/)

1. [Click here](https://code.visualstudio.com/Download)
    and select the correct download for your operating system

    ![vscode-download](../assets/img/vs-code-download.png)

1. Open the downloaded file and follow the prompts to install the program

!!! tip
    If you prefer to use a different text editor, that's ok,
    but it's important to be sure it's a _plain text_ editor
    and not a _rich text_ editor like MS Word. 
    The files saved by rich text editors contain extraneous information,
    and are not suitable for programming.

    Check with Kevin about your choice if you're unsure.

### [Installing julia](@id install_julia)

In this course,
we're primarily going to be programming in the [julia programming language](https://julialang.org/).
Julia is a modern programming language
designed for scientific computing.

1. Go to the [julia downloads page](https://julialang.org/downloads/)
    and select the correct download for your operating system.

    ![julia-download](../assets/img/julia-releases.png)

1. Open the downloaded file and follow the prompts to install it.
    1. Mac users, once the `.dmg` file is opened,
       you will need to drag the app file into your `Applications` folder
    1. Windows users - there will be a `.exe` file - open it to start the installation.
1. Once the julia application is installed, open it.
   This should cause a text window to open looking something like this:

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

Type `2+2` and hit `enter`, you should see the number `4`, and then another julia prompt:

```
julia> 2+2
4

julia>
```

You can close the window in the normal way, or type `exit()` and hit enter.