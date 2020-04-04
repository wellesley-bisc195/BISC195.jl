# Step 0: Windows users need Windows Subsystem for Linux (WSL)

If you are working on a Mac,
you can skip this section and go straight to
[Getting started with the terminal](#). <!-- TODO: Add link -->

The inner guts of the Windows operating system
are different than those of Mac and Linux.
The bad news is, many computational biology tools
expect the later, a so-called "Unix" environment.
The good news is that Windows 10 has a way
to run a Unix environment side-by-side with Windows.

!!! note "Windows Users"
    Throughout this course,
    you will see boxes like this labeled "Windows Users."
    These contain information about ways in which
    Windows is different from Unix operating systems.
    Pay careful attention to these boxes,
    since other instructions may be unclear if you don't modify them accordingly.

Much of this guide was cribbed from [Michael Treat's guide](https://github.com/michaeltreat/Windows-Subsystem-For-Linux-Setup-Guide),
which has a lot more information and [a video](https://youtu.be/GYuv37yPmGM?t=207)
that you may find useful.

Before you begin check to make sure that you have the [most recent version of Windows 10](https://support.microsoft.com/en-us/help/4028685/windows-10-get-the-update).

## Step 0.1 - Enable the WSL Feature through Windows.

1. Right click on the start menu and click on Settings.
1. In the Search box, type `Turn Windows Features On Or Off` and click on the item that populates in the list.
1. A window will pop up with a list of folders with checkboxes next to them. Scroll down and check the box for `Windows Subsystem for Linux`.

This will install the needed files. Follow any directions that pop up and restart when asked.

This guide might not open after restart, so be sure to make note of the url or star this repo.

## Step 0.2 - Install the Ubuntu app from the Windows Store.

1. Click here to go to Microsoft store and install the [Ubuntu App](https://www.microsoft.com/en-us/store/p/ubuntu/9nblggh4msv6?activetab=pivot%3aoverviewtab)
1. Follow the on-screen prompts to install the app.
1. When the app is ready, the button that said 'Install' will change to say 'Launch'. Click Launch. This will start the Ubuntu installation. This installation only happens the first time the app is launched. It's the actual Ubuntu (or Linux) OS installing and mounting to your Windows FS.

## Step 0.3 - Finish Installing the Ubuntu App.

1. It will ask you to enter a username.
   This will be the root / admin user for the Ubuntu FS.
   Do not include spaces in your username.
1. It will then ask you to enter and confirm a password.
   Also note that it will protect your password by not displaying it to the screen when you type,
   but it is registering your key strokes.

!!! note
     Security is important at all levels,
     so even though you have to use this password often,
     don't be tempted to make it too simple.
     Essentially all of your Window's files can be viewed and modified by this user,
     so keep that password safe and strong.

     Also be careful __not to mess with any permissions__!
     If you think you need to do that to complete this setup,
     then stop and reach out to me.
     You should NOT have to worry about any permissions with this,
     and if you do get stuck there then I need to know so I can help troubleshoot you through this,
     or so we know we need to update this guide*.

3. Finally, the prompt will change and you will be on a command line.
   Type `pwd` and press enter to see where you currently are in the FS.
   you should be at `/home/<your username>`.
   This is the root level of your Ubuntu user (more on that later).

## Step 0.4 - Updating Default Software.

You will need to run a quick couple commands in order to run updates software updater.
The Ubuntu OS is shipped with a ton of built-in software,
but those libraries may have had more recent updates come out
since the OS was shipped.
Updating this now is quick and will help you stay current and protected.

1. In the terminal,
   type `sudo apt-get update` and press enter.
   (you may need to enter your password)
   - [What does sudo apt-get update do?](https://askubuntu.com/questions/222348/what-does-sudo-apt-get-update-do)
1. Once that is complete,
   execute `sudo apt-get upgrade`.
   Press `y` when prompted.
   - [What does sudo apt-get upgrade do?](https://askubuntu.com/questions/94102/what-is-the-difference-between-apt-get-update-and-upgrade)
1. Once that is done, type `sudo apt autoremove`.
   This will remove any packages that are no longer needed.
   - [What does sudo apt-get autoremove do?](https://ubuntuforums.org/showthread.php?t=996053)
