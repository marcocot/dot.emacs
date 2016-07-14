;;; marco-misc.el --- Misc configuration

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 17 May 2016
;; Homepage: https://github.com/marcocot/dot.emacs
;;
;; This file is not part of GNU Emacs.
;;
;; This file is free software…
;;
;;; Commentary:
;;
;; Misc configuration
;;
;;; Code:
(mc/require-packages '(helm helm-descbinds helm-ag elp anzu diminish yaml-mode buffer-move))

;; Use s-arrow to move cursor around panes
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Better keybindings
(global-set-key (kbd "C-c S-<up>") 'enlarge-window)
(global-set-key (kbd "C-c S-<down>") 'shrink-window)
(global-set-key (kbd "C-c S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c S-<left>") 'shrink-window-horizontally)

;; YAML mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; Helm
(require 'helm-config)
(require 'helm-eshell)

(setq helm-split-window-in-side-p           t
      helm-buffers-fuzzy-matching           t
      helm-move-to-line-cycle-in-source     t
      helm-ff-search-library-in-sexp        t
      helm-ff-file-name-history-use-recentf t)

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-command-map (kbd "o") 'helm-occur)
(define-key helm-command-map (kbd "g") 'helm-do-grep)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-m") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-buffers-list)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-h f") 'helm-apropos)
(global-set-key (kbd "C-h r") 'helm-info-emacs)
(global-set-key (kbd "C-h C-l") 'helm-locate-library)

(define-key minibuffer-local-map (kbd "C-c C-l") 'helm-minibuffer-history)

;; shell history.
(define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (substitute-key-definition 'eshell-list-history 'helm-eshell-history eshell-mode-map)))

(substitute-key-definition 'find-tag 'helm-etags-select global-map)
(setq projectile-completion-system 'helm)
(helm-descbinds-mode)
(helm-mode 1)

(defun mc/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not 'buffer-file-name (buffer-list)))))

;; powerline
(mc/require-package 'powerline)
(powerline-default-theme)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Indent buffer
(defun mc/indent-buffer ()
  "Indent the entire buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "<f12>") 'mc/indent-buffer)

(mc/require-packages '(crux))
(require 'crux)
(global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line)
(global-set-key (kbd "C-c r") #'crux-rename-file-and-buffer)
(global-set-key (kbd "C-c n") #'crux-cleanup-buffer-or-region)

(require 'epl)
(defun mc/update-all ()
  "Update the core packages."
  (package-refresh-contents)
  (interactive)
  (epl-upgrade))

;; anzu
(require 'anzu)
(diminish 'anzu-mode)
(global-anzu-mode t)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

;; Buffermode settings
(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)

(provide 'marco-misc)
;;; marco-misc.el ends here
