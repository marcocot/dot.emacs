;;; marco-programming.el --- Basic programming conf
;;
;; Copyright © 2011-2016 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude
;; Version: 1.0.0
;; Keywords: convenience
;;
;;; Commentary:

;;; Code:

(mc/require-packages
 '(flycheck magit git-gutter git-blame projectile
            ag yasnippet rainbow-delimiters))

;; Enable flycheck mode
(global-flycheck-mode)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; projectile
(projectile-global-mode)

;; yasnippet
(require 'yasnippet)
(diminish yas-minor-mode)
(yas-global-mode 1)

;; Company mode
(mc/require-packages '(company))
(global-company-mode t)
(global-set-key (kbd "C-.") 'company-complete)

;; Small fix
(setq company-tooltip-limit 20)
(setq company-idle-delay .3)
(setq company-echo-delay 0)
(setq company-begin-commands '(self-insert-command))

;; NeoTree
(mc/require-package 'neotree)

(require 'neotree)
(global-set-key (kbd "<f8>") 'neotree-toggle)

(electric-pair-mode t)

(defun mc/prog-mode-hook ()
  "Prog-mode hook."
  (rainbow-delimiters-mode t))

(add-hook 'prog-mode-hook 'mc/prog-mode-hook)

(provide 'marco-programming)
;;; marco-programming.el ends here
