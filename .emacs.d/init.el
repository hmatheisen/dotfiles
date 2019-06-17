;; MELPA
(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(package-selected-packages
   (quote
	(spacemacs-theme company-lsp lsp-ui dap-mode lsp-mode elpy tide exec-path-from-shell company-tern js2-mode org-bullets org markdown-mode magit company-go go-mode company counsel ivy move-text buffer-move auto-package-update use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Require my own scripts
(add-to-list 'load-path "~/.emacs.d/scripts")

(load "~/.emacs.d/scripts/theme-switcher")
(load "~/.emacs.d/scripts/new-term")



;; Require other config files
(add-to-list 'load-path "~/.emacs.d/elisp")

(load "~/.emacs.d/elisp/packages")
(load "~/.emacs.d/elisp/global")
(load "~/.emacs.d/elisp/buffer")
(load "~/.emacs.d/elisp/keybindings")
(load "~/.emacs.d/elisp/ivy-mode")
(load "~/.emacs.d/elisp/company-mode")
(load "~/.emacs.d/elisp/golang")
(load "~/.emacs.d/elisp/git")
(load "~/.emacs.d/elisp/markdown")
(load "~/.emacs.d/elisp/org-mode")
(load "~/.emacs.d/elisp/javascript")
(load "~/.emacs.d/elisp/python-mode")
(load "~/.emacs.d/elisp/lsp-conf")

