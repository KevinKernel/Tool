;;==============================设置主题==================================
;;使用molokai主题
;;(require 'color-theme);导入主题
;;(color-theme-initialize);初始化
;;(color-theme-molokai);选用的主题


;;启用solarized主题
;;(add-to-list 'load-path "~/.emacs.d/Theme/solarized")
;;(require 'color-theme-solarized)
;;(color-theme-solarized-light)
;;(color-theme-solarized-dark)

;;sanityinc-tomorrow
;;(add-to-list 'load-path "~/.emacs.d/Theme/sanityinc-tomorrow")
(require 'color-theme-sanityinc-tomorrow)
(load-theme 'sanityinc-tomorrow-eighties t) 

;;tomorrow
;;(add-to-list 'load-path "~/.emacs.d/Theme/tomorrow")
;;(require 'color-theme-tomorrow)
;;(color-theme-tomorrow-night-eighties) 
