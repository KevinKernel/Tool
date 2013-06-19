
;;====================================cedet配置===============================

;;====================================介绍===================================

;;cedet是一堆完全用elisp实现的emacs工具的集合

;;EDE
;;用来管理项目，它可以把emacs模拟得像一个IDE那样，把一堆文件作为一个project来管理。

;;Semantic
;;Semantic应该是cedet里用得最多的组件了，代码间跳转和自动补全这两大功能都是通过semantic来实现的。

;;SRecode
;;SRecode是一个模板系统，通过一些预定义的模板，可以很快地插入一段代码。个人觉得这个功能跟msf-abbrev和yasnippet的功能有些类似。

;;Cogre
;;全称叫”Connected Graph Editor”，主要和图形相关，比如可以用它来为C++类生成UML图。

;;Speedbar
;;Speedbar可以单独创建一个frame，用于显示目录树，函数列表等等。这个组件已经包含在emacs官方发布包中。

;;EIEIO
;;EIEIO是一个底层库，它为elisp加入了OO支持。cedet的其它组件都依赖于EIEIO。

;;====================================安装===================================

;;emacs -q --no-site-file -l cedet-build.el -f cedet-build

;;或 windows or linux都可以这样安装

;;在emacs中打开cedet-build.el文件，然后
;;M-x eval-buffer
;;M-x cedet-build-in-default-emacs
;;编译过程中如果发生超过emacs堆栈大小的错误，退出emacs再重新编译即可。


