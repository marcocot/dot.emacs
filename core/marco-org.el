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

(use-package org
  :commands (org-store-link org-agenda)
  :bind
  ("C-c r" . org-capture)
  ("C-c l" . org-store-link)
  ("C-c a" . org-agenda)
  (:map org-mode-map
        ("C-TAB" . org-cycle))
  :config
  (defun mc/org-mode ()
    (set (make-local-variable 'auto-save-visited-file-name) t)
    (setq auto-save-interval 20))
  (add-hook 'org-mode-hook 'mc/org-mode)
  (setq org-use-effective-time t)
  (setq org-modules '(org-habit
                      org-eval
                      org-expiry
                      org-panel
                      org-screen
                      org-toc)))

(provide 'marco-org)
;;; marco-org.el ends here
