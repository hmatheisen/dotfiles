(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(setq mu4e-mu-binary "/usr/local/bin/mu")

(require 'mu4e)
(setq mu4e-maildir "~/.Mail")
(setq mu4e-drafts-folder "/[Gmail].Drafts")
(setq mu4e-sent-folder   "/[Gmail].Sent Mail")
;; don't save message to Sent Messages, Gmail/IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)
;; allow for updating mail using 'U' in the main view:
(setq mu4e-get-mail-command "offlineimap")

;; shortcuts
(setq mu4e-maildir-shortcuts
    '( ("/henry.mthsn@gmail.com/INBOX" . ?i)
       ("/[Gmail].Sent Mail"           . ?s)))

;; something about me
(setq
   user-mail-address "henry.mthsn@gmail.com"
   user-full-name  "Henry MATHEISEN"
   mu4e-compose-signature
    (concat
      "Regards,\n"
      "Henry MATHEISEN\n"))

;; show images
(setq mu4e-show-images t)

;; spell check
(add-hook 'mu4e-compose-mode-hook
        (defun my-do-compose-stuff ()
           "My settings for message composition."
           (set-fill-column 72)
           (flyspell-mode)))

;; fetch mail every 10 mins
(setq mu4e-update-interval 600)

;; configuration for sending mail
(setq message-send-mail-function 'smtpmail-send-it
     smtpmail-stream-type 'starttls
     smtpmail-default-smtp-server "smtp.gmail.com"
     smtpmail-smtp-server "smtp.gmail.com"
     smtpmail-smtp-service 587)
