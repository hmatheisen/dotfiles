(package-initialize)

;; MELPA
(require 'package)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (neotree doom-themes go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Global settings
;; ------------------------------

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Display line and column numbers
(global-linum-mode t)

;; Modeline info
(display-time-mode 1)
(display-battery-mode 1)

;; Emacs gurus don't need no stinking scroll bars
(toggle-scroll-bar -1)

;; Remove Toolbar
(tool-bar-mode -1)

;; Line-wrapping
(set-default 'fill-column 78)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Gotta see matching parens
(show-paren-mode t)

;; Don't truncate lines
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; Trash can support
(setq delete-by-moving-to-trash t)

;; Removes *Completions* from buffer after you've opened a file.
(add-hook 'minibuffer-exit-hook
      '(lambda ()
         (let ((buffer "*Completions*"))
           (and (get-buffer buffer)
                (kill-buffer buffer)))))

;; Set tabs to 4
(setq-default tab-width 4)


;; Key-Bindings
;; ------------------------------
(global-set-key (kbd "C-<tab>") 'other-window)

;; Avoid MacOS Troubles 
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)

;; Resize frames
(global-set-key (kbd "M--") 'shrink-window)
(global-set-key (kbd "M-+") 'enlarge-window)

;; Org-mode
;; ------------------------------
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; Doom Themes
;; ------------------------------
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-city-lights t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)


;; NeoTree
;; ------------------------------
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
