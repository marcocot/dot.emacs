;;; marco-clojure.el ---

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 04 novembre 2016
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

(use-package clojure-mode
  :ensure t
  :init
  (use-package cider :ensure t))

(provide 'marco-clojure)
;;; marco-clojure.el ends here
