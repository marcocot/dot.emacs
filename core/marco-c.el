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

(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode t)
(global-semantic-idle-scheduler-mode t)
(global-semantic-stickyfunc-mode t)

(semantic-mode t)

(require 'ede)
(global-ede-mode)
(global-set-key (kbd "TAB") 'company-complete)

(provide 'marco-c)
;;; marco-c.el ends here
