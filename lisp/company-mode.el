;; Start global company mode
(add-hook 'after-init-hook 'global-company-mode)

;; Bind C-n and C-b to scroll the auto-completion
(define-key company-active-map (kbd "C-n") 'company-select-next-or-abort)
(define-key company-active-map (kbd "C-p") 'company-select-previous-or-abort)

;; Speed up Company
(setq company-dabbrev-downcase 0)
(setq company-idle-delay 0)

;; Get to the top of the list when reaching the end
(setq company-selection-wrap-around t)

