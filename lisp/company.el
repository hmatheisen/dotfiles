;; Company Mode
;; -----------------------

(use-package company-mode
  :init
  (setq company-selection-wrap-around t)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0)
  :ensure company
  :hook (after-init . global-company-mode)
  :bind (("C-c C-c" . 'company-complete)))
