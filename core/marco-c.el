;;; marco-c.el --- C Configuration

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 20 May 2016
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

(use-package cmake-mode
  :ensure t
  :mode (("CMakeLists\\.txt\\'" . cmake-mode) ("\\.cmake\\'" . cmake-mode))
  :init
  (add-to-list 'company-backends 'company-cmake))

(use-package cc-mode
  :defer t
  :init
  (use-package irony
    :ensure t
    :diminish (irony-mode)
    :commands (irony-mode)
    :init
    (progn
      (setq w32-pipe-read-delay 0)))

  (use-package irony-eldoc
    :ensure t
    :config
    (add-hook 'irony-mode-hook 'irony-eldoc))

  (use-package flycheck-irony
    :ensure t
    :init
    (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

  (use-package company-irony
    :ensure t
    :init
    (add-hook 'company-backends 'company-irony))

  (use-package company-irony-c-headers
    :ensure t
    :init
    (add-hook 'company-backends 'company-irony-c-headers))

  (use-package disaster
    :defer t
    :ensure t
    :commands (disaster)
    :bind (:map c-mode-base-map
                ("<f11>" . disaster)))
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook 'irony-mode)

  (add-to-list 'company-backends 'company-clang))

(provide 'marco-c)
;;; marco-c.el ends here
