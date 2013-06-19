;;==============================设置org-mode==========================

;;自动折行
(add-hook 'org-mode-hook 
  (lambda () (setq truncate-lines nil)))

;;设置状态

(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(i!)" "HANGUP(h!)" "|" "DONE(d!)" "CANCEL(c!)")))
