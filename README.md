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
1. Add **User Header Search Paths** for `$(BUILT_PRODUCTS_DIR)` and make sure it's *recursive*
1. Open target settings editor for the target you want to link NUCas into
1. Link against required frameworks:
    1. **libz.dylib**
    1. **libiconv.dylib**
1. Link against NUCas:
    1. **libNUCas.a**
1. Import the NUCas headers via `#import <NUCas.h>`
1. Download the latest cacert.pem file and put into your project `wget http://curl.haxx.se/ca/cacert.pem`
1. (optional) Copy NUCas.plist-sample into your project `cp NUCas.plist-sample NUCas.plist`
1. Build the project to verify installation is successful.

Credits
-------

NUCas's object model follows the design of castanet. https://github.com/NUBIC/castanet

NUCas uses openSSL.
