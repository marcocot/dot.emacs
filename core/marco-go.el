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

(mc/require-packages '(go-mode company-go go-eldoc go-projectile gotest))

(require 'go-projectile)

(define-key go-mode-map (kbd "C-c a") 'go-test-current-project)
(define-key go-mode-map (kbd "C-c m") 'go-test-current-file)
(define-key go-mode-map (kbd "C-c .") 'go-test-current-test)
(define-key go-mode-map (kbd "C-c b") 'go-run)
(define-key go-mode-map (kbd "C-h f") 'godoc-at-point)

(add-hook 'before-save-hook 'gofmt-before-save nil t)

(add-hook 'go-mode-hook
          (lambda ()
            (set (make-local-variable 'company-backends) '(company-go))
            (go-eldoc-setup)
;;            (setq gofmt-command goimports)
            (subword-mode t)))

(provide 'marco-go)
;;; marco-go.el ends here
