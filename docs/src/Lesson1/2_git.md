# Part 2 - git for version control

If you've ever worked on an assignment
and ended up with a list of files like

- `assignment1.docx`
- `assignment1_v2.docx`
- `assignment1_v2_kevins_comments.docx`
- `assignment1_v3_fix_final.docx`
- `assignment1_v3_fix_final_for_real_this_time.docx`

... you'll understand the importance of version control.

It goes well beyond naming of course.
How can you tell what changed between version 1 and version2?
Does version 3 take the comments Kevin made on v2 into account?
Is `...fix_final_for_real_this_time` _really_ the last version?

It's even worse if multiple people are working on the same document.
If you and your lab partner are editing a document at the same time,
How can you gracefully merge the changes?
What if the changes you make and the changes she makes are incompatible?

Software like Google Docs can address some of these issues,
but incompatible changes can still occur.
Imagine you're writing an essay about a dog.
At the beginning of the essay, you've written

> The quick brown fox jumped over the lazy dog

You and your partner are both refining this epic story at the same time,
and further on you write,

> Because of how lazy the dog was, she didn't chase the fox.

But your partner decided the first line needed some more detail
and changes it to

> The quick brown female fox jumped over the lazy male dog.

so your pronouns are out of step.

In writing, a mistake like this might just look silly,
but in programming, it can mean your code doesn't run
or generates the wrong answer.
Even more critically,
code often involves many files working together,
and keeping track of the versions of multiple files at the same time is necessary.

## `git` is a program for "distributed version control"

`git` is a distributed version control system (DVCS).
That is, it helps one keep track of one's code,
and the information about versions is distributed among many systems.

!!! note
    Early version control systems were centralized -
    there was a single server that kept track of
    all of the information about a code repository.
    Users could "checkout" individual files to edit them,
    and the central repository would lock that file to prevent conflicting changes.
    This makes it easy to prevent conflicts,
    but is also a bit impractical.

    By contrast, git is distributed -
    each user's system contains the entire revision history,
    and conflicts between versions are explicitly managed when
    two different edits to the code are brought together.
    Don't worry if this isn't super clear at this stage -
    we'll get into some practical examples in a sec.

You can think of a `git` "repository" (usually shortened to "repo")
as a directory with super powers.
If you're looking at the directory using Finder or Explorer,
it might not look any different,
but it's much more powerful.
Before we get into that, though,
we need to get `git` installed.

### Installing git

If you are using Windows Subsystem for linux,
or a linux operation system, `git` should already be installed.

**Step 1:**

