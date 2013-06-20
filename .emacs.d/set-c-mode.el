;;================================配置c-mode======================================

;;=================================缩进
;; C/C++ indentation style
(defconst lgfang-c-style
  '((c-tab-always-indent        . t)
    (c-basic-offset . 4)
    (c-ignore-auto-fill . nil)
    (c-comment-only-line-offset . (0 . 0))
    (c-hanging-braces-alist     . (
                                   (substatement-open after before)
                                   (brace-list-open)
                                   ))
    (c-hanging-colons-alist     . ((member-init-intro before)
                                   (inher-intro)
                                   (case-label after)
                                   (label after)
                                   (access-label after)))
    (c-cleanup-list             . (scope-operator
                                   empty-defun-braces
                                   defun-close-semi))
    (c-offsets-alist . (
                        (knr-argdecl-intro . 5)
                        (arglist-intro . +)
                        (arglist-close . c-lineup-close-paren)
                        (inclass . +)
                        (member-init-intro . +)
                        (statement-block-intro . +)
                        (defun-block-intro . +)
                        (substatement-open . 0)
                        (label . 0)
                        (statement-case-open . +)
                        (statement-case-intro . +) 
                        (case-label . 0)
                        (statement-cont . c-lineup-math)
                        (inline-open . 0)
                        (brace-list-open . +)
                        (topmost-intro-cont . 0)
                        ))
    (c-special-indent-hook . c-gnu-impose-minimum)
    (c-block-comment-prefix . "")
    (c-echo-syntactic-information-p . t)
    )
  "lgfang's C Programming Style")
(c-add-style "lgfang" lgfang-c-style nil)

(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-style "lgfang")
            (c-toggle-hungry-state 1)
            (hide-ifdef-mode 1)
            (hs-minor-mode 1)
            ))          

;;=================================缩进;
