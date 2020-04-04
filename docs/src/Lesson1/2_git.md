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

**Step 1:** check if `git` is installed by executing `git --help` in the terminal.

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

**Step 1b**: If you're using a mac and don't have git instealled,
copy and paste the following command into your terminal (excluding the `$`),
then press `enter` to execute.

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

**Step 2:** Enter the following commands,
changing the name and e-mail address to yours.

```sh
$ git config --global user.name "Kevin Bonham, PhD"
$ git config --global user.email kbonham@wellesley.edu
```

### Practice: Create your first git repository

**Step 3:** In your terminal,
change your working directory to your `Documents` folder (`~/Documents`)

!!! note "Windows Users"
    You can perform the following steps either in
    the `Documents/` folder of your linux filesystem found at `~/Documents`,
    or of your Windows filesystem, which is found at `/mnt/c/Users/<your_username>/Documents`

**Step 4:** Next, create a new directory called `my_repo`.

!!! tip "Reminders"
    - `cd` is the command for changing working directory
    - `mkdir` is the command for making a directory

    Look back at the previous section for more information,
    and don't worry if you need to keep looking up stuff like this.
    The stuff you do regularly will become second nature,
    and the other stuff is always a Google search away.

**Step 5:** Now, change your working directory into the newly created `my_repo/`
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

**Step 6:** Open the folder in your operating system's file system navigator
(Finder on a Mac, Explorer in Windows).

!!! note "Windows Users"
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

