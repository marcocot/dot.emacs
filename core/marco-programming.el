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

(use-package magit :ensure t
  :commands (magit-status)
  :bind
  (("C-x g" . magit-status)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package projectile
  :ensure t
  :init (projectile-mode))

(use-package yasnippet
  :ensure t
  :diminish yas-global-mode
  :init (yas-global-mode 1))

(use-package company
  :ensure t
  :commands (company-complete)
  :init (global-company-mode t)
  :bind (("C-." . company-complete))
  :config
  (setq company-tooltip-limit 20)
  (setq company-idle-delay .3)
  (setq company-echo-delay 0)
  (setq company-begin-commands '(self-insert-command)))

(use-package helm-company
  :ensure t
  :bind (:map company-mode-map
              ("C-:" . helm-company)
              :map company-active-map
              ("C-:" . helm-company)))

(use-package neotree
  :ensure t
  :commands (neotree-toggle)
  :bind
  (("<f8>" . neotree-toggle)))

(use-package git-gutter
  :ensure t
  :config
  (git-gutter:linum-setup)
  (add-hook 'prog-mode-hook 'git-gutter-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (defun mc/rainbow-mode-hook ()
    (rainbow-delimiters-mode t))
  (add-hook 'prog-mode-hook 'mc/rainbow-mode-hook))

(electric-pair-mode t)

(provide 'marco-programming)
;;; marco-programming.el ends here
