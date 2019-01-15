;; Moe-Theme
;; ----------------------------------

(require 'moe-theme)
(require 'moe-theme-switcher)

;; Show highlighted buffer-id as decoration. (Default: nil)
(setq moe-theme-highlight-buffer-id t)

;; Resize titles (optional).
(setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
(setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
(setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

(powerline-moe-theme)

(setq show-paren-style 'expression)

(setq calendar-latitude +49)
(setq calendar-longitude +2)
