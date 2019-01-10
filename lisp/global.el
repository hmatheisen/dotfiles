;; Global settings
;; ------------------------------

;; Default binary for *ansi-term*
(setq explicit-shell-file-name "/usr/local/bin/fish")

;; Don't show the startup screen
(setq inhibit-startup-message t)

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Display line numbers
(global-linum-mode t)

;; Line numbers settings
(setq linum-format "%4d  ")

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

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; ibuffer config
;; ---------------------------------

;; Ibuffer
;; *Messages* is so annoying. Also, I really like ibuffer
g
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*Messages")
(add-to-list 'ibuffer-never-show-predicates "^\\*Completions")
(global-set-key (kbd "C-b") 'ibuffer)

(setq ibuffer-saved-filter-groups
      '(("home"
	 ("emacs-config" (or (filename . ".emacs.d")
			     (filename . "emacs-config")))
	 ("Org" (or (mode . org-mode)
		    (filename . "OrgMode")))
         ("code" (filename . "code"))
	 ("Go" (mode . go-mode))
	 ("Shell" (mode . sh-mode))
	 ("PHP" (mode . php-mode))
	 ("Web Dev" (or (mode . html-mode)
			(mode . css-mode)
			(mode . mhtml-mode)))
	 ("Subversion" (name . "\*svn"))
	 ("Magit" (name . "\*magit"))
	 ("ERC" (mode . erc-mode))
	 ("Help" (or (name . "\*Help\*")
		     (name . "\*Apropos\*")
		     (name . "\*info\*"))))))
(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "home")))

(setq ibuffer-expert t)

(setq ibuffer-show-empty-filter-groups nil)

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-auto-mode 1)
	     (ibuffer-switch-to-saved-filter-groups "home")))
