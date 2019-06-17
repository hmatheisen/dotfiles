;; Refresh package content
(unless package-archive-contents
  (package-refresh-contents))

;; use-package
(eval-when-compile
 (require 'use-package))

;; Package auto update
(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))
