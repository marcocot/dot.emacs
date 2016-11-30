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

(require 'youtube-dl)

(use-package elfeed
  :ensure t
  :commands (elfeed)
  :bind (("C-x w" . elfeed))
  :config
  (defun elfeed-search-format-date (date)
    (format-time-string "%d/%m" (seconds-to-time date)))
  (setq elfeed-db-directory (mc/dropbox-path "/.elfeed/"))
  (setq elfeed-feeds
        '(("http://martinfowler.com/bliki/bliki.atom" programming)
          ("http://www.lunaryorn.com/feed.atom" emacs)
          ("http://feeds.feedburner.com/PHPMaster_feed" programming php)
          ("http://feeds.feedburner.com/OdeToCode" programming)
          ("http://feeds.feedburner.com/ScottHanselman" programming)
          ("http://staltz.com/feed.xml" programming frontend)
          ("http://golangweekly.com/rss" programming golang)
          ("http://golangnews.com/index.xml" programming golang)
          ("http://www.spacejokers.it/feed/" gaming ed)
          ("https://community.elitedangerous.com/taxonomy/term/9/feed" gaming ed)
          ("http://emacsredux.com/atom.xml" emacs)
          ("http://planet.emacsen.org/atom.xml" emacs)
          ("http://www.masteringemacs.org/feed/" emacs)
          ("http://pragmaticemacs.com/feed/" emacs)
          ("http://feeds.feedburner.com/sachac" emacs)
          ("http://endlessparentheses.com/atom.xml" emacs)
          ("http://feeds.feedburner.com/XahsEmacsBlog" emacs)
          ("http://nullprogram.com/feed/" programming)
          ("https://www.reddit.com/r/emacs/.rss" emacs reddit)
          ("http://emacshorrors.com/feed.atom" emacs)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCsgl7n_Zj35ODRZ_a_K5R-A" youtube emacs programming)
          ("https://www.youtube.com/feeds/videos.xml?channel_id=UCSRhwaM00ay0fasnsw6EXKA" programming youtube)))

  (setq url-queue-timeout 30)

  (defun mc/elfeed-youtube-dl ()
    (interactive)
    (let ((entry (elfeed-search-selected :single)))
      (message (elfeed-entry-title entry))
      (youtube-dl (elfeed-entry-link entry) :title (elfeed-entry-title entry))))

  (define-key elfeed-search-mode-map "h"
    (lambda ()
      (interactive)
      (elfeed-search-set-filter (default-value 'elfeed-search-filter))))

  (define-key elfeed-search-mode-map "a"
    (lambda ()
      (interactive)
      (elfeed-search-set-filter "-unread")))

  (define-key elfeed-search-mode-map "Y" 'mc/elfeed-youtube-dl)

  ;; Mark all youtube video
  (defface youtube-elfeed-entry
    '((t: foreground "#ff0000"))
    "Marks youtube video.")
  (push '(youtube youtube-elfeed-entry)
        elfeed-search-face-alist)

  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :before "2 weeks ago"
                                :remove 'unread)))


(provide 'marco-rss)
;;; marco-rss.el ends here
