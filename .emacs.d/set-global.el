;;==================================全局基础设置===========================

;; 启动窗口大小
(setq default-frame-alist
'((height . 35) (width . 90) (top . 35) (left . 300)))

;; 关闭启动画面
(setq inhibit-startup-message t)

;; 显示列号
(setq column-number-mode t)
(setq line-number-mode t)

;; 设置页面滚动在剩余3行时
(setq scroll-margin 2
      scroll-conservatively 10000)

;; 匹配符号


(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
 	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg1)))))

;; 让鼠标自动离开光标
(mouse-avoidance-mode 'animate)

;; 让标题栏显示Buffer title
(setq frame-title-format "%b")

;; 高亮当前行
(require 'hl-line)
(global-hl-line-mode t)

;;不自动备份
(setq make-backup-files nil) 

;;显示行号
(global-linum-mode t)

;;彩色括号
(require 'highlight-parentheses)

;;全局自动开启彩色括号匹配
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

;;括号匹配高亮
(show-paren-mode t)
(setq show-paren-style 'parenthesis) 

;; 以 y/n代表 yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t) 

;; 去掉工具栏
(tool-bar-mode 0)

;;去掉菜单栏
(menu-bar-mode 0)

;; 当使用 M-x COMMAND 后，过 1 秒钟显示该 COMMAND 绑定的键。
(setq suggest-key-bindings 1)

;; 复制(删除)目录的时，第归的复制(删除)其中的子目录。
(setq dired-recursive-copies t)
(setq dired-recursive-deletes t)

;;设置ctrl+space不绑定快捷键
(global-set-key (kbd "C-SPC") 'nil)

;;开启ido-mode可以补全打开文件的状态栏
(ido-mode t)

;;打开图片显示功能
(auto-image-file-mode t)

;;支持中键粘贴
(setq mouse-yank-at-point t)

;;习惯设置，Home键设定光标到文件开头
(global-set-key [(home)] 'beginning-of-buffer)

;;习惯设置，End键设定光标到文件结尾
(global-set-key [(end)] 'end-of-buffer)

;;当寻找一个同名的文件，改变两个buffer的名字,前面加上目录名
(setq uniquify-buffer-name-style 'forward)

;;在文档最后自动插入空白一行，好像某些系统配置文件是需要这样的
(setq require-final-newline t)
(setq track-eol t)

;;设定删除保存记录为500，可以方便以后无限恢复
(setq kill-ring-max 500)

;;自动重载更改的文件
(global-auto-revert-mode 1)

;;==============================设置绑定的快捷键==============================
(defun display-buffer-name ()
  (interactive)
  (message (buffer-file-name (current-buffer))))
(global-set-key (kbd "M-4") 'yic-kill-current-buffer)
(global-set-key (kbd "M-1") 'delete-other-windows)
(global-set-key (kbd "M-0") 'other-window)
(global-set-key (kbd "M-5") 'display-buffer-name)
(global-set-key (kbd "C-x f") 'find-file-at-point)

;;M-1 相当于最大化一个 buffer , 默认的 key bind 是 C-x 1 。
;;M-4 相当于关闭一个 buffer , 默认的 key bind 是 C-x k 。
;;M-0 相当于跳转到两个 buffer 中的另一个，默认的 key bind 是 C-x 0 。
;;M-5 可以显示 buffer 的完整的文件名称。
;;M- 和一个数字的组合默认用来输入命令的参数，例如 M-5 i 表示输入 iiiii ，但是 C-u 5 i 可以完成同样的功能。于是我就利用它们做起他的事情了。
;;C-x f 原来的绑定是 set-fill-column ,不太常用, 于是绑定到 find-file-at-point 上. 这个功能很有用, 类似于 Vim 的 gf 功能, 可以打开光标处的文件. 他也有普通 find-file 的功能. 这个功能在 shell 模式下和 c-mode 下特别有用.

;;向下插入新的行
(global-set-key [(control j)] (lambda ()
                             (interactive)
                             (move-end-of-line 1)
                             (newline-and-indent))) 

;;直接关闭当前的buffer的窗口
(global-set-key [(meta k)] (lambda ()
                             (interactive)
                             (kill-buffer)
                             (delete-window)))

;;常用习惯，F1打开帮助，常用帮助有info和woman（就是在emacs中看man）
(global-set-key [f1] 'info)
