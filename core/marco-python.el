;;; marco-python.el --- Python configuration

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
;; Emacs as python IDE
;;
;;
;;; Code:


;; Python configuration
(use-package company-anaconda
  :ensure
  :if (executable-find "python")
  :diminish anaconda-mode
  :init
  (defun mc/anaconda-mode ()
    (unless (member 'company-anaconda 'company-backends)
      (add-to-list 'company-backends 'company-anaconda))
    (anaconda-mode))
  :config
  (add-hook 'python-mode-hook #'mc/anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(use-package python
  :ensure t
  :interpreter ("python3" . python-mode)
  :preface
  (use-package py-autopep8 :ensure t
    :preface (unless (executable-find "autopep8")
               (message "Need to install autopep8 package")))
  :config
  (defun mc/python-mode ()
    (pyvenv-mode)
    (py-autopep8-enable-on-save))
  (add-hook 'python-mode-hook #'mc/python-mode)
  (use-package virtualenvwrapper
    :ensure t))

(use-package python-mode
  :mode ("\\.py\\'" . python-mode))

(provide 'marco-python)
;;; marco-python.el ends here
