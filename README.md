Introduction
============

NUCas is ....

There is an example ap


Installation
============

1. Convert your project into a workspace (File -> Save As Workspace)
1. Add Git submodule to your project: `git submodule add git+ssh://code/git/NUCas.git NUCas`
1. Add NUCas to your project workspace (File -> Add Files to <Your Project> -> Select **NUCas.xcodeproj**)
1. Open build settings editor for your project
1. Add **Other Linker Flags** for `-ObjC -all_load` 
1. Open target settings editor for the target you want to link NUCas into
1. Link against required frameworks:
    1. **libz.dylib**
    1. **libiconv.dylib**
1. Link against NUCas:
    1. **libNUCas.a**
1. Import the NUCas headers via `#import <NUCas.h>`
1. Build the project to verify installation is successful.

Credits
-------

NUCas follows the design of castanet. https://github.com/NUBIC/castanet

NUCas uses openSSL.
