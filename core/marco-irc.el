(use-package erc
  :ensure t
  :commands (erc)
  :bind (("C-x e" . erc))
  :config
  (progn
    (require 'erc-join)
    (erc-autojoin-mode t)

    (setq erc-server "irc.freenode.net"
          erc-port 6667
          erc-nick "marcocot")

    (setq erc-autojoin-channels-alist
          '(("freenode.net" "#emacs" "#gnus")))

    (require 'erc-match)
    (setq erc-keywords '("marcocot"))
    (erc-match-mode t)

    (setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT"))
    (erc-timestamp-mode t)
    (erc-track-mode t)))
