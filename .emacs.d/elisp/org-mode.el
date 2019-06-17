;;; org-mode.el --- Org Settings
;;; Commentary:
;;; My settings for Org Mode

;;; Code:

(use-package org
  :ensure t)

(use-package org-bullets
  :ensure t
  :init
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;;; org-mode.el ends here
