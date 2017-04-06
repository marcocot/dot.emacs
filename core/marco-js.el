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

(use-package tern
  :ensure t
  :commands tern-mode
  :diminish tern-mode
  :config
  (add-hook 'js2-mode-hook (lambda() (tern-mode t)))
  (with-eval-after-load "company"
    (use-package company-tern
      :ensure t
      :config
      (add-to-list 'company-backends 'company-tern))))

(use-package js2-mode
  :ensure t
  :mode (("\\.js$" . js2-mode)
         ("\\.jsx$" . js2-mode))
  :interpreter ("node" . js2-mode)
  :diminish js2-mode
  :init
  (defun mc/js2-mode-hook ()
    (push '("function" . ?ƒ) prettify-symbols-alist)
    (js2-imenu-extras-mode t)
    (tern-mode t))
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook 'mc/js2-mode-hook)
  :config
  (use-package js2-refactor
    :ensure t
    :commands (js2r-add-keybindings-with-prefix)
    :diminish js2-refactor-mode
    :init
    (add-hook 'js2-mode-hook #'js2-refactor-mode)
    (js2r-add-keybindings-with-prefix "C-c C-m"))
  (setq
   js2-mode-indent-ignore-first-tab t
   js2-basic-indent 2
   js2-basic-offset 2
   js2-auto-indent-p t
   js2-cleanup-whitespace t
   js2-enter-indents-newline t
   js2-indent-on-enter-key t
   js2-global-externs (list "window" "module" "require" "assert" "expect" "jQuery" "$")))

(use-package json-mode
  :ensure t
  :commands json-mode
  :bind (:map json-mode-map
              ("<f12>" . json-mode-beautify))
  :config
  (setq js-indent-level 2))

(use-package web-mode
  :mode (("\\.html\\'" . web-mode)
         ("\\.cshtml\\'" . web-mode))
  :bind (:map web-mode-map
              ("C-7" . web-mode-element-close)
              ("<f12>" . web-mode-buffer-indent))

  :config
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-auto-close-style 2)
  (setq web-mode-enable-auto-quoting t)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-engines-alist
        '(("razor" . "\\.razor\\'")
          ("blade" . "\\.blade\\."))))

(defun mc/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'mc/use-eslint-from-node-modules)

;; (mc/require-packages '( js2-refactor  web-beautify js-doc json-mode))

;; (add-hook 'js2-mode-hook
;;           (lambda ()
;;             (push '("function" . ?ƒ) prettify-symbols-alist)
;;             (js2-imenu-extras-mode +1)
;;             (local-set-key (kbd "C-c b") 'web-beautify-js)
;;             (local-set-key (kbd "C-c i") 'js-doc-insert-function-doc)
;;             (tern-mode t)))

(provide 'marco-js)
;;; marco-js.el ends here
