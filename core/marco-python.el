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

;; Python configuration
(mc/require-packages '(anaconda-mode flycheck py-autopep8 web-mode pony-mode virtualenvwrapper))

(require 'marco-programming)

(require 'virtualenvwrapper)
(defun mc/python-mode-hook ()
  "Python hook."
  (anaconda-mode t)
  (anaconda-eldoc-mode t)
  (venv-initialize-interactive-shells)
  (venv-initialize-eshell)
  (setq venv-location "~/.virtualenvs/"))
(add-hook 'python-mode-hook 'mc/python-mode-hook)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engine-alist '(("django" . "\\.html\\'")))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-css-colorization t)

(provide 'marco-python)
;;; marco-python.el ends here
