(use-package gnus
  :ensure t
  :commands gnus
  :config
  (require 'mm-decode)
  (setq mm-discouraged-alternatives
        '("text/html" "text/richtext")
        mm-automatic-display
        (-difference mm-automatic-display '("text/html" "text/enriched" "text/richtext")))
  (setq gnus-select-method
        '(nnimap "gmail"
                 (nnimap-address "imap.gmail.com")
                 (nnimap-server-port 993)
                 (nnimap-stream ssl)
                 (nnimap-authenticator login)))

  (setq gnus-thread-sort-functions '((not gnus-thread-sort-by-date)))
  (setq send-mail-function 'smtpmail-send-it)
  (setq smtpmail-smtp-server "smtp.gmail.com")
  (setq smtpmail-stream-type 'starttls)
  (setq smtpmail-smtp-service 587)

  (setq gnus-use-adaptive-scoring t)
  (setq gnus-default-adaptive-score-alist
        '((gnus-unread-mark)
          (gnus-ticked-mark (subject 10))
          (gnus-killed-mark (subject -5))
          (gnus-catchup-mark (subject -1))))


  (setq gnus-group-line-format "%m%G (%N) %-16C\n")

  (setq gnus-summary-line-format "|%*%U%R%B%s%-66=%-20,20f|%4L |%D|\n"
        gnus-topic-line-format   "%i%n %A (%G) %v\n")

;;; Header
  ;; Select the header that should be shown. Yes I am interested in the used mail or news client from other people ;-)
  (setq gnus-visible-headers "^From:\\|^Newsgroups:\\|^List-Id:\\|^Subject:\\|^Date:\\|^Followup-To:\\|^Reply-To:\\|^Summary:\\|^Keywords:\\|^To:\\|^[BGF]?Cc:\\|^Posted-To:\\|^Mail-Copies-To:\\|^Mail-Followup-To:\\|^Apparently-To:\\|^Gnus-Warning:\\|^Resent-From:\\|^X-Sent:\\|^User-Agent:\\|^X-Mailer:\\|^X-Newsreader:\\|^Content-Type:\\|^Content-Transfer-Encoding:")

  ;; Specify the order of the header lines

  (setq gnus-sorted-header-list '("^From:" "^Subject:" "^Summary:" "^Keywords:" "^Newsgroups:" "^List-Id:" "^Followup-To:"
                                  "^To:" "^Cc:" "^Date:" "^User-Agent:" "^X-Mailer:" "^X-Newsreader:" "^Content-Type:"
                                  "^Content-Transfer-Encoding:"))

  (if window-system
    (setq gnus-sum-thread-tree-root ">>"
          gnus-sum-thread-tree-single-indent " >"
          gnus-sum-thread-tree-leaf-with-other "+-> "
          gnus-sum-thread-tree-indent " "
          gnus-sum-thread-tree-vertical "|"
          gnus-sum-thread-tree-single-leaf "`-> "
          gnus-sum-thread-tree-false-root "~>")))

(use-package bbdb
  :ensure t
  :config
  (progn
    (bbdb-initialize 'gnus 'message)
    (bbdb-mua-auto-update-init 'gnus 'message)
    (setq bbdb-mua-update-interactive-p '(query . create))
    (setq bbdb-message-all-addresses t)))

(provide 'marco-email)
