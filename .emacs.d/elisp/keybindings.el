;; Avoid MacOS Troubles 
(setq mac-option-modifier nil
      mac-command-modifier 'meta
	  x-select-enable-clipboard t)

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
