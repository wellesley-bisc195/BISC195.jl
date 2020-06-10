# [Assignment01](@id assignment01)

[![Assignment 01 - Invitation](https://img.shields.io/badge/Assignment01-Repository-blue?style=for-the-badge&logo=open%20badges)](https://classroom.github.com/a/jOe6EhXJ)
[![Assignment 01 - Description](https://img.shields.io/badge/Assignment01-Description-blue?style=for-the-badge)](@ref assignment01)
[![Assignment 01 - Assignment script](https://img.shields.io/badge/Assignment01-Script-blue?style=for-the-badge)](@ref Instructions-for-Assignment01)
[![Assignment 01 - Due](https://img.shields.io/badge/Due-6%2F11%2F2020-orange?style=for-the-badge)](@ref assignment01)

In this course,
assignments are provided through github classroom.
This assigment is mostly designed to familiarize you with the process
of downloading and completing assignments.

You should have already signed up for a github account,
and joined the classroom.
If not, go back and follow the [instructions here](@ref github_signup).

!!! practice "To Do: Accept the assignment"
    **Step 1:** Accept `Assignment01` at [this link](https://classroom.github.com/a/jOe6EhXJ)

    When you accept the assignment,
    a git repository is created in your github account.

    **Step 2:** Click the link shown on the webpage.

    ![accept assignment](https://user-images.githubusercontent.com/3502975/67243455-8ee74800-f425-11e9-867e-c81368c82cad.png)

    This repository contains a lot more stuff than the repository you made before,
    but it's still simply a directory with subdirectories and files
    (plus git superpowers of course).
    You can click on the directories and files
    to see their contents.

    Of course, this repository is stored on github, not your computer.
    We can fix that by `clone`ing[^1] this repository
    to your computer.

!!! practice "To Do: Clone the repo"
    **Step 3a:** Find the repository url on the github page:

    ![clone repo](https://user-images.githubusercontent.com/3502975/67320638-7c7c1580-f4dc-11e9-8e6e-f5228bc96e86.png)

    **Step 3b:** Copy the url listed, and then in your terminal,

    ```sh
    $ git clone <url>
    ```
    ```
    remote: Enumerating objects: 18, done.
    remote: Counting objects: 100% (18/18), done.
    remote: Compressing objects: 100% (14/14), done.
    remote: Total 18 (delta 0), reused 0 (delta 0), pack-reused 0
    Unpacking objects: 100% (18/18), done.
    ```

    You should now have a new directory called `Assignment01-<your_username>/`.

!!! practice "To Do"
    **Step 4:** 
    First, change your working directory to `Assignment01-<your_username>/`, 
    (you remember how to [do this right](@ref cd)?).
    
    Then do `git status`

    ```sh
    Assignment01 $ git status
    ```
    ```
    On branch master
    Your branch is up to date with 'origin/master'.

    nothing to commit, working tree clean
    ```

    You now have a local copy of the "remote"[^2] repository.
    By default, the name of this remote is `origin`.

!!! note
    In principal, it is possible to have many remotes
    and many local copies,
    but in practice, you'll usually only have one of each.
    See the url of `origin`:

    ```sh
    Assignment01 $ git remote get-url origin
    ```
    ```
    https://github.com/wellesley-bisc195/Assignment01-<your_username>
    ```

    There are many other useful options for `git remote`.
    Take a look by executing `git remote --help`.

### Explore the assignment with the command line

The `Assignment01` repository has a directory called `src/`
(for "source code")
that contains some files ending in `.jl`.
These files contain some `julia` code.

Let's take a look at these files using the terminal:

```sh
Assignment01 $ ls src
```
```
Assignment01.jl		run.jl			some_variables.jl
assignment.jl		some_functions.jl
```

The `cat` command prints the contents of a file or files to the screen:

```sh
Assignment01 $ cat src/some_functions.jl
```
```
function say_name(name)
    println("Hi there, $(name)!")
end

function say_age(age)
    println("You are $age years old.")
end
```

!!! practice "To Do"
    Explore this directory from your terminal using `ls` and `cat`.
    Don't change the working directory, 
    or if you do, make sure you know how to return.

    When you're finished, you should be able to execute `pwd`
    and see a path that ends with `Assignment01-<your-username>`

### Explore the assignment with VS code

This assignment is just a directory with text files,
some of which contain code.

VS Code, which you should already have installed
(if you don't, [click here](@ref install-ide)),
is designed to explore exactly this kind of project.

!!! practice "To Do: open the assignment in VS Code"
    Open the VS Code app, then click `File -> Open`,
    and open the Assignment01 **directory**.

    You'll see the folder structure on the left,
    and you can click on individual files to open and edit them.

    This is one of the primary ways you will interact with your code
    in this course, so get comfortable!

### Run the code

You can run this code in your terminal:

!!! practice "To Do"
    ```sh
    Assignment01 $ julia src/run.jl
    ```
    ```
    Hi there, Kevin!
    You are 36 years old.
    ```

I'm guessing the output of this program is incorrect -
at least for you.

!!! practice "To Do"
    **Step 5**: Edit the files.

    Open up `src/some_variables.jl` in VS code
    and change the values "Kevin" and 36
    to be more appropriate.
    Be sure to save the file,
    then execute `julia src/run.jl` again.

    The output of the program should say your name
    and your age, rather than mine.



!!! practice "To Do"
    **Step 6:** Commit the changes.
    
    Once you have it working,
    go ahead and commit the changes.
    Be sure to use an informative commit message.

    Check out your commit history
    to see the changes you've made:

    ```sh
    Assignment01 $ git log --pretty=oneline | head
    ```
    ```
    372e3269256dbce109e4dc0b832e5ce95fca82bd remove old stuff from README
    126a20c75f8a4b19bef85edde9a30dc68f4ec20c add assignment files
    c4a1404ff3fa3aed01936dd474e144694b07efdb Files generated by PkgTemplates
    55dcf2bd2ddae163fbd657273cb3b0ec836e2386 Initial commit
    ```

You'll see something different, of course,
but at the top you should see you recent commits,
including the commit messages you wrote.

So far, this might seem like something
that could have been handled with google docs.
You only had to change a single file.
Let's try something a little more complicated.

If you open the files in VS Code,
you might notice that there are a bunch of connections
between the files.
For example, in `some_functions.jl`,
I've defined the `say_name()` and `say_age()` functions,
then in `run.jl`,
one of the first lines is
`include("some_functions.jl")`,
and in the `main()` function,
you can see `say_name(n)` and `say_age(a)`.

This is not an accident.

!!! practice "ToDo"
    **Step 7:**
    Change the line `function say_name(name)`
    in `some_functions.jl` to `function say_the_name(name)`,
    save the file,
    then try to run `julia src/run.jl` again.
    What happens?

    You should get an `UndefinedVarError`,
    since `run.jl` is trying to call something called `say_name`,
    but this doesn't exist anymore.

!!! tip
    Seeing error messages when you try to run code
    is a **very** normal part of programming,
    and not just when you're learning.
    A lot of the error message might seem like [gobbledygook](https://en.wikipedia.org/wiki/Gibberish),
    but it's worth paying attention.
    Learning to find the useful information in an error message
    is incredibly useful when trying to debug your code.

    Like most of coding, this takes lots of practice,
    but here are some places to start:

    - Can you find the name of the error?
    - Are their parts of the message in plain english?
      Those parts are usually quite helpful.
    - Can you find line numbers/file names
      pointing to where the problem might be?

OK, changing to `say_the_name` is maybe not worth it.
But you've now changed a bunch of things -
how do you get back to a working version?

In this silly little case, perhaps it's not so hard,
but in real-life coding,
one often needs to make many changes to many different files.
Git makes this easy.

Assuming you haven't made any new commits since you had a working program,
just do

```sh
Assignment01 $ git reset --hard HEAD
```

`HEAD` is short-hand for the last commit on this branch.
The `--hard` flag undoes any changes.
We'll talk about more complicated uses of `git reset` later.

!!! note
    If you did make commits in the mean time, no problem.
    Use the `git log` command from above to see your recent commits,
    then copy the commit hash (the weird sequence of characters on the left)
    and use that instead of `HEAD` in the `git reset` command.

### Practice

The variables `a` and `n` in `some_variables.jl` aren't very informative.
It's usually a good idea
to have variable and function names be "self documenting",
that is have the name tell you something about what they're for.

!!! practice
    Change these variables to `my_age` and `my_name` respectively,
    then fix `run.jl` so that it uses these new variables.

    Be sure to save the files and `commit` your changes
    when everything is working again
    (you can also commit intermediate steps).

## Complete the assignment

The `src` directory in the `Assignment01` repo
contains a code file called `assignment.jl`.

Open this file in VS Code
and follow the instructions in the comments.

!!! tip
    In julia, comment lines start with `#`,
    and this allows us to write plain english inside
    code files.

    These lines are skipped by the julia parser entirely,
    even if they contain valid code.

    The formatting of the comments might look a little weird,
    it allows me to generate [a website](@ref Instructions-for-Assignment01) from the code that's
    a bit easier too look at

Then use `git add` and `git commit`
to commit these changes to the repository.
You do not have to wait until you're finished to commit changes -
There are many different philosophies about what amount of work
should be included in a commit,
but my philosophy is "commit early, commit often."

!!! tip
    For files that are already being tracked,
    you can skip the two-step `add` and `commit`.
    Instead, you can do `git commit -a -m "commit message"` -
    the `-a` (or `--all`) flag automatically adds all previously tracked files.

Once you've made and committed the requested changes,
it's time to `push`[^3] those commits back to the remote.
When you cloned this repo,
git automatically set the remote tracking branch,
so you can just do

```sh
$ git push
```
```
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 12 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (4/4), 409 bytes | 409.00 KiB/s, done.
Total 4 (delta 2), reused 0 (delta 0)
remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
To https://github.com/wellesley-bisc195/lesson-2-bisc195tester
   be920ca..0da312f  master -> master
```

Good work!

# Key Terms

[^1]: `clone` - A copy of a repository in a different location.
    Clones can be linked to enable easy syncing of commits.
[^2]: `remote` - A clone of a repository that exists on a server,
    rather than your local machine.
    You can see what remotes are linked to your local repo
    with `git remote`.
[^3]: `push` - Move commits from a local repo to the remote.