!!! practice "ToDo: Check if git is installed"
    Check if `git` is installed by executing `git --help` in the terminal.

    ```sh
    $ git --help
    ```
    ```
    usage: git [--version] [--help] [-C <path>] [-c <name>=<value>]
            [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
            [-p | --paginate | -P | --no-pager] [--no-replace-objects] [--bare]
            [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
            <command> [<args>]

    These are common Git commands used in various situations:

    start a working area (see also: git help tutorial)
    clone      Clone a repository into a new directory
    init       Create an empty Git repository or reinitialize an existing one
    # ... output truncated
    ```

    If you're using a Mac, git might not be installed.
    Executing the command above will probably result in an error message:

    ```
    bash: git: command not found...
    ```

    So you need to install it
    (if the `git` help message appeared, you can skip [to here](@ref configuring_git)).

    The easiest way to install git on a mac is using [`homebrew`](http://brew.sh).

**Step 1b**: 

!!! practice "ToDo: Install git"
    If you're using a mac and don't have git installed,
    enter the following commands into your terminal (excluding the `$`),
    then press `enter` to execute.

    ```sh
    $ xcode-select --install
    ```

    This may prompt you to download and install "command line developer tools"
    from the app store.
    If it does, click install and follow the prompts.
    When that's finished, and you see the command prompt (`$`) again, run the following command.
    Note: this is a case when you should probably use copy/paste.

    ```
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```
    ```
    ==> This script will install:
    /usr/local/bin/brew
    /usr/local/share/doc/homebrew
    /usr/local/share/man/man1/brew.1
    /usr/local/share/zsh/site-functions/_brew
    /usr/local/etc/bash_completion.d/brew
    /usr/local/Homebrew
    ==> The following new directories will be created:
    /usr/local/sbin
    # ...
    ```

    And follow the prompts.
    If you are asked for your password,
    use the one you use to log into your computer.
    Note that you will not see anything appear as you type,
    just type the password and hit `enter`.

### [Configuring git](@id configuring_git)

The next step is to tell git your name and email address,
so that you are credited with the changes you make to repositories.

**Step 2:**

!!! practice "ToDo: Configure git"
    Enter the following commands,
    changing the name and e-mail address to yours.

    ```sh
    $ git config --global user.name "Kevin Bonham, PhD"
    $ git config --global user.email kbonham@wellesley.edu
    ```

### Practice: Create your first git repository

**Step 3:**

!!! practice "ToDo"
    In your terminal,
    change your working directory to your `Documents` folder (`~/Documents`)

!!! compat "Windows Users"
    You can perform the following steps either in
    the `Documents/` folder of your linux filesystem found at `~/Documents`,
    or of your Windows filesystem, which is found at `/mnt/c/Users/<your_username>/Documents`

**Step 4:** 

!!! practice "ToDo"
    Next, create a new directory called `my_repo`.

!!! tip "Reminders"
    - `cd` is the command for changing working directory
    - `mkdir` is the command for making a directory

    Look back at the previous section for more information,
    and don't worry if you need to keep looking up stuff like this.
    The stuff you do regularly will become second nature,
    and the other stuff is always a Google search away.

**Step 5:** 

!!! practice "ToDo: initiate the repo"

    Now, change your working directory into the newly created `my_repo/`
    and initialize a git repository using the command `git init`

    ```sh
    my_repo $ git init
    ```
    ```
    Initialized empty Git repository in /home/kevin/Documents/my_repo/.git/
    ```

!!! warning "Checking Questions"
    Is the path shown in the output a *relative* or *absolute* path?

    If you use the command `ls` to list the contents of the current directory,
    can you see the `.git/` directory that was created?
    Why or why not?

**Step 6:** 

!!! practice "ToDo"
    Open the folder in your operating system's file system navigator
    (Finder on a Mac, Explorer in Windows).

    !!! compat "Windows Users"
        If you created the repository in the linux filesystem,
        the easiest way to do this is to execute `explorer.exe ./`
        from the command line.
        [See here](https://devblogs.microsoft.com/commandline/whats-new-for-wsl-in-windows-10-version-1903/)
        for more information about how the Windows and Linux filesystems interact.

    This folder appears empty right now,
    but in fact, there's a hidden `.git` folder
    that will include all of the version information
    for all of the files that you track.

    Let's see how this works.

**Step 7:** 

!!! practice "ToDo"
    open the [`VS Code`](https://code.visualstudio.com/) text editor and create a new file,
    then save it in your repository directory as `fox.txt`.

**Step 8:**

!!! practice "ToDo"
    In your terminal, list the contents of the directory
    to be sure the file was created.

    ```sh
    my_repo $ ls
    ```
    ```
    fox.txt
    ```

When you create new files, git does not track them automatically.
Let's see what git sees at the moment:

!!! practice "ToDo"
    ```sh
    $ git status
    ```
    ```
    On branch master

    No commits yet

    Untracked files:
    (use "git add <file>..." to include in what will be committed)

        fox.txt

    nothing added to commit but untracked files present (use "git add" to track)
    ```

So `git` sees the file exists,
but it tells you it's not being tracked.

**Step 9:**

!!! practice "ToDo"
    Let's fix that (the `status` message helpfully tells you how):

    ```sh
    my_repo $ git add fox.txt
    my_repo $ git status
    ```
    ```
    On branch master

    No commits yet

    Changes to be committed:
    (use "git rm --cached <file>..." to unstage)

        new file:   fox.txt
    ```

The file is now "staged"[^1] -
that is ready to be "committed."
In git, a "commit"[^2] is used to register a specific version of a repository.
The current state of all of the tracked files in the repository
will be recorded.

We don't really need to track an empty file,
let's add some text to it.

**Step 10:** 

!!! practice "ToDo"
    In Atom, add the following line to `fox.txt` **and save**.

    ```
    The quick fox jumped.
    ```

    Now, back in the terminal, what's the status?

    ```sh
    $ git status
    ```
    ```
    On branch master

    No commits yet

    Changes to be committed:
    (use "git rm --cached <file>..." to unstage)

        new file:   fox.txt

    Changes not staged for commit:
    (use "git add <file>..." to update what will be committed)
    (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   fox.txt
    ```

Notice that `fox.txt` now appears under both
"Changes to be committed" and
"Changes not staged for commit".

Why?
Because you initially staged an empty file,
and now there's a modified version of the file that has not been staged.
You can see the difference between the current state of the file
and what's staged using `git diff`

```sh
$ git diff fox.txt | cat
```
```
diff --git a/fox.txt b/fox.txt
index e69de29..395235f 100644
--- a/fox.txt
+++ b/fox.txt
@@ -0,0 +1 @@
+The quick fox jumped.
```

The syntax of this output is perhaps a bit confusing,
but it's saying that a line was added to `fox.txt`.

**Step 11:** 

Let's go ahead and stage this change,
and then make our first commit.

!!! practice "ToDo"
    ```sh
    $ git add fox.txt
    $ git commit -m "my first commit"
    ```
    ```
    [master (root-commit) b183d56] my first commit
    1 file changed, 1 insertion(+)
    create mode 100644 fox.txt
    ```

    ```sh
    $ git status
    ```
    ```
    On branch master
    nothing to commit, working tree clean
    ```

Congratulations! You have a git repository.

### Just keep committing

!!! practice
    Try making some more changes to this file,
    make some new files,
    and use `git add`,
    `git commit`, and
    `git status`
    to keep track of those changes.

!!! danger
    If you enter `git commit` without including a commit message
    with the `-m` flag,
    your terminal may transform into a text editor.
    If this happens,
    you may find it difficult to return to the command prompt.
    Try typing (don't copy/paste) `:q!` then `enter`.

    If this doesn't work, ask for assistance.
    If Kevin or the TAs are unavailable,
    you can always close and re-open your terminal.

    In either case, your commit will be aborted.

## Using git in this course

It might not be clear to you yet why
using a version control system is worthwhile.
If you don't trust me,
the fact that almost every software company uses git (or something similar)
should give you some confidence that it's important.

In any case, this entire course will use git and github.com
(a website for managing and collaborating on git repositories).
In the [first assignment](@ref Assignment01),
you'll learn how to do this.

[^1]: `staged` - Files with changes that are ready to be committed.
[^2]: `commit` - A unique reference to a specific state of a repository.
