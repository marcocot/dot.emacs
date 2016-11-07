;;; marco-rss.el --- Elfeed configuration

;; Copyright (C) 2016 - Marco Cotrufo <marco.cotrufo@devncode.it>
;; Author: Marco Cotrufo <marco.cotrufo@devncode.it>
;; Created: 07 ottobre 2016
;; Homepage: https://github.com/marcocot/dot.emacs
;;
;; This file is not part of GNU Emacs.
;;
;; This file is free software…
;;
;;; Commentary:
;;
;; Elfeed configuration
;;
;;; Code:

(mc/require-packages '(elfeed))

(setq elfeed-feeds
      '(("http://feeds.feedburner.com/OdeToCode?format=xml" csharp)
        ("http://feeds.hanselman.com/ScottHanselman" csharp development)

        ("http://pragmaticemacs.com/feed/" emacs)
        ("http://sachachua.com/blog/category/emacs/feed/" emacs)
        ("http://ergoemacs.org/emacs/blog.xml" emacs)
        ("http://emacsredux.com/atom.xml" emacs)
        ("http://endlessparentheses.com/atom.xml" emacs)

        ("https://community.elitedangerous.com/taxonomy/term/9/feed" ed)
        ("http://www.spacejokers.it/feed/" ed)))

(defun elfeed-search-format-date (date)
  (format-time-string "%d/%m" (seconds-to-time date)))

(provide 'marco-rss)
;;; marco-rss.el ends here
