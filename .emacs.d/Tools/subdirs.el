;;========================================遍历当前目录及所有子目录将其加入path-list============

(defun my-add-subdirs-to-load-path (dir)
 (let ((default-directory (concat dir "/")))
  (setq load-path (cons dir load-path))
  (normal-top-level-add-subdirs-to-load-path)))

(my-add-subdirs-to-load-path "~/.emacs.d/Tools")
