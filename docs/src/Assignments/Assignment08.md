# [Assignment 08](@id assignment08)

[![Assignment 07 - Due](https://img.shields.io/badge/Due-7%2F17%2F2020-orange?style=for-the-badge&logo=open%20badges)](@ref assignment08)

## Wrapping up Assignment07 Package

In the [previous assignment](@ref assignment07),
we created a julia package that you're going to be re-using
for the rest of the course.
But it doesn't have a very good name,
and at the moment, your assignments are in private repos, 
which makes some stuff (like using it for automated tests) harder.

!!! warning
    Before continuing, make sure that you've successfully completed
    assignment 7 and all of the tests are passing

First, let's make a new, public home for your bioinformatics package.

1. On github, create a new repository:

   ![Create repo](../assets/img/new-repo.png)

2. Give it a good name - Julia package names usually end with `.jl`.
   Be sure that the repo is set to `public`.

   ![Create repo](../assets/img/repo-name.png)

3. Copy the url of the repository
   
   ![Create repo](../assets/img/clone-repo.png)

4. On your computer, navigate to your `Assignment07-<username>` directory.
   We are now going to point `git` to this new location,
   so that when you make new changes in the future,
   they will go there instead.

   In the terminal,

   ```sh
   $ git remote set-url origin <paste URL here>
   $ git push -u origin trunk
   Enumerating objects: 61, done.
   Counting objects: 100% (61/61), done.
   Delta compression using up to 12 threads
   Compressing objects: 100% (46/46), done.
   Writing objects: 100% (61/61), 76.07 KiB | 1.46 MiB/s, done.
   Total 61 (delta 21), reused 24 (delta 7), pack-reused 0
   remote: Resolving deltas: 100% (21/21), done.
   To github.com:kescobo/BioinformaticsBISC195.jl.git
    * [new branch]      trunk -> trunk
   Branch 'trunk' set up to track remote branch 'trunk' from 'origin'.
   ```

5. Now let's rename the module in the julia code.
   Open the assignment _directory_ in VS Code.
   There are a few places that the module name currently exists -
   use `cmd+shift+F` (`ctrl+shift+F` on Windows) to open the search panel
   (you can also click the magnifying glass icon in the sidebar)
   and search for `Assignment07`. 

   Replace `Assignment07` with whatever you named your module,
   and then rename the main module file at `src/Assignment07.jl`.

6. Commit and push your changes.
7. Back on github, click on the `Settings` tab for your repository,
   then on `Manage access`, and add Kevin (`@kescobo`) as a collaborator.

##