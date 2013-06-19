;;==================================设置模板补全==============================
;;(add-to-list 'load-path
;;             "~/.emacs.d/Tools/yasnippet-0.6.1c")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/Tools/yasnippet-0.6.1c/snippets")


;;使用方式
;;用命令 M-x yas/insert-snippet 直接进行输入，输入完这个命令后，会弹出一个补全窗口，提示当前主模式下可以补全的模板。

;;用命令 M-x yas/new-snippet 就可以新建一个扩展模板 (snippet)，YASnippet 会自动提示存放该模板的最佳目录。

;;用命令 M-x yas/find-snippets 可以查找 snippet 文件，默认的目录是当前主模式下的模板文件 (snippet file) 的存放目录。

;;用命令 M-x yas/visit-snippet-file 可以通过弹出的对话框来寻找你需要的模板文件 (snippet file)，在对话框里选择一个选项，就会打开这个模板文件 (snippet file) 来让你编辑。

;;YASnippet 会自动生成一个名叫 Copyright.yasnippet 的文件，生成的内容如下：
;;  # -*- mode: snippet -*- 
;;  # name: Copyright # name: 显示在弹出菜单里的 snippet 名称
;;  # key:# key: 缩略词，即你在用 TAB 键进行扩展前输入的关键词，如果不设定，则把这个关键词默认为本文件名
;;  # binding: "keybinding" # binding: 设置使用哪个组合键来直接插入这个 snippet，对于比较常用的模板内容比较有用
;;  # expand-env: ((some-var some-value))# expand-env: 用 elisp 重新设置一些环境变量
;;  # -- #表示在这一行之上的全是注释

;; 重启 Emacs 让修改生效，然后我们再回到 org 文件里，这个时候，可以直接输入一个 Copyright （注意：缩略词大小写敏感），然后用 C-i 进行替换（原本可以用 TAB 键的，但是 Emacs23 里的 org 模式把 TAB 键给霸占了），就可以把 Copyright 这个词替换成上面用 html 写成的版权声明。