;;====================================配置=====================================
;;(add-to-list 'load-path
;;             "~/.emacs.d/Tools/cedet-1.1/common")
;;(add-to-list 'load-path
;;             "~/.emacs.d/Tools/cedet-1.1/")
(require 'cedet)
(require 'semantic-ia)

;;各种模式

;;============================================================
;;(semantic-load-enable-minimum-features)

;;开启的mode

;;semantic-idle-scheduler-mode
;;enable这个mode让cedet在emacs空闲的时候自动分析buffer内容，比如正在编辑的buffer内容改变后。这个mode一般应该是需要enable的，如果没有enable这个mode，那只有手工触发才会让cedet重新分析。

;;semanticdb-minor-mode
;;semanticdb是semantic用来保存分析后的内容的，所以也是应该enable的.

;;semanticdb-load-ebrowse-caches
;;这个feature我不是很确定，大概的意思好像是semantic可以利用ebrowse的结果。这个feature大概就是把ebrowse生成的文件load给semantic使用。(要是谁了解这个feature具体意义请告诉我下) 

;;============================================================
(semantic-load-enable-code-helpers)

;;这个函数除enable semantic-load-enable-minimum-features外还包括

;;imenu
;;这个feature可以让imenu显示semantic分析出的类，函数等tags.

;;semantic-idle-summary-mode
;;打开这个mode之后，光标停留在一个类/函数等tag上时，会在minibuffer显示出这个函数原型

;;senator-minor-mode
;;senator开启之后，会在emacs上增加一个senator的菜单，可以通过菜单在当前文件的各个tag之间前后移动，跳转；还可以在里面方便地打开/关闭某个feature；还有另外一些实用的功能，看看菜单大概就能明

;;semantic-mru-bookmark-mode
;;cedet有tag跳转的功能，但是经常跳转完后还需要跳回刚才的位置，这时候就需要mru-bookmark-mode了。打开这个mode之后，每次跳转semantic都会把位置当作书签一样记录下来，以后可以通过M-x semantic-mrub-switch-tags（绑定到按键C-x B上）来选择跳回以前的任意一个位置。 

;;============================================================
;;(semantic-load-enable-guady-code-helpers)

;;这个函数除enable semantic-load-enable-code-helpers之外，还包括：

;;semantic-stickyfunc-mode
;;这个mode会根据光标位置把当前函数名显示在buffer顶上,这个mode我觉得用处不大，因为基本上可以用which-func-mode代替。而且我习惯打开tabbar-mode，这个mode会覆盖tabbar-mode，所以我是不打开它的。

;;semantic-decoration-mode
;;打开这个mode后，semantic会在类/函数等tag上方加一条蓝色的线，源文件很大的时候用它可以提示出哪些是类和函数的头

;;semantic-idle-completions-mode
;;这个mode打开后，光标在某处停留一段时间后，semantic会自动提示此处可以补全的内容。如果提示的函数不是需要的，按TAB键可以在各个可能的函数之间循环，按回车就可以确定了

;;============================================================
;;(semantic-load-enable-excessive-code-helpers)

;;这个函数除enable semantic-load-enable-gaudy-code-helpers之外，还包括：

;;semantic-idle-tag-highlight-mode
;;用过XCode或eclipse的人应该会喜欢高亮光标处变量的功能：就是在函数内部，光标停留在一个变量上，整个函数内部用这个变量的地方都高亮了。在emacs里只要打开semantic-idle-tag-highlight-mode，光标在变量处停留一会，就会把相同的变量全都高亮,semantic的这个tag-highlight虽然智能，可是我感觉它显示得太慢了，所以我是用另一个插件highlight-symbol来高亮的

;;semantic-decoration-on-*-members
;;把private和protected的函数用颜色标识出来

;;which-func-mode
;;这个其实就是emacs自带的which-function-mode，把光标当前所在的函数名显示在mode-line上

;;============================================================
(semantic-load-enable-semantic-debugging-helpers)

;;这个函数会enable几个和调试semantic相关的特性

;;semantic-highlight-edits-mode
;;打开这个mode后，emacs会把最近修改过的内容高亮出来，如下图中begin就是刚输入的，所以用灰底色高亮了.,隔一段时间后高亮会自动取消，不会一直高亮着让整个buffer看起来混乱,其实emacs自带也有高亮修改内容的mode：highlight-changes-mode，它会用红色的字体高亮所有修改的内容，但是不会自动取消，所以修改多了整个buffer就会乱七八糟糕。用semantic这个就好多了

;;semantic-show-unmatched-syntax-mode
;;这个mode会把semantic解析不了的内容用红色下划线标识出来，比如下面这个文件是从emacs源代码中来的

;;semantic-show-parser-state-mode
;;打开这个mode，semantic会在modeline上显示出当前解析状态
;;未解析时显示为”!”，正在解析时显示”@”，解析完后显示”-”，如果buffer修改后未重新解析显示为”^”
;;semantic会在空闲时自动解析，另外可以打开senator-minor-mode，按[C-c , ,]或者在senator菜单中选[Force Tag Refresh]强制它马上解析


;;======================================解析头文件============================
;;有了这些基本配置，在emacs打开C和C++文件的时候，semantic就会自动解析文件。不过有个问题，一个cpp文件中肯定会include很多头文件，要想解析这个cpp的内容，头文件的信息是必要的；但是头文件可能和cpp放在一起，也可能放在系统某个目录下，semantic怎么才能找到这个头文件一起解析呢？

;;semantic是这样处理的：1、如果当前目录中能找到，就直接在当前文件中读取头文件。2、如果当前目录下没有，就上系统INCLUDE目录中去找（在Linux下，我们一般使用gcc编译器，semantic会自动调用gcc，取得gcc的INCLUDE目录，比如/usr/include,/usr/local/include等，但是Windows下就不行了）。

;;BTW：很多文档中提到需要load semantic-gcc，不过我没有load它，在Linux下semantic仍然能自动把gcc的INCLUDE目录加进来。

;;semantic这种找法肯定会造成大量的头文件找不到的(找不到头文件还怎么解析啊)，有两个问题需要解决：1、很多工程中都会把头文件和实现文件分开放置，比如头文件放在include(或者inc,public,common等)目录中，实现文件放在src目录中，这些目录semantic是不能自己找的；2、在Windows下怎么能让semantic去找编译器的INCLUDE目录。

;;既然semantic不能自动查找找，那就只能我们告诉semantic了，办法是调用semantic-add-system-include函数，这个函数会根据mode把路径加入到semantic-dependency-system-include-path里去。下面是我的配置： 

;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(defconst cedet-win32-include-dirs
  (list "C:/MinGW/include"
        "C:/MinGW/include/c++/3.4.5"
        "C:/MinGW/include/c++/3.4.5/mingw32"
        "C:/MinGW/include/c++/3.4.5/backward"
        "C:/MinGW/lib/gcc/mingw32/3.4.5/include"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

 ;;因为我在Windows下可能用MinGW和VC6，所以我把它们的include目录都加进来了，要是你用别的编译器，就改成自己的目录好了。

;;另外，我找了一些一般项目中经常用到的头文件目录名(include,inc,common,public)，把它们也加进来了，这样对于一般的项目来说基本上都能解析正确（比如我们在项目中见到头文件放在include目录实现文件放在src目录的方式，对src目录下一个cpp文件，通过“../include”这个路径就能找到对应的头文件）。如果你的项目中还用了其它一些目录名，也可以配置在这儿。

;;上面配置中那一行(require ’semantic-c nil ‘noerror)是必须的，因为semantic的大部分功能是autoload的，如果不在这儿load semantic-c，那打开一个c文件时会自动load semantic-c，它会把semantic-dependency-system-include-path重设为/usr/include，结果就造成前面自定义的include路径丢失了。

;;顺便说一下semanticdb-project-roots的配置，很多地方都说要把它配置成”/”，但是我在Linux/Mac/Windows都试验过，不配这一行并没什么影响。

;;解析文件是semantic基本高级功能的基础，正确地解析了文件我们才能实现：代码跳转和代码补全。 

;;=====================================代码跳转==============================
;;有了前面的配置，semantic自动就解析c/c++文件，解析完后跳转就容易了：光标放在函数上，执行M-x semantic-ia-fast-jump，马上就跳转到函数的定义上了。如果跳不过去，那就检查一下前面配置的INCLUDE路径，是不是当前文件include的所有头文件都能在INCLUDE中找到。如果检查了很多遍都不好用，那就换个项目或者别的文件试试，确实存在semantic对某些文件支持不太好的情况，比如boost。
;;semantic-ia-fast-jump这个功能如此常用，我就把它绑定到f12上去了。 
(global-set-key [f12] 'semantic-ia-fast-jump)

;;另外，前面我们说过跳转过去了我们还需要跳回来，在打开mru-bookmark-mode的情况下，按[C-x B]，emacs会提示你跳回到哪个地方，一般默认的就是上一次semantic-ia-fast-jump的位置，所以回车就可以回去了。
;;不过看代码时候我经常需要跳转后马上就跳回来，要按[C-x B] [RET]这么多键实在有点麻烦，所以我写了个函数不提示直接就跳回上次的位置，并把它绑定到shift+f12上了： 

(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))
;;除了semantic-ia-fast-jump可以跳转之外，其实semantic中还有两个函数也有类似的功能：

;;    semantic-complete-jump-local
;;    semantic-complete-jump

;;看名字很容易看出来，前一个只能在当前buffer内跳转，后一个可以跳转到其它文件。不过这两个命令都需要用户手工输入要跳转的Tag名，不能像semantic-ia-fast-jump那样自动识别当前光标处单词，所以浏览代码时还是semantic-ia-fast-jump舒服。

;;cedet还有个功能在函数和声明和实现间跳转，一般的，函数声明放在h文件中，函数的实现放在cpp文件中，光标在函数体的时候通过M-x semantic-analyze-proto-impl-toggle可以跳到函数声明去，在声明处再执行的话就会再跳回函数体，我把它绑定到M-S-F12上了：

(define-key c-mode-base-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)

;;不是这个功能不是十分准确，一般在cpp中函数实现处想跳到函数声明处正常，但是从声明处跳到实现处的话cedet不一定能找到cpp文件的位置。

;;====================================代码补全===============================
;;semantic中有4个用来代码补全的命令：

;;    senator-complete-symbol
;;    senator-completion-menu-popup
;;    semantic-ia-complete-symbol
;;    semantic-ia-complete-symbol-menu

;;senator-complete-symbol和semantic-ia-complete-symbol这两个函数是新开一个buffer提示可能的补全内容；而senator-completion-menu-popup和semantic-ia-complete-symbol-menu会弹出一个补全菜单。
;;至于功能，以senator开头的两个函数是调用senator补全，另外两个是调用semantic-ia补全。至于senator和semantic-ia的区别，http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html#sec9是这样解释的：
;;“semantic-ia调用semantic-analyze-possible-completions函数来取得可能的补全内容，它能为用户提供精确的补全列表；而senator用了一个更简单的的函数来获取补全内容，所以有可能会提供错误的结果。”
;;也就是说semantic-ia的补全更智能一些。
;;至于semantic-ia这两个补全选哪一样就看各人喜好了，我喜欢用semantic-ia-complete-symbol-menu，因为看起来更直观一些，像这样：
;;[semantic的补全菜单]
;;我喜欢把它绑定到[Alt+n]上： 

(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)

;;不过semantic-ia-complete-symbol-menu只能用于GUI下，要是在终端下，就只能用semantic-ia-complete-symbol了。(终端下想要semantic-ia-complete-symbol一样的结果可以用别的插件，比如auto-complete或者company-mode)
;;如果启用了semantic-idle-completions-mode，不用按键只需要光标在.或者->后面停一会semantic就会自动开始补全了。
;;如果你用cedet不能补全，检查一下semantic是不是已经启用了，我的emacs上经常出现第一次打开c++-mode时semantic没自动启用的情况。看semantic是否正常有个直观的方法就是senator，如果启用了senator-minor-mode，打开c++文件时emacs会出现Senator菜单，如果没有Senator菜单你可以关掉再重新打开试试，要是仍然不出现菜单那就得检查配置是不是有问题。
;;如果确认semantic启用了仍然不能补全，就需要检查INCLUDE路径的配置，通过C-h v semantic-dependency-system-include-path RET检查INCLUDE路径，确保当前cpp中直接或间接include的头文件都能在INCLUDE路径中找到。 

;;====================================ede配置==============================
;;EDE是用来管理project的工具，用下面的代码启用它： 

(global-ede-mode t)

;;EDE会在emacs中加一个叫做“Project”的菜单： 
;;通过菜单可以创建project，往project里添加/移除文件；还可以编译project，不过好像只能通过已有的Makefile编译。
;;另外EDE还可以通过Speedbar显示整个project的目录树(见右边的Speedbar)： 

;;EDE可以支持四种类型的project：

;;    Automake
;;    手工写的Makefile
;;    C++ Root project
;;    Simple project

;;并且EDE能解析Autoconf/Automake，如果打开一个文件时在当前或者上级目录中能找到Makefile.am文件，EDE会自动解析文件(认为这是一个Automake的project)，识别出Makefile.am中定义的target和编译需用到的文件；打开目录树的话EDE能由Makefile.am中涉及到的文件生成目录树（上图的目录树就是EDE通过Makefile.am自动生成的）。
;;为了让semantic找到C/C++的头文件，前面是通过调用semantic-add-system-include把系统中可能出现的INCLUDE目录都告诉semantic的来实现的。其实semantic还可以通过EDE识别project中特定的INCLUDE目录，方法是在.emacs文件中定义C++ Root project，比如：
 
;;(setq libutil-project
;;      (ede-cpp-root-project "libutil"
;;                            :file "~/projects/libutil/configure.in"
;;                            :system-include-path '("/home/meteor1113/projects/include"
;;                                                   "/home/meteor1113/projects/common"
;;                                                   "/home/meteor1113/projects/libutil/pub")))
;;(setq test-project
;;      (ede-cpp-root-project "test"
;;                            :file "~/test/Makefile"
;;                            :system-include-path '("/test/include"
;;                                                   "/usr/include/boost-1.42")))

;;上面定义了两个project，并且设定了各个project各自的INCLUDE目录。
;;不过这种方式有两个缺点：
;;不能支持常见的Makefile/Makefile.am型project。
;;我不愿意为每个project都定义这样一个project，对于每天都要自己写代码的项目生成个C++ Root project还可以接受，有时候只是临时阅读一下其它项目，要是还要为它写个EDE的project配置就太麻烦了。
;;所以这个功能我也一直没用过，有问题的请参考官方文档。我觉得把所有可能的目录都加进system-include里更方便。 

;;====================================书签==============================
;;emacs有自带的书签功能(c-x r m, c-x r b, c-x r l)，不过对于用了多年VC6的我来说还是更习惯让一个书签能高亮显示出来。cedet里就带了一个可视化的书签，通过下面的语句可以启用它： 

(enable-visual-studio-bookmarks)

;;之后就可以通过下面几个按键操作书签了：

;;    F2 在当前行设置或取消书签
;;    C-F2 查找下一个书签
;;    S-F2 查找上一个书签
;;    C-S-F2 清空当前文件的所有书签

;;有点遗憾的是这个书签功能只能在当前buffer的书签间跳转。 

;;====================================h/cpp切换 ==============================
;;cedet的contrib目录下有一些实用的小功能，比如eassist.el就提供了一个在C++的头文件和实现文件间跳转的小功能。
;;要使用这个功能首先要load它： 

(require 'eassist nil 'noerror)

;;之后就可以通过命令M-x eassist-switch-h-cpp来切换了，我喜欢把它绑定到M-F12上

(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)

;;这个功能是依赖semantic的，也就是说通过cpp找头文件时它也会上配置好的INCLUDE路径中去查找，不过如果通过头文件找cpp文件，好像只能找和头文件所在的同一目录了。
;;eassist-switch-h-cpp有个BUG：它是通过文件扩展名来匹配的(通过eassist-header-switches可配置)，默认它能识别h/hpp/cpp/c/C/H/cc这几个扩展名的文件；但是C++的扩展名还可能会有别的，比如c++,cxx等，对一个扩展名为cxx的文件调用eassist-switch-h-cpp的话，它会创建一个新buffer显示错误信息。所以我把eassist-header-switches配置为： 

(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))

;;基本上所有C/C++的扩展名都包含了，同时ObjectiveC也可以用了。 

;;====================================代码折叠=============================
;;semantic-tag-folding
;;从我开始用emacs开始就听大虾们说hs-minor-mode可以实现代码折叠，所以我的.emacs里一直把hs-minor-mode打开的，可是用了5年之后我发现还是不习惯它的按键，另外也不是很喜欢它显示的样子，5年来Hide/Show这个菜单对我来说基本上是个摆设。
;;我期待像eclipse那样可以通过鼠标在直接点击就可以打开和折叠代码，这个功能在cedet也实现了(可惜这么长时间一直没发现它)，就是semantic-tag-folding.el(也在cedet的contrib目录下)。 

;;(require 'semantic-tag-folding nil 'noerror)
;;(global-semantic-tag-folding-mode 1)

;;只要用鼠标点击左侧的小三角图标就可以打开或折叠代码了。箭头向下的空心三角表示这段代码可以被折叠，箭头向右的实心三角表示这段代码被打折过了。
;;为了方便键盘操作，我把按键绑定到了[C-c , -]和[C-c , +]上(绑定这么复杂的
;;按键主要是为了和senator兼容，后面会讲到senator实现代码折叠)： 

;;(define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
;;(define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)

;;同时它还提供了两个函数可以同时打开和折叠整个buffer的所有代码，分别是
;;semantic-tag-folding-fold-all和semantic-tag-folding-show-all，我把它们
;;绑定到了[C-_]和[C-+]上： 

;;(define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
;;(define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all))

;;打开semantic-tag-folding-mode后，用gdb调试时不能点左侧的fringe切换断点了，所以我把C-?定义为semantic-tag-folding-mode的切换键，在gdb调试时临时把semantic-tag-folding关掉： 

(global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)

;;不过，semantic-tag-folding在终端下会有一点点小问题：终端下semantic-tag-folding在函数前面加了个“+”或“-”号，

;;虽然功能不受影响(除了不能用鼠标操作外，快捷键和GUI下是一样的)，不过代码不能对齐了还是令我有些不爽，所以终端下我是禁用semantic-tag-folding的，最终我的配置如下： 
(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all))

;;需要注意的是，semantic-tag-folding依赖于语法解析，也就是说必须等semantic解析完文件之后才能使用。如果找开文件在fringe处找不到空心三角，可以[Force Tag Refresh]下，或者检查下semantic是否配置正确。 

;;终端下不用semantic-tag-folding了，最好能有替代方案吧：首先可以用回hs-minor-mode，此外cedet的senator也提供了一种代码折叠方案。
;;只要启用了senator-minor-mode(emacs中会出现Senator菜单)，就可以通过M-x senator-fold-tag和M-x senator-unfold-tag来折叠和打开代码了，GUI和终端下都可以使用。
;;默认地，senator-fold-tag绑定到[C-c , -]，senator-unfold-tag绑定到[C-c , +]上(所以前面我把semantic折叠的快捷键也绑定到这两个键上，这样GUI和终端下快捷键就一致了)。不过senator里好像没有对应的fold-all和show-all方法。

;;以上只是cedet里我用到的一些功能，其实cedet还有很多优秀的功能，比如通过模板自动生成代码(SRecode)；通过代码画UML图以及通过UML图生成代码(Cogre)等；另外semantic除了可以自己解析代码外还可以借助ctags,global,ebrowse来解析。更多的功能需要进一步发掘。
