;; Default binary for *ansi-term*
(setq explicit-shell-file-name "/bin/bash")

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Display line numbers
(global-linum-mode t)

;; Modeline info
(display-time-mode 1)

;; Emacs gurus don't need no stinking scroll bars
(toggle-scroll-bar -1)

;; Remove Toolbar
(tool-bar-mode -1)

;; Disable menu bar
(menu-bar-mode -1)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/.backups")))

;; Gotta see matching parens
(show-paren-mode t)

;; Trash can support
(setq delete-by-moving-to-trash t)

;; Set tabs to 4
(setq-default tab-width 4)

;; Title Bar Settings 
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)

;; Auto close
(electric-pair-mode t)

;; Set fringe color to nil
(set-face-attribute 'fringe nil :background nil)

;; Toggle fullscreen on startup
(add-hook 'after-init-hook 'toggle-frame-fullscreen)

;; Move Text
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;; Buffer-move
(use-package buffer-move
  :ensure t
  :init
  (global-set-key (kbd "<C-S-up>")     'buf-move-up)
  (global-set-key (kbd "<C-S-down>")   'buf-move-down)
  (global-set-key (kbd "<C-S-left>")   'buf-move-left)
  (global-set-key (kbd "<C-S-right>")  'buf-move-right))

;; Add useful path to exec-path and PATH
(add-to-list 'exec-path "/usr/local/bin/")
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; flycheck everywhere
(add-hook 'after-init-hook #'global-flycheck-mode)

;; New Term Script
(global-set-key (kbd "C-x t") 'new-term-window)

;; Theme Switcher script
(require 'theme-switcher)
(setq light-theme 'spacemacs-light)
(setq dark-theme 'spacemacs-dark)
