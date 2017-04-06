;;; marco-rss.el --- Elfeed configuration

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 07 ottobre 2016
;; Homepage: https://github.com/marcocot/dot.emacs
;;
;; This file is not part of GNU Emacs.
;;
;; This file is free software…
;;
;;; Commentary:
;;
;; Elfeed configuration
;;
;;; Code:

(require 'youtube-dl)

(use-package elfeed
  :ensure t
  :commands (elfeed)
  :bind (("C-x w" . elfeed))
  :init
  (use-package elfeed-org
    :ensure t
    :init
    (elfeed-org)
    :config
    (setq rmh-elfeed-org-files (list "~/.emacs.d/elfeed.org")))

  :config
  (defun elfeed-search-format-date (date)
    (format-time-string "%d/%m" (seconds-to-time date)))

  (defun mc/elfeed-youtube-dl ()
    (interactive)
    (let ((entry (elfeed-search-selected :single)))
      (message (elfeed-entry-title entry))
      (youtube-dl (elfeed-entry-link entry) :title (elfeed-entry-title entry))))

  (define-key elfeed-search-mode-map "h"
    (lambda ()
      (interactive)
      (elfeed-search-set-filter (default-value 'elfeed-search-filter))))

  (define-key elfeed-search-mode-map "a"
    (lambda ()
      (interactive)
      (elfeed-search-set-filter "-unread")))

  (define-key elfeed-search-mode-map "Y" 'mc/elfeed-youtube-dl)

  (setq url-queue-timeout 30)
  (setq elfeed-db-directory (mc/dropbox-path "/.elfeed/")))

(provide 'marco-rss)
;;; marco-rss.el ends here
