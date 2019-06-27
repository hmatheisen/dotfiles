;;; org-mode.el --- Org Settings
;;; Commentary:
;;; My settings for Org Mode

;;; Code:

(defun my-org-mode-hook ()
  "Function for the Org hook."
  (org-bullets-mode t)
  (toggle-truncate-lines -1)
  (toggle-word-wrap t)
  (linum-mode -1)
  (flyspell-mode))

(use-package org
  :ensure t
  :init
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (add-hook 'org-mode-hook 'my-org-mode-hook))

(use-package org-bullets
  :ensure t)

;;; org-mode.el ends here
