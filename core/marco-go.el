;;; marco-go.el --- Go mode

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 06 giugno 2016
;; Homepage: https://github.com/marcocot/dot.emacs
;;
;; This file is not part of GNU Emacs.
;;
;; This file is free software…
;;
;;; Commentary:
;;
;;
;;
;;; Code:

(use-package gotest
  :ensure t
  :bind (:map go-mode-map
              ("C-c a" . go-test-current-project)
              ("C-c m" . go-test-current-file)
              ("C-c ." . go-test-current-test)))

(use-package go-projectile
  :ensure t
  :config
  (progn
    (go-projectile-set-gopath)
    (go-projectile-tools-add-path)))

(use-package go-eldoc
  :ensure t
  :bind (:map go-mode-map
              ("C-h f" . godoc-at-point)))

(use-package company-go
  :ensure t)

(use-package go-mode
  :ensure t
  :defer t
  :bind (:map go-mode-map
              ("C-c b" . go-run))
  :config
  (defun mc/go-mode-hook ()
    (set (make-local-variable 'company-backends) '(company-go))
    (go-eldoc-setup)
    (subword-mode t))
  (add-hook 'before-save-hook 'gofmt-before-save nil t)
  (add-hook 'go-mode-hook 'mc/go-mode-hook)
  (setq tab-width 4)
  (setq indent-tabs-mode t))

(require 'go-projectile)

(provide 'marco-go)
;;; marco-go.el ends here
