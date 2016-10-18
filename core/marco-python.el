;;; marco-python.el --- Python configuration

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 18 May 2016
;; Homepage: https://github.com/marcocot/dot.emacs
;;
;; This file is not part of GNU Emacs.
;;
;; This file is free software…
;;
;;; Commentary:
;;
;; Emacs as python IDE
;;
;;
;;; Code:

(use-package python
  :ensure t
  :defer t
  :mode ("\\.py$" . python-mode))

(use-package elpy
  :ensure t
  :after python
  :config (elpy-enable)
  :bind (:map elpy-mode-map
              ("C-c C-a" . elpy-importmagic-add-import)
              ("C-c a" . elpy-importmagic-fixup)
              ("<f12>" . elpy-format-code)))

;; Python configuration
;; (use-package company-anaconda
;;   :ensure
;;   :if (executable-find "python")
;;   :diminish anaconda-mode
;;   :init
;;   (defun mc/anaconda-mode ()
;;     (unless (member 'company-anaconda 'company-backends)
;;       (add-to-list 'company-backends 'company-anaconda))
;;     (anaconda-mode))
;;   :config
;;   (add-hook 'python-mode-hook #'mc/anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

;; (use-package python
;;   :ensure t
;;   :interpreter ("python3" . python-mode)
;;   :preface
;;   (use-package pyvenv :defer t)
;;   (use-package py-autopep8 :defer t
;;     :preface (unless (executable-find "autopep8")
;;                (message "Need to install autopep8 package")))
;;   :config
;;   (defun mc/python-mode ()
;;     (pyvenv-mode)
;;     (py-autopep8-enable-on-save))
;;   (add-hook 'python-mode-hook #'mc/python-mode))

;; (use-package python-mode
;;   :mode ("\\.py\\'" . python-mode))

;; (mc/require-packages '(anaconda-mode flycheck py-autopep8 web-mode pony-mode virtualenvwrapper))

;; (require 'marco-programming)


;; (use-package anaconda-mode)

;; (require 'virtualenvwrapper)
;; (defun mc/python-mode-hook ()
;;   "Python hook."
;;   (anaconda-mode t)
;;   (anaconda-eldoc-mode t)
;;   (venv-initialize-interactive-shells)
;;   (venv-initialize-eshell)
;;   (setq venv-location "~/.virtualenvs/"))
;; (add-hook 'python-mode-hook 'mc/python-mode-hook)

;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (setq web-mode-engine-alist '(("django" . "\\.html\\'")))
;; (setq web-mode-markup-indent-offset 2)
;; (setq web-mode-code-indent-offset 2)
;; (setq web-mode-css-indent-offset 2)

;; (setq web-mode-enable-auto-pairing t)
;; (setq web-mode-enable-auto-expanding t)
;; (setq web-mode-enable-css-colorization t)

(provide 'marco-python)
;;; marco-python.el ends here
