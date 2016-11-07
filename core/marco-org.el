;;; marco-org.el --- Org mode

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 10 June 2016
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

(defun mc/dropbox-path (parts)
  (if (eq system-type 'windows-nt)
      (concat (getenv "USERPROFILE") "\\Dropbox\\" parts)))

(use-package orwg
  :commands (org-store-link org-agenda)
  :bind
  ("C-c r" . org-capture)
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  (:map org-mode-map
        ("C-TAB" . org-cycle))
  :config
  (progn
    (use-package helm-bbdb)
    (use-package org-install)
    (use-package ob-core)
    (use-package ox)
    (use-package org-archive)
    (use-package org-pomodoro
      :ensure t
      :bind (("C-c C-c p" . org-pomodoro)))

    ;; Some hooks
    (add-hook 'org-mode-hook #'hl-line-mode)
    (add-hook 'org-agenda-mode-hook #'hl-line-mode)
    (custom-set-variables '(org-export-backends '(ascii beamer html latex md)))

    (setq org-directory (file-truename (mc/dropbox-path "\\docs\\")))

    (setq org-return-follows-link t
          org-confirm-babel-evaluate nil
          org-archive-mark-done t
          org-use-effective-time t
          org-log-done 'time
          org-modules '(org-habit
                        org-eval
                        org-expiry
                        org-panel
                        org-screen
                        org-toc
                        org-bbdb-anniversaries
                        org-bbdb
                        org-timer))

    (add-hook 'org-mode-hook #'hl-line-mode)
    (add-hook 'org-agenda-mode-hook #'hl-line-mode)

    (setq org-directory (mc/dropbox-path "\\docs\\"))
    (setq org-agenda-files (list (mc/dropbox-path "\\docs\\work.org")
                                 (mc/dropbox-path "\\docs\\todo.org")
                                 (mc/dropbox-path "\\docs\\agenda.org")))

    (setq org-capture-templates
          '(("t" "Todo" entry (file (mc/dropbox-path "\\docs\\todo.org"))
             "* TODO %?\n")
            ("T" "Task" entry (file+headline (mc/dropbox-path "\\docs\\work.org") "Refile")
             "* TODO %?")))

    ;; Refile settings
    (setq org-refile-use-outline-path 'file
          org-outline-path-complete-in-steps t
          org-refile-targets '((org-agenda-files . (:maxlevel . 6))))

    ;; Settings
    (setq
     org-src-fontify-natively t
     org-fontify-whole-heading-line t
     org-export-coding-system 'utf-8
     org-startup-indented t)

    (org-babel-do-load-languages
     'org-babel-load-languages
     '(
       (emacs-lisp . t)
       (sh . t)
       (org . t)))))


(provide 'marco-org)
;;; marco-org.el ends here
