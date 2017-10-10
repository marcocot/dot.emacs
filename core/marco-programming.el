;;; marco-programming.el --- Basic programming conf
;;
;;; Commentary:

;;; Code:

(use-package magit :ensure t
  :commands (magit-status)
  :bind
  (("C-x g" . magit-status)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :diminish flycheck-mode
  :config
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint))))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :init (projectile-global-mode t))

(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :init (yas-global-mode 1))

(use-package company
  :ensure t
  :commands (company-complete)
  :diminish 'company-mode
  :init (global-company-mode t)
  :bind (("C-." . company-complete))
  :config
  (setq company-tooltip-limit 20)
  (setq company-idle-delay .3)
  (setq company-echo-delay 0)
  (setq company-begin-commands '(self-insert-command)))

(use-package company-flx
  :ensure t
  :config
  (with-eval-after-load 'company
    (company-flx-mode t)))

(use-package neotree
  :ensure t
  :commands (neotree-toggle)
  :bind
  (("<f8>" . neotree-toggle)))

(use-package git-gutter
  :ensure t
  :diminish 'git-gutter-mode
  :config
  (git-gutter:linum-setup)
  (add-hook 'prog-mode-hook 'git-gutter-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (defun mc/rainbow-mode-hook ()
    (rainbow-delimiters-mode t))
  (add-hook 'prog-mode-hook 'mc/rainbow-mode-hook))

(which-function-mode t)
(electric-pair-mode t)

(provide 'marco-programming)
;;; marco-programming.el ends here
