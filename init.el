;;; init.el --- Core init file

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
;; Core init
;;
;;; Code:

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defun mc/require-package (package)
  "Install PACKAGE unless already installed."
  (unless (package-installed-p package)
    (package-install package)))

(defun mc/require-packages (packages)
  "Install PACKAGES unless already installed."
  (mapc #'mc/require-package packages))

(use-package better-defaults
  :ensure t)

;; (use-package zenburn-theme
;;   :ensure t
;;   :init
;;   (load-theme 'zenburn t))

(use-package material-theme
  :ensure t
  :config
  (load-theme 'material t))

(add-to-list 'load-path "~/.emacs.d/core/")

(setq inhibit-startup-message t)

(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

;; Base
(mc/require-packages '(projectile dired+))

;; Always load newest byte code
(setq load-prefer-newer t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; delete the selection with a keypress
(delete-selection-mode t)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") #'ibuffer)

(mc/require-package 'guru-mode)
(require 'guru-mode)
(guru-global-mode t)
(setq guru-warn-only t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(when (eq system-type 'windows-nt)
  (w32-send-sys-command 61488))

(menu-bar-mode -1)
(tool-bar-mode -1)

(mc/require-package 'use-package)
(require 'use-package)

(require 'personal)
(require 'marco-misc)
(require 'marco-programming)
(require 'marco-python)
(require 'marco-web)
(require 'marco-js)
(require 'marco-go)
(require 'marco-haskell)

(provide 'init)
;;; init.el ends here
