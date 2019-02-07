;; Org-mode
;; ------------------------------

(use-package org
  :ensure t
  :init
  (setq org-log-done t
		org-hide-emphasis-markers t
		org-pretty-entities t
		org-hide-emphasis-markers t
		org-agenda-files '("~/Documents/Org/gcal"))
  :bind (("C-c l" . 'org-store-link)
		 ("C-c a" . 'org-agenda)))

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-gcal
  :ensure t
  :init
  (setq org-gcal-client-id "674273337525-rg6fdllttf6r302g3qhicsp4vokjqfro.apps.googleusercontent.com"
      org-gcal-client-secret "BHzap7TjjO8QWci-IdPRuhC_"
      org-gcal-file-alist '(("henry.mthsn@gmail.com"                                       . "~/Documents/Org/gcal/henry_cal.org")
                            ("hn7gnk9vb2vi7ghejketk8a2jc@group.calendar.google.com"        . "~/Documents/Org/gcal/marcheisen_cal.org")
							("t4i8per5451llsq88atvs451a8@group.calendar.google.com"        . "~/Documents/Org/gcal/ibm_cal.org")
							("4lq8nq5mjjih5kifmvjm4ochi88ejs8h@import.calendar.google.com" . "~/Documents/Org/gcal/hyperplanning_cal.org"))))
