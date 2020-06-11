# [Assignment03](@id assignment03)

[![Assignment 03 - Invitation](https://img.shields.io/badge/Assignment03-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/UbCNPRi2)
[![Assignment 03 - Description](https://img.shields.io/badge/03-Description-blue?style=for-the-badge&logo=open%20badges)](@ref assignment03)
[![Assignment 03 - Rendered](https://img.shields.io/badge/03-Script-blue?style=for-the-badge&logo=open%20badges)](@ref Instructions-for-Assignment03)
[![Assignment 03 - Due](https://img.shields.io/badge/Due-6%2F18%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment02)

## Instructions

Hopefully, this process is familiar by now.
Click the assignment 3 invitation above,
clone the repository, and follow the instructions
in `src/assignment.jl`.
Remember, an easier-to-read version of the assignment
script can also be viewed by clicking the "Script" badge above.

Also, recall that you may run the automated tests on your own computer:

```sh
$ julia --project -e 'using Pkg; Pkg.test()'
```

## Using the VS Code julia extension

There are a number of tools that can turn VS code
into a more useful development environment.
One of them is the `julia` plugin.

To install plugins, click the "Extensions"
button on the left hand side of the VS code application window.

![VS code extensions](https://imgur.com/6fz1qvX.png)

Then type "julia" and click to install
the `Julia` and `Markdown Julia` extensions.

![julia extensions](https://imgur.com/TxKLDwG.png)

Once this is finished, your julia files
should have syntax highlighting
(making it easier to see different parts of you program),
and allowing you to send bits of julia code to an integrated julia REPL.

!!! note
    Just after you install the plugin,
    it may take a bit of time for the "language" server to get going.
    If the stuff below doesn't work at first, just wait a couple of minutes.

!!! compat "Windows Users"
    You should also install the "WSL remote" extension.
    This allows you to access your Ubuntu installation
    as if it were a remote computer.
    Once it's installed,
    press the "Remote Explorer" button on the left toolbar,
    and you should see your Ubuntu installation.
    Click the `+` icon next Ubuntu,
    and then you can browse and open folders inside linux.

One the plugin is installed, open `src/assignment.jl`
in your Assignment03 directory from within VS Code.
Then, put the cursor on the line with `function compliment(base)`,
press and hold the `alt` key, then press `return`.

A julia REPL will open inside VS Code,
and the entire function body should be copied into it and executed.
This will allow you to experiment with the code inside the assignment
and do [incremental development](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html#incremental_development)
of your functions without needing to run the entire file each time you make a change.

!!! tip
    Sometimes, you can confuse yourself by running things out of order.
    For example, let's say I write,

    ```julia
    function hello(x)
        println("Hello, $(x)!")
    end
    
    s = "Students"
    t = "TAs"

    hello(s)
    hello(t)
    ```

    And then execute the whole thing in VS code.
    Later on, I decide I don't need to say hello to the TAs
    so I delete the line `t = "TAs"`,
    but forget to delete `hello(t)`. 

    As I continue to run the code in the same julia session,
    there are no problems because,
    even though I deleted `t = "TAs"`,
    there's no way to unassign `t` - it's still defined.
    But, if I come back later and try to run the file in a new julia session,
    I will get an `UndefinedVariableError`
    when the program tries to execute `hello(t)`.
    