(mc/require-packages '(js2-mode js2-refactor tern company-tern ))

(setq-default js2-basic-indent 2
              js2-basic-offset 2
              js2-auto-indent-p t
              js2-cleanup-whitespace t
              js2-enter-indents-newline t
              js2-indent-on-enter-key t
              js2-global-externs (list "window" "module" "require" "assert" "expect" "jQuery" "$"))

(add-to-list 'company-backends 'company-tern)

(add-hook 'js2-mode-hook
          (lambda ()
            (push '("function" . ?ƒ) prettify-symbols-alist)
            (tern-mode t)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(provide 'marco-js)
;;; marco-js.el ends here
