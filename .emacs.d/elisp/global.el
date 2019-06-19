;;; global.el --- Editor settings

;;; Commentary:
;;; global editor settings

;;; Code:

;; Default binary for *ansi-term*
(setq explicit-shell-file-name "/bin/bash")

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Display line numbers
(global-linum-mode t)

;; Modeline info
(display-time-mode t)
(column-number-mode t)
(display-battery-mode t)

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
(add-to-list 'exec-path "/Library/TeX/texbin")

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/Library/TeX/texbin"))

;; flycheck everywhere
(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; Neotree
(setq neo-theme (if (display-graphic-p) 'icons 'arrow 'nerd))

;; Theme Switcher script
(setq light-theme 'spacemacs-light)
(setq dark-theme 'spacemacs-dark)

;; Change splash screen image with a better looking one
(setq fancy-splash-image "~/.emacs.d/logo-small.png")

;; Make that damn bell shut up
(setq ring-bell-function 'ignore)

;;; global.el ends here
