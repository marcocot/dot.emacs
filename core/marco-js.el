;;; marco-js.el --- JS Configration

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 18 May 2016
;; Homepage: https://github.com/marcocot/dot.emacs
;;
;; This file is not part of GNU Emacs.
;;
;; This file is free software
;;
;;; Commentary:
;;
;; JS Configuration
;;
;;; Code:

(mc/require-packages '(js2-mode js2-refactor tern company-tern web-beautify js-doc json-mode))

(require 'js2-mode)

(setq-default js2-basic-indent 2
              js2-basic-offset 2
              js2-auto-indent-p t
              js2-cleanup-whitespace t
              js2-enter-indents-newline t
              js2-indent-on-enter-key t
              js2-global-externs (list "window" "module" "require" "assert" "expect" "jQuery" "$"))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

(add-to-list 'company-backends 'company-tern)

(add-hook 'js2-mode-hook
          (lambda ()
            (push '("function" . ?ƒ) prettify-symbols-alist)
            (js2-imenu-extras-mode +1)
            (local-set-key (kbd "C-c b") 'web-beautify-js)
            (local-set-key (kbd "C-c i") 'js-doc-insert-function-doc)
            (tern-mode t)))

(provide 'marco-js)
;;; marco-js.el ends here
