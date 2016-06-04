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

(mc/require-packages '(racer flycheck-rust rust-mode))
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
(add-hook 'rust-mode-hook
          '(lambda ()
             (racer-mode t)
             (racer-turn-on-eldoc)
             (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
             (add-hook 'rust-mode-hook #'racer-mode)
             (add-hook 'racer-mode-hook #'eldoc-mode)
             (add-hook 'racer-mode-hook #'company-mode)
             (rust-enable-format-on-save)
             (local-set-key (kbd "M-.") #'racer-find-definition)
             (local-set-key (kbd "TAB") #'company-indent-or-complete-common)
             (setq company-tooltip-align-annotations t)))

(provide 'marco-rust)
;;; marco-rust.el ends here
