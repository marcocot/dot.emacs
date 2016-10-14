;;; marco-haskell.el --- Haskell configuration

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 20 May 2016
;; Homepage: https://github.com/marcocot/dot.emacs
;;
;; This file is not part of GNU Emacs.
;;
;; This file is free software…
;;
;;; Commentary:
;;
;;
;;; Code:

(require 'marco-programming)
;; (mc/require-packages '(haskell-mode hindent company-cabal))

(use-package company-cabal :ensure t)

(use-package haskell-interactive-mode
  :commands haskell-interactive-mode)

(use-package haskell-mode
  :commands haskell-mode
  :config
  (progn
    (custom-set-variables '(haskell-process-type 'cabal-repl))
    (setq-default ghc-display-error 'other-buffer)
    (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
    ;; (add-hook 'haskell-mode-hook 'flycheck-haskell-setup)
    (add-hook 'haskell-mode-hook 'interactive-haskell-mode))
  :config
  :bind
  (:map haskell-mode-map
        (("<f1>" . haskell-navigate-imports))))

(use-package company-ghc
  :commands company-ghc
  :init
  (add-to-list 'company-backends 'company-ghc))


;; (require 'company-ghc)
;; (add-to-list 'company-backends 'company-ghc)

;; (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;; (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;; (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

(provide 'marco-haskell)
;;; marco-haskell.el ends here
