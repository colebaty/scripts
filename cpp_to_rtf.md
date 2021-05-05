# CPP_TO_RTF

I wrote this script to automate a task I was having to do for my Intro to C++ class.

We were having to submit source code in `.cpp` and `.rtf` formats.  I learned
later in the semester that this was because the `.rtf` files were fed into a
plaigarism detection program mandated by the university, but it couldn't work
with raw `.cpp` files.

The prescribed method for generating `.rtf` files was using an export command
from the Code::Blocks IDE. This program was not available/did not function on
the machines I owned at the time, and the alternataive - remotely operating
university computers which had Code::Blocks installed - was less than
desireable.

Initially, I was using ViM's native `:TOhtml` command to convert the source code
into HTML files, and then manually converting each file in MS Word to the `.rtf`
format. Search as I might, I was unable to find an extension for VSCode that
shared ViM's ability to preserve syntax highlighting.

After some more research, I found I was able to write a bash script that would
accomplish what I needed.

1. Gather the files of interest
2. Pass them to ViM and convert them to HTML using the `:TOhtml` command
3. Gather all the HTML files and conver them to `.rtf` using LibreOffice's
`unoconv` command
4. Finally, zip all the required files into a `.zip` file, automatically naming
the file "Cole_Baty_\<project folder name\>.zip"

I did try using `pandoc` and while I recognize how incredibly versatile it can
be, it wasn't as useful as ViM for preserving syntax highlighting. 

This script saved me lots of time manually converting each file, especially for 
the "Lab" assignments, which could many files per task (`.cpp`, `.h`, etc.).

As you can see, this has been throgh multiple versions, and may still change
further as I progress through the degree coursework.  Stay tuned!
