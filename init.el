(require 'package)

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defun mc/require-package (package)
  "Install PACKAGe unless already installed."
  (unless (package-installed-p package)
    (package-install package)))

(defun mc/require-packages (packages)
  "Install PACKAGES unless already installed."
  (mapc #'mc/require-package packages))

(defvar mc/packages
  '(better-defaults
    zenburn-theme))

(mapc #'(lambda (package)
	  (unless (package-installed-p package)
	    (package-install package)))
      mc/packages)

(add-to-list 'load-path "~/.emacs.d/core/")

(setq inhibit-startup-message t)
(load-theme 'zenburn t)
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")

;; Base
(mc/require-packages '(projectile dired+))

;; Python configuration
(mc/require-packages '(elpy flycheck py-autopep8 web-mode))
(mc/require-package 'magit)

(elpy-enable)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-modules-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engine-alist '(("django" . "\\.html\\'")))
(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-css-colorization t)

(require 'marco-misc)
(require 'marco-programming)

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   (quote
    ((pony-settings
      (make-pony-project :python "env/scripts/python" :appsdir "src/" :settings "development.py"))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
