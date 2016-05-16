(mc/require-packages '(helm helm-descbinds helm-ag))

(desktop-save-mode 1)

;; Use s-arrow to move cursor around panes
(windmove-default-keybindings)
(setq windmove-wrap-around t)

;; Better keybindings
(global-set-key (kbd "C-c S-<up>") 'enlarge-window)
(global-set-key (kbd "C-c S-<down>") 'shrink-window)
(global-set-key (kbd "C-c S-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-c S-<left>") 'shrink-window-horizontally)

;; Helm
(require 'helm-config)
(require 'helm-eshell)

(setq helm-split-window-in-side-p t
      helm-buffers-fuzzy-matching t
      helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
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
;; (define-key prelude-mode-map (kbd "C-c f") 'helm-recentf)

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

(provide 'marco-misc)
