;; Global settings
;; ------------------------------

;; Default binary for *ansi-term*
(setq explicit-shell-file-name "/bin/bash")

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Display line numbers
(global-linum-mode t)

;; Line numbers settings
(setq linum-format "%4d")

;; Modeline info
(display-time-mode 1)

;; Emacs gurus don't need no stinking scroll bars
(toggle-scroll-bar -1)

;; Remove Toolbar
(tool-bar-mode -1)

;; Disable menu bar
(menu-bar-mode -1)

;; Line-wrapping
(set-default 'fill-column 78)

;; Make sure all backup files only live in one place
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Gotta see matching parens
(show-paren-mode t)

;; Don't truncate lines
(setq-default truncate-lines t)

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

;; Use ibuffers
(global-set-key (kbd "C-x C-b") 'ibuffer)
    (autoload 'ibuffer "ibuffer" "List buffers." t)

;; Title Bar Settings 
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)

;; Auto close
(electric-pair-mode t)

;; Set fringe color to nil
(set-face-attribute 'fringe nil :background nil)


;; ibuffer config
;; ---------------------------------

;; Ibuffer
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*Messages")
(add-to-list 'ibuffer-never-show-predicates "^\\*Completions")

(setq ibuffer-saved-filter-groups
     '(("home"
	 ("emacs-config" (or (filename . ".emacs.d")
						 (filename . "emacs-config")))
	 ("Go" (mode . go-mode))
	 ("JS" (mode . js2-mode))
	 ("PHP" (mode . php-mode))
	 ("Web Dev" (or (mode . html-mode)
					(mode . css-mode)
					(mode . mhtml-mode)
					(mode . ng2-html-mode)
					(mode . ng2-ts-mode)
					(mode . scss-mode)
					(mode . typescript-mode)))
	 ("Subversion" (name . "\*svn"))
	 ("Terminal" (mode . term-mode))
	 ("Magit" (name . "\*magit"))
	 ("Org" (or (mode . org-mode)
				(filename . "Org")
				(name . "\*Org Agenda\*")))
	 ("Mail" (or (name . "\*mu4e-headers\*")
				 (name . "\*mu4e-view\*")))
	 ("Help" (or (name . "\*Help\*")
				 (name . "\*Apropos\*")
				 (name . "\*info\*"))))))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "home")))

(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)

;; Windmove
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Move Text
(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;; Smartparens
(use-package smartparens-config
  :ensure smartparens
  :hook (after-init-hook . smartparens-mode))

;; Buffer-move
(use-package buffer-move
  :ensure t
  :init
  (global-set-key (kbd "<C-S-up>")     'buf-move-up)
  (global-set-key (kbd "<C-S-down>")   'buf-move-down)
  (global-set-key (kbd "<C-S-left>")   'buf-move-left)
  (global-set-key (kbd "<C-S-right>")  'buf-move-right))
