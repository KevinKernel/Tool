;;=====================设置auto-complete插件自动补全=======================
;;(add-to-list 'load-path "~/.emacs.d/Tools/auto-complete-1.3.1")

;;设置auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/Tools/auto-complete-1.3.1/dict")
(ac-config-default)

;;全局开启auto-complete
(global-auto-complete-mode t)
(global-set-key (kbd "M-[")'auto-complete)

;;设置auto-complete弹出菜单配色
(set-face-background 'ac-candidate-face "#8CEA2E")
(set-face-underline 'ac-candidate-face "#000000")
(set-face-background 'ac-selection-face "#ED2F6C")

;添加需要提示的内容

(setq-default ac-sources '(

;;需要安装yasnippet
ac-source-yasnippet

ac-source-filename

ac-source-words-in-all-buffer

ac-source-functions

ac-source-variables

ac-source-symbols

ac-source-features

ac-source-abbrev

ac-source-words-in-same-mode-buffers

ac-source-dictionary))
