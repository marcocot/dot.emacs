;;; init.el --- Core init file

;; Copyright (C) 2016-2017 - Marco Cotrufo <marco.cotrufo@devncode.it>
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
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/"))
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

(eval-when-compile
  (mc/require-packages '(use-package diminish)))

(diminish 'auto-revert-mode)
(global-auto-revert-mode t)

(use-package better-defaults
  :ensure t)

(use-package arjen-grey-theme
  :ensure t
  :config
  (load-theme 'arjen-grey t))

(add-to-list 'load-path "~/.emacs.d/core/")
(add-to-list 'load-path "~/.emacs.d/elisp/")

(setq inhibit-startup-message t)

(use-package linum
  :ensure t
  :config
  (progn
    (add-hook 'prog-mode-hook 'linum-mode)
    (setq linum-format "%4d \u2502 ")))

;; Always load newest byte code
(setq load-prefer-newer t)

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-fromat
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Default font
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 100
                    :weight 'normal
                    :width 'normal)

;; delete the selection with a keypress
(delete-selection-mode t)

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") #'ibuffer)

(use-package guru-mode
  :ensure t
  :diminish guru-mode
  :config
  (guru-global-mode t)
  (setq guru-warn-only t))

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(set-frame-parameter nil 'fullscreen 'maximized)

(when window-system
  (blink-cursor-mode -1)
  (menu-bar-mode -1)
  (tool-bar-mode -1))

(mc/require-package 'use-package)
(require 'use-package)

;; Initials
(require 'personal)
(require 'marco-misc)
(require 'marco-org)

;; Programming modules
(require 'marco-programming)
(require 'marco-python)
(require 'marco-c)
(require 'marco-js)
(require 'marco-go)
(require 'marco-web)
(require 'marco-email)
(require 'marco-rss)

;; Misc
(when (file-readable-p (concat user-emacs-directory "locals.el"))
  (progn
    (load-file (concat user-emacs-directory "locals.el"))
    (message "Local file loaded")))

;; Move away custom file
(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-readable-p custom-file)
  (load custom-file))

(provide 'init)
