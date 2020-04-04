# Part 1 - Navigating the filesystem using the terminal

You are probably already familiar with
your computer's **[^filesystem]**.
If you've ever looked at files on your `Desktop`,
or opened `Finder`/`Explorer` and navigated to your `Documents` folder,
you've been using the file system.
Data is stored on your hard drive as a continuous binary sequence (just `1`s and `0`s)
and without a filesystem, it would be impossible to find anything!

`Finder`/`Explorer` are software programs used to interact with your filesystem.
The filesystem contains a mix of files,
which are blobs of information (eg. a `.docx` file containing a MS Word doc)
and folders, which can contain files as well as other folders.
Just to be confusing,
what we colloquially call folders are technically called "directories."
I will use the terms interchangeably.

![File system hierarchy](https://www.oreilly.com/library/view/macintosh-terminal-pocket/9781449328962/httpatomoreillycomsourceoreillyimages1448104.png)

You may not have thought much about how the filesystem is organized,
but you probably have an intuitive sense of how this works.
Your **[^home]** directory contains the `Desktop` and `Documents` directories,
each of which might contain many other subdirectories and/or files,
and each subdirectory may have yet more subdirectories and files and so on.

`Finder`/`Explorer` are examples of a graphical user interface (GUI - pronounced "gooey"),
that is a program that allows you to interact with it visually.
However, GUIs are difficult to design and maintain,
so most bioinformatics tools are built around **[^commandline]**
or text-based interfaces.
The good news is that the organization of the filesystem
is the same whether you're interacting with it in a GUI or in the terminal.
And once you learn how to use the command line interface,
you'll see that it is a powerful way to get a lot done quickly.

## 1.1: Open the terminal application

**Mac Users**:  
1. Open Applications
2. Click Open the `Terminal` application

**Windows Users**:  
1. Click Start -> Programs
2. Open Windows Subsystem for Linux

You will be greeted with a white or black box that contains some text,
and a cursor next to the dollar symbol `$`.
This is the command prompt.

!!! tip
    Using the terminal can be quite challenging at first.
    For one, you cannot interact with text
    in the same way as you would in a word-processing program
    like Microsoft Word.
    In particular,
    you can't use your mouse to do things like click to move a cursor,
    or highlight a section of text to be deleted.
    Instead, you have to use `←` and `→` keys.

## 1.2 Walk around your file system

Think of your filesystem as a branching network of roads
that you can walk along.
Each directory is a location that has a path back to its parent directory,
may or may not contain objects (files),
and may have one or many roads leading to new locations (subdirectories).

Your present location,
referred to as the **[^workingdirectory]**,
is your home folder when you first open the terminal.
Let's see where that is.

In your terminal, type `pwd` and press enter.
This is the "print working directory" command.

```sh
$ pwd
```
```
/home/kevin
```

If you're using a Mac,
this probably displayed something like `/Users/yourname`.

!!! tip
    Whenever you see code blocks in these lessons that start with `$ `,
    this is a hint that it is a shell command.
    When copying or typing these commands,
    **do not** include the `$ ` (or anything to the left of it).
    For example, to complete the task above,
    you should only type `pwd`,
    then press enter.

    `$` is referred to as the "prompt" or "command prompt."
    When you enter a command, you may or may not see some output
    (which will not be preceded by `$`)
    and once the command has finished executing,
    you will see a new prompt.

    **NOTE:** These code blocks will often be followed by a block
    that does **not** start with a `$`.
    This is the expected output;
    you shouldn't try to copy-past this into your terminal.

Let's take a look around.
the `ls` command is used to `l`i`s`t
the contents of the directory.

```sh
$ ls
```
```
bin      Documents     R       scratch
Desktop  Downloads     Public  repos
```

Your output will likely look a bit different from mine,
but you'll probably see `Documents` and `Desktop`,
as well as other directories you may recognize.

!!! note "Windows Users"
    You may not see any output.
    This is because the default Ubuntu installation on Windows
    doesn't have any directories or files in the home folder.
    But we can actually trick the shell
    into using the Windows home folder instead.
    In the following command,
    replace `<yourname>` with your Windows username.

    ```sh
    $ export HOME=/mnt/c/Users/<yourname>
    $ cd ~
    $ pwd
    /mnt/c/Users/<yourname>
    ```

    Now, enter `ls` again,
    and you should see the contents of your Windows home folder.


The `ls` command can also take a directory
as an "[^argument]."
We'll talk more about what that means later -
for now, just add `Desktop` to the command, separated by a space

```sh
$ ls Desktop
```
```
df.csv  dm.csv  dupes.csv  itp.svg
```

Again, your output should look different from mine,
but (assuming you store anything on your Desktop),
you should see a list of files and directories.
If your `Desktop` is pristine, congratulations!
You won't see any output.

The filesystem is organized hierarchically -
At the very top of the hierarchy is the **[^root]**,
which you can think of as a folder that contains all other files and folders.
On a Mac (and other Unix systems),
the root is referred to with a single forward slash (`/`),
While on Windows machines, the root is probably `C:\`.

!!! note "Windows Users"
    When you open Windows Subsystem for Linux, you're actually running
    a fully functional OS with its own file system.
    As a result, when you type `pwd` in the terminal,
    you will see something like `/home/yourname`,
    rather than seeing your Windows OS home folder.

    But WSL has access to your files in a special path, `/mnt/c/`.
    If you want to see the files in your Windows `Desktop/` directory for example,
    look in `/mnt/c/Users/yourname/Desktop`.

### Moving around

Say you are sitting in your room,
and you want to give someone directions to [Lulu](https://w100.wellesley.edu/lulu).
One way to do this would be to give directions from where you are:

1. Go out the door,
2. Go down the hall to the elevator
3. ... etc

In this case,
you're providing a [^relativepath] -
the directions only make sense if the person is starting in your room.
If they're at the Science Center and they follow your instructions,
they will become hopelessly lost.

Alternatively,
you could provide directions from a shared point of reference.

1. Start at the campus gate on the corner of Weston Rd and Central St
2. Walk down the path and turn right just past the Child Study Center
   towards the Botanical Gardens
3. ... etc

In this case,
you're providing an [^absolutepath] -
no matter where the person is at the time,
the directions will make sense.

An absolute path is great,
since the same instructions are useful in most situations,
but in many cases, it would be tedious to always have to start instructions
from the same location.

When providing a file path to a unix operating system,
you can also provide relative or absolute paths.
There are two shared points of reference,
your home folder and `root`,
which are specified by `~/` and `/` respectively
when placed at the beginning of the path.

Up above, when we looked at the contents of the Desktop using ls,
we provided the _relative path_ from where we were in the home folder.
You can tell, because the path did not start with `~/` or `/`.

We could have done the same thing using an _absolute path_:

```sh
$ ls ~/Desktop
```
```
df.csv  dm.csv  dupes.csv  itp.svg
```

The output here should be the same as what you got above.
But what if we're in a different location?

In order to `c`hange the working `d`irectory,
we use the `cd` command,
giving a path as an argument.
For example, to make `Desktop` the current working directory:

```sh
$ cd ~/Desktop
```

!!! warning "Checking Question"
    Is `~/Desktop` a relative or absolute path?

It's a good idea (in general, but especially while learning)
to repeatedly check that
the thing you think happened actually happened.

```sh
$ pwd
```
```
/home/kevin/Desktop
```
```sh
$ ls
```
```
df.csv  dm.csv  dupes.csv  itp.svg
```

Notice that with `ls`,
we didn't have to give `Desktop` as an argument this time.
By default, `ls` lists files in the current working directory.

!!! warning "Checking Questions"
    1. What does `pwd` stand for?
    2. What does `ls` stand for?
    3. With `Desktop` as your working directory,
        how would you list the contents of your home folder?

Let's go back to the home folder.
Again, we can provide a relative or an absolute path -
the absolute path back to home is always `~/`,
but how do we do the relative path?
To walk into subdirectories,
we can just provide the name of the subdirectory,
but how do we walk "backwards",
into a parent directory?

In unix, parent directories are indicated with `../`.
So to go back home from `/home/kevin/Desktop` using a relative path,
I would write:

```sh
$ cd ../
$ pwd
```
```
/home/kevin
```
It is possible to be more specific about where you want to go after moving
up a directory. For example, I could write `../Documents` to go up a directory
and then move into my Documents folder.

You can also move up more than just one directory. For example, you can go up two directories with `../../`

### Practice

Practice moving around your file system using `cd`,
and checking where you are using `pwd` and `ls`.
If you get lost,
just enter `cd ~/` to get yourself home.

!!! tip
    Rather than typing long paths (or even short ones),
    use the `<TAB>` key to do auto-completion.
    For example, with your home folder as your current working directory,
    type `ls De` (don't execute), then press `<TAB>`.
    This should cause the terminal to fill in `ls Desktop` automatically.

    Try typing `ls Do`, then `<TAB>`.
    The first time, nothing happens.
    Why? Because both `Documents` and `Downloads` are valid completions,
    and the terminal doesn't know which one you want.
    If you hit `<TAB>` again,
    it will display all of the options available.
    If you add a `c`, then hit `<TAB>`, it should complete `Documents`.

    As you're navigating around,
    try to do as little typing as possible.
    Get into the habit of typing a little bit of a path,
    then hitting `<TAB>` (twice if nothing shows up the first time).

## 1.3 Manipulating files and directories

Of course, looking around is not the only thing you can do from the terminal.
Using the terminal allows you to rapidly
view, edit, and otherwise manipulate
stuff in your file system.

!!! danger
    It is possible to seriously and irreparably damage your computer
    using commands from the terminal.

    Be sure to follow instructions carefully,
    and be sure to keep your backups current.

First, let's create a directory for use in this course.
You can put it in your home directory,
or in `Documents`,
or if you have a directory where your course files usually go,
that's fine too.

I'll assume you're making this in `~/Documents/`,
but if you want it somewhere else,
just modify the path accordingly.
the command to `m`a`k`e a `dir`ectory is `mkdir <path>`.

!!! tip
    In many examples like this,
    I will refer to things wrapped in `<>`,
    like `<path>` or `<username>`.
    These are stand-ins for some other value.
    This is a signal that you should replace that text
    (including the `<` and `>` characters)
    with the appropriate value.

### Create and explore directories and files

```sh
$ mkdir ~/Documents/bisc195
$ cd ~/Documents/bisc195
$ pwd
```
```
/home/kevin/Documents/bisc195
```

Now, copy and execute the following command -
don't worry about what it does.
(if you really want to know, you can read about it here: [^whileloop])

```sh
bisc195 $ for i in {1..10}; do echo "This is file #${i}" > "file${i}.txt"; done
```

It should finish very quickly.
Let's look at what it did

```sh
bisc195 $ ls
```
```
file1.txt  file2.txt  file4.txt  file6.txt  file8.txt
file10.txt file3.txt  file5.txt  file7.txt  file9.txt
```

The code you executed created 10 files,
each of which contains a bit of text.
Look at the contents of `file1.txt` using the `head` command.

```sh
bisc195 $ head file1.txt
```
```
This is file #1
```

The `head` command prints the first 10 lines of a file by default,
but this file only has 1 line, so that's all that's shown.

!!! note
    File names usually have 2 parts - the name and the "extension."
    The extension, like `.txt` or `.docx`,
    usually tells you something about what the file contains,
    or how it's encoded,
    but this is not a requirement.
    The files above could have been named `fileX.whatever`,
    and still have the same content.
    Usually, it's a good idea to have the extension reflect what's in the file,
    `.txt` for text, `.jl` for julia code etc.

We can look at multiple files at the same time using the con`cat`enate command:

```sh
bisc195 $ cat file1.txt file2.txt file3.txt
```
```
This is file #1
This is file #2
This is file #3
```

`cat` takes any number of files (even just 1!)
and prints their entire content to the screen one after another.
Be careful - some files are really long,
and will go on and on and on and on and...

### Glob patterns

```@raw html
<p>If we want to print the content of all 9 files,
we could type them all out,
but that would get tedious.
There are many useful shortcuts in programming
(programmers <del>are lazy</del> like efficiency),
one of which is <a href=https://en.wikipedia.org/wiki/Glob_%28programming%29>glob</a> patterns.</p>
```

The most common `glob` is `*`,
which stands for any number of characters,
including none.

For example,

```sh
bisc195 $ cat *.txt
```
```
This is file #1
This is file #10
This is file #2
This is file #3
This is file #4
This is file #5
This is file #6
This is file #7
This is file #8
This is file #9
```

Here, `*.txt` means "anything that ends with `.txt`".

Another `glob` is `?`, which matches any single character.

```sh
bisc195 $ cat file?.txt
```
```
This is file #1
This is file #2
This is file #3
This is file #4
This is file #5
This is file #6
This is file #7
This is file #8
This is file #9
```

Notice that in this example, `file10.txt` is not included,
since there are 2 characters between `file` and `.txt`.

Finally, you can use brackets to specify specific characters,
or ranges of characters:

```sh
bisc195 $ cat file[2468].txt
```
```
This is file #2
This is file #4
This is file #6
This is file #8
```

```sh
bisc195 $ cat file[6-8].txt
```
```
This is file #6
This is file #7
This is file #8
```

Let's make a new file that contains the content of all of the others.
The `>` character at the end of a command
redirects the output of that command into a new file,
so we can do:

```sh
bisc195 $ cat file*.txt > all_files.txt
bisc195 $ ls
```
```
all_files.txt file10.txt    file3.txt     file5.txt     file7.txt     file9.txt
file1.txt     file2.txt     file4.txt     file6.txt     file8.txt
```

Notice that the `cat` command in this case
didn't print anything to the screen.

We can check that the right content went into `all_files.txt`
using `cat` again.

```sh
bisc195 $ cat all_files.txt
```
```
This is file #1
This is file #10
This is file #2
This is file #3
This is file #4
This is file #5
This is file #6
This is file #7
This is file #8
This is file #9
```

### `m`o`v`e and `c`o`p`y files

We'll use this directory for the rest of this course,
but it could use some more organization.
First, let's make a directory called `lesson1`.

Can you remember how to make a new directory?
I'm not going to provide the command for this step,
but before moving on,
you should be able to execute the following command without getting an error:

```sh
bisc195 $ ls lesson1/
bisc195 $
```

When you first create the directory,
it will be empty,
so `ls` won't return anything.

If you see `ls: lesson1: No such file or directory`,
don't move on to the next step.

!!! warning
    Neither the `mv` nor `cp` command ask before overwriting files,
    and there's no "undo" at the command line.
    In other words, if you move or copy a file
    into a directory with file of the same name,
    the later file will be destroyed and will not be recoverable.

    Use caution when using these commands outside the context of these lessons.

Once you've created the `lesson1/` directory,
let's `m`o`v`e the text files we've created into it.
The `mv` command take the form `mv <source> <destination>`.
For example:

```sh
bisc195 $ mv file1.txt lesson1/file1.txt
bisc195 $
```

Now,

```sh
bisc195 $ ls lesson1
```
```
file1.txt
```

```sh
bisc195 $ ls
```
```
all_files.txt file2.txt     file4.txt     file6.txt     file8.txt     lesson1
file10.txt    file3.txt     file5.txt     file7.txt     file9.txt
```

As you can see, `file1.txt` has been moved to the `lesson1/` subdirectory,
and is no longer in the current directory.

If we don't want to change the name of the file,
we can actually just provide a directory as the destination,
rather than typing out the entire new path.

```sh
bisc195 $ mv file2.txt lesson1/
bisc195 $ ls lesson1
```
```
file1.txt file2.txt
```

In this way, we can move multiple files at the same time,
separated by spaces,
as long as the final argument is a directory:

```sh
bisc195 $ mv file3.txt file4.txt file5.txt lesson1/
bisc195 $ ls lesson1/
```
```
file1.txt file2.txt file3.txt file4.txt file5.txt
```

Remember, `ls` without an argument shows us the contents
of the current directory.

```sh
bisc195 $ ls
```
```
all_files.txt file10.txt    file6.txt     file7.txt     file8.txt     file9.txt     lesson1
```

!!! info "Practice"
    Can you figure out how to move the rest of the `file*.txt` files
    to the `lesson1/` directory using a glob pattern?

Once you've moved all the text files _other than_ `all_files.txt`
into the `lesson1` folder,
change the working directory to `lesson1` using `cd`

!!! tip
    If you accidentally moved `all_files.txt` into `lesson1/`,
    you can move it back using the relative path `./`,
    which means "current directory."
    In other words, from the `bisc195` directory,
    you can execute `mv lesson1/all_files.txt ./`.

    Alternatively, if you've already done `cd lesson1`,
    you can do `mv all_files.txt ../`.
    Recall that `../` means "parent directory."

The `c`o`p`y command works the same way as `mv`,
except that the original stays where it is.

Check to make sure you're in the `lesson1` directory:

```sh
lesson1 $ pwd
```
```
/home/kevin/Documents/bisc195/lesson1
```
```sh
lesson1 $ ls ./
```
```
file1.txt  file2.txt  file4.txt  file6.txt  file8.txt
file10.txt file3.txt  file5.txt  file7.txt  file9.txt
```
```sh
lesson1 $ ls ../
```
```
all_files.txt lesson1
```

Let's copy `all_files.txt` into the current directory using `cp`:

```sh
lesson1 $ cp ../all_files.txt ./
lesson1 $ ls
```
```
all_files.txt file10.txt    file3.txt     file5.txt     file7.txt     file9.txt
file1.txt     file2.txt     file4.txt     file6.txt     file8.txt
```
```sh
$ ls ../
```
```
all_files.txt lesson1
```

As you can see,
`all_files.txt` is now present in both the parent `bisc195/` directory
_and_ the `lesson1/` directory.


!!! tip "Practice"
    Make a copy of `file1.txt` called `file1_second.txt`
    in the `lesson1/` directory.
    To check that you've succeeded,
    execute `ls file1*.txt`, and the output should be
    `file1.txt file10.txt file1_second.txt`

### Rename and `r`e`m`ove files

!!! warning
    Once again, there is NO undo when using the terminal.
    I once deleted 10 Gb of sequencing files from a lab server
    in 2 seconds with a 13 character command.

    Please use care with these commands.

We actually don't need 2 copies of the `all_files.txt`.
Let's `r`e`m`ove the one in the `bisc195` directory.

```sh
lesson1 $ rm ../all_files.txt
lesson1 $ ls ../
```
```
lesson1
```

Come to think of it - we don't need any of these files.
Let's remove them all.

!!! warning
    I know, I'm repeating myself.
    `rm` combined with glob patterns can do a lot of damage very quickly.
    Beware!

Before we do anything, verify we're still in the `lesson1` directory
using `pwd` and `ls`.

Then, remove all of the `.txt` files in the current directory:

```sh
lesson1 $ rm *.txt
lesson1 $ ls
lesson1 $
```

We don't need the `lesson1` directory either.
First, move to the parent directory (`bisc195/`) using `cd`.
`rm` doesn't work on directories:

```sh
bisc195 $ rm lesson1
```
```
rm: lesson1: is a directory
```

Instead, use the `r`e`m`ove `dir`ectory command:

```sh
bisc195 $ rmdir lesson1
bisc195 $ ls
bisc195 $
```

## Summary

- `cd` changes the current working directory
- `pwd` prints (shows) the current working directory
- `ls <path>` lists the contents of a directory
    - `ls` without a path argument lists the contents of the current working directory
    - `ls <glob>` lists the files/directories matching a pattern (eg ls *.txt)
- use relative or absolute paths
    - aboslute paths start with `/` (root) or `~/` (home)
    - relative paths start with `./`, `../` or file and directory names
- `mkdir` for creating directories
- `mv <source(s)> <destination>` to move files and directories
- `cp <source(s)> <destination>` to copy files and directories
- glob patterns can be used to act on many files at once
    - `*` = 0 or more characters (eg. *.txt)
    - `?` = exactly 1 character (eg. file?.txt)
    - `[]` = specific characters or range of characters
        - eg `file[246].txt` = `file2.txt file3.txt file6.txt`
        - eg `file[5-7].txt` = `file5.txt file6.txt file7.txt`
- `rm` removes files
- `rmdir` removes (empty) directories

## Key Terms

[^filesystem]: a hierarchical organization of files and directories. [Additional reading](https://en.wikipedia.org/wiki/File_system)

[^root]: the top of the filesystem hierarchy. A folder that contains all other files and folders.

[^home]: a user's primary folder containing `Desktop`, `Documents`, and other user-specific folders and files.

[^commandline]: a text-based interface for interacting with your computer. Also referred to as "terminal" or "shell."

[^workingdirectory]: the current beginning of relative paths. Equivalent to `.` or `./`

[^relativepath]: a path originating at the current working directory

[^absolutepath]: a path originating at the home folder (`~/`) or root `/`

[^argument]: a value passed to a function to operate on

### More info

Here's some more information for the curious,
but at least for now,
it's not necessary to understand it.

[^whileloop]: The code

      ```sh
      for counter in {1..10}; do echo "This is file #${counter}" > "file${counter}.txt"; done
      ```

      is an example of a "for loop",
      which we'll learn more about later.
      This executes code in a loop,
      usually with something changing each time.
      Here, the code `for counter in {1..10}` means
      "run this loop for each of the values from 1-10",
      and also provides a `counter` variable with that value.

      Inside the loop is a single command:
      `"This is file #${counter}" > "file${counter}.txt""` means
      "write the text 'this is file #1' in a file called `file1.txt`"
      when the value of `counter` is 1,
      "write the text 'this is file #2' in a file called `file2.txt`"
      when the value of `counter` is 2,
      etc.

      So, in the first cycle of the loop, `file1.txt` is created.
      We then go to the top of the loop, reset the counter,
      then we go again - `file2.txt` is created,
      the value of `counter` is set to 3,
      and so on.

      When `file10.txt` is created, the  loop is finished (`done`).
      All of this should take less than a second to execute.
