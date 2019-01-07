;; ;; Doom Modeline
;; ;; -------------------------------

;; (require 'doom-modeline)
;; (doom-modeline-init)

;; ;; How tall the mode-line should be (only respected in GUI Emacs).
;; (setq doom-modeline-height 25)

;; ;; How wide the mode-line bar should be (only respected in GUI Emacs).
;; (setq doom-modeline-bar-width 3)

;; ;; What executable of Python will be used (if nil nothing will be showed).
;; (setq doom-modeline-python-executable "python")

;; ;; Whether show 'all-the-icons' or not (if nil nothing will be showed).
;; ;; The icons may not be showed correctly on Windows. Disable to make it work.
;; (setq doom-modeline-icon t)

;; ;; Whether show the icon for major mode. It respects 'doom-modeline-icon'.
;; (setq doom-modeline-major-mode-icon t)

;; ;; Display color icons for 'major-mode'. It respects 'all-the-icons-color-icons'.
;; (setq doom-modeline-major-mode-color-icon t)

;; ;; Whether display minor modes or not. Non-nil to display in mode-line.
;; (setq doom-modeline-minor-modes t)

;; ;; Whether display perspective name or not. Non-nil to display in mode-line.
;; (setq doom-modeline-persp-name t)

;; ;; Whether display lsp' state or not. Non-nil to display in mode-line.
;; (setq doom-modeline-lsp t)

;; ;; Whether display github notifications or not. Requires `ghub` package.
;; (setq doom-modeline-github nil)

;; ;; The interval of checking github.
;; (setq doom-modeline-github-interval (* 30 60))

;; Powerline Mode
;; -----------------------------------

(require 'powerline)
(powerline-default-theme)
