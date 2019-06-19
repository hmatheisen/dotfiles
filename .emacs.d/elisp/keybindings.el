;;; keybindings.el --- My Key Bindings

;;; Commentary:
;;; My Emacs Key Bindings

;;; Code:

;; Avoid MacOS Troubles
(setq mac-option-modifier nil
      mac-command-modifier 'meta
	  select-enable-clipboard t)

;; Resize frames
(global-set-key (kbd "M--") 'shrink-window)
(global-set-key (kbd "M-+") 'enlarge-window)
(global-set-key (kbd "C--") 'shrink-window-horizontally)
(global-set-key (kbd "C-+") 'enlarge-window-horizontally)

;; Undo
;; TODO : Try undo tree
(global-set-key (kbd "C-z") 'undo)

;; Switch buffers
(global-set-key (kbd "C-<tab>") 'next-buffer)
(global-set-key (kbd "C-S-<tab>") 'previous-buffer)

;; Easier keymap for other window
(global-set-key (kbd "M-o") 'other-window)

;; New Term Script
(global-set-key (kbd "C-x t") 'toggle-term-window)

;; Move Text
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;;; keybindings.el ends here
