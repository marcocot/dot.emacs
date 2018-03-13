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

;; ivy
(use-package counsel
  :ensure t
  :bind ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("<f1> f" . counsel-describe-function)
  ("<f1> v" . counsel-describe-variable)
  ("<f1> l" . counsel-find-library)
  ("<f1> i" . counsel-info-lookup-symbol)
  ("<f1> u" . counsel-unicode-char)
  ("C-g" . counsel-git)
  ("C-c j" . counsel-git-grep)
  ("C-c k" . counsel-ag)
  ("C-x l". counsel-locate))

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :config
  (ivy-mode t)
  (setq-default
   ivy-use-virtual-buffers t
   ivy-count-format "(%d/%d) ")
  ivy-re-builders-alist
  '((t . ivy--regex-fuzzy)))

(use-package avy :ensure t
  :bind
  (("M-g g" . avy-goto-line)))

(use-package ace-window :ensure t
  :config
  (setq aw-keys '(?w ?s ?a ?d))
  :bind
  (("M-p" . ace-window)))

(use-package anzu :ensure t
  :bind
  (("M-%" . anzu-query-replace)
   ("C-M-%" . anzu-query-replace-regexp)))

;; Use s-arrow to move cursor around panes
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Better keybindings
(global-set-key (kbd "C-c S-<up>") 'enlarge-window)
(global-set-key (kbd "C-c S-<down>") 'shrink-window)
(global-set-key (kbd "C-c S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c S-<left>") 'shrink-window-horizontally)

(use-package yaml-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode)))

(defun mc/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer)
              (remove-if-not 'buffer-file-name (buffer-list)))))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Indent buffer
(defun mc/indent-buffer ()
  "Indent the entire buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(global-set-key (kbd "<f12>") 'mc/indent-buffer)

(use-package crux
  :ensure t
  :bind (("C-c r" . crux-rename-file-and-buffer)
         ("C-c n" . crux-cleanup-buffer-or-region))
  :config
  (global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line))

(require 'epl)
(defun mc/update-all ()
  "Update the core packages."
  (package-refresh-contents)
  (interactive)
  (epl-upgrade))

(use-package eshell-git-prompt
  :ensure t
  :init
  (if (eq system-type 'windows-nt)
      (eshell-git-prompt-use-theme 'git-radar)
    (eshell-git-prompt-use-theme 'powerline)))

;; Buffermode settings
(global-set-key (kbd "<C-S-up>") 'buf-move-up)
(global-set-key (kbd "<C-S-down>") 'buf-move-down)
(global-set-key (kbd "<C-S-left>") 'buf-move-left)
(global-set-key (kbd "<C-S-right>") 'buf-move-right)

(define-key key-translation-map (kbd "M-ì") (kbd "~"))
(define-key key-translation-map (kbd "M-'") (kbd "`"))


(use-package expand-region
  :ensure t
  :bind (("C-'" . er/expand-region)))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package undo-tree
  :ensure t
  :commands (global-undo-tree-mode)
  :init (global-undo-tree-mode t))

(use-package browse-kill-ring
  :ensure t
  :bind (("C-c y" . browse-kill-ring)))

;; IMenu auto rescan
(set-default 'imenu-auto-rescan t)

(defun mc/dropbox-path (parts)
  (if (eq system-type 'windows-nt)
      (concat (getenv "USERPROFILE") "\\Dropbox\\" parts)))

(provide 'marco-misc)
;;; marco-misc.el ends here