**Step 7:** open the [`Atom`](http://atom.io) text editor and create a new file,
then save it in your repository directory as `fox.txt`.

**Step 8:** In your terminal, list the contents of the directory
to be sure the file was created.

```sh
my_repo $ ls
```
```
fox.txt
```

When you create new files, git does not track them automatically.
Let's see what git sees at the moment:

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

**Step 9:** Let's fix that (the `status` message helpfully tells you how):

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

The file is now "[^staged]" -
that is ready to be "committed."
In git, a "[^commit]" is used to register a specific version of a repository.
The current state of all of the tracked files in the repository
will be recorded.

We don't really need to track an empty file,
let's add some text to it.

**Step 10:** In Atom, add the following line to `fox.txt` **and save**.

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

**Step 11:** Let's go ahead and stage this change,
and then make our first commit.

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

### Practice: Just keep committing

Try making some more changes to this file,
make some new files,
and use `git add`,
`git commit`, and
`git status`
to keep track of those changes.

!!! warning
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
So let's work on doing that.

### Cloning a repository

**Step 0a:** If you haven't already, sign up for a github account at https://github.com/join

!!! warning "Privacy Note"
    You do not need to use your `wellesley.edu` email address to create this account,
    but let Kevin know if you use a different address
    so that you get credit for your work.

**Step 0b:** If you'd like, you may sign up for a [github student discount pack](https://education.github.com/pack). This is not necessary for this course.

**Step 1:** Accept `Assignment1` at [this link](https://classroom.github.com/a/M0Xe9uT2)

When you accept the assignment,
a git repository is created in your github account.

**Step 2:** Click the link shown on the webpage

![accept assignment](https://user-images.githubusercontent.com/3502975/67243455-8ee74800-f425-11e9-867e-c81368c82cad.png)

This repository contains a lot more stuff than the repository you made above,
but it's simply a directory with subdirectories and files
(plus git superpowers of course).
You can click on the directories and files
to see their contents.

Of course, this repository is stored on github, not your computer.
We can fix that by [^clone]ing this repository
to your computer.

**Step 3a:** Find the repository url on the github page:

![clone repo](https://user-images.githubusercontent.com/3502975/67320638-7c7c1580-f4dc-11e9-8e6e-f5228bc96e86.png)

**Step 3b:** Copy the url listed, and then in your terminal,

```sh
$ git clone <paste-url>
```
```
remote: Enumerating objects: 18, done.
remote: Counting objects: 100% (18/18), done.
remote: Compressing objects: 100% (14/14), done.
remote: Total 18 (delta 0), reused 0 (delta 0), pack-reused 0
Unpacking objects: 100% (18/18), done.
```

You should now have a new directory called `lesson1-<your_username>/`.

**Step 4:** Change your working directory back to lesson-1, and do `git status`

```sh
lesson1 $ git status
```
```
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```

You now have a local copy of the [^remote] repository.
By default, the name of this remote is `origin`.

In principal, it is possible to have many remotes
and many local copies,
but in practice, you'll usually only have one of each.
See the url of `origin`:

```sh
lesson1 $ git remote get-url origin
```
```
https://github.com/wellesley-bisc195/lesson1-<your_username>
```

There are many other useful options for `git remote`.
Take a look by executing `git remote --help`.

### Example use case

The `Lesson1` repository has a directory called `example`
that contains some files ending in `.py`.
These files contain some python code.

Let's take a look at these files using the terminal:

```sh
lesson1 $ ls example
```
```
run.py            some_functions.py some_variables.py
```

```sh
lesson1 $ head example/some_functions.py
```
```
def say_name(name):
    print("Hi there {}!".format(name))

def say_age(age):
    print("You are {} years old".format(age))
```

**Step 1:** You can run this code in your terminal:

```sh
lesson1 $ python example/run.py
```
```
Hi there Kevin!
You are 35 years old
```

I'm guessing the output of this program is incorrect -
at least for you.

**Step 2:** Open up `example/some_variables.py`
and change the values to be more appropriate.
Be sure to save the file,
then execute `python example/run.py` again.

**Step 3:** Once you have it working,
go ahead and commit the changes.
Be sure to use an informative commit message.

Check out your commit history
to see the changes you've made:

```sh
lesson1 $ git log --pretty=oneline | head
```
```
573c6bc36101053ba4189b95842462906b1fa898 Merge pull request #1 from wellesley-bisc195/assignment
ef95f6c6a59cbb59394cb9de468656c35f619b26 add Project.toml to test
1efa59fcbda7751fd39e3cda85c469aaaafc6ed0 fix tests
40236a8271349c3ac7ca5d922809eb1d9197932b use comp bio course repo
e9db777df8e4ecf7dd54cb67ca2e2c971d3df5cb end function
bca2885725384e2827d18d4b57244f04c8290f71 remove docs, work on assignment
```

You'll see something different, of course,
but at the top you should see you recent commits,
including the commit messages you wrote.

So far, this might seem like something
that could have been handled with google docs.
You only had to change a single file.
Let's try something a little more complicated.

If you open the files in atom,
you might notice that there are a bunch of connections
between the files.
For example, in `some_functions.py`,
I've defined the `say_name()` and `say_age()` functions,
then in `run.py`,
one of the first lines is
`from some_functions import say_name, say_age`,
and in the `main()` function,
you can see `say_name(n)` and `say_age(a)`.

This is not an accident.

**Step 4:** Change the line `def say_name(name):`
in `some_functions.py` to `def say_the_name(name):`,
save the file,
then try to run `python example/run.py` again.
What happens?

You should get an `ImportError`,
since `run.py` is trying to import something called `say_name`,
but this doesn't exist anymore.

**Step 5:** Now fix the line starting with `from some_functions`,
to import `say_the_name` instead of `say_name`.
Can you run the code now?

Nope, you should now be getting a `NameError`,
since you didn't change the call to `say_name` inside the `main()` function.

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
    - Are their parts of the message in plain english
      (those parts are usually quite helpful)?
    - can you find line numbers/file names
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
lesson1 $ git reset --hard HEAD
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

The variables `a` and `n` in `some_variables.py` aren't very informative.
It's usually a good idea
to have variable and function names be "self documenting",
that is have the name tell you something about what they're for.
Change these variables to `my_age` and `my_name` respectively,
then fix `run.py` so that it uses these new variables.

Be sure to save the files and `commit` your changes
when everything is working again
(you can also commit intermediate steps).

## Assignment1

The `src` directory in the `Lesson1` repo
contains a code file called `assignment.jl`.

Follow the instructions in the comments
(remember, comment lines in `julia` files start with `#`),
then use `git add` and `git commit`
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
it's time to [^push] those commits back to the remote.
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

[^staged]: Files with changes that are ready to be committed.
[^commit]: A unique reference to a specific state of a repository.
[^remote]: A clone of a repository that exists on a server,
    rather than your local machine.
    You can see what remotes are linked to your local repo
    with `git remote`.
[^push]: Move commits from a local repo to the remote.
