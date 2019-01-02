;; Key-Bindings
;; ------------------------------

;; Change Window
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-S-<tab>") 'previous-multiframe-window)

;; Avoid MacOS Troubles 
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

;; Resize frames
(global-set-key (kbd "M--") 'shrink-window)
(global-set-key (kbd "M-+") 'enlarge-window)

;; Company Mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)