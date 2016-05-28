;;; marco-rust.el --- Rust configuration

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 28 maggio 2016
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

(require 'marco-programming)

(mc/require-packages '(company-racer racer flycheck-rust rust-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook
          '(lambda ()
             (racer-mode t)
             (racer-turn-on-eldoc)
             (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
             (set (make-local-variable 'company-backends) '(company-racer))
             (local-set-key (kbd "M-.") #'racer-find-definition)
             (local-set-key (kbd "TAB") #'racer-complete-or-indent)))

(provide 'marco-rust)
;;; marco-rust.el ends here
