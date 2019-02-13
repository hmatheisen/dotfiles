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
 '(ansi-color-names-vector
   ["#bcbcbc" "#d70008" "#5faf00" "#875f00" "#268bd2" "#800080" "#008080" "#5f5f87"])
 '(custom-safe-themes
   (quote
	("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(hl-todo-keyword-faces
   (quote
	(("TODO" . "#dc752f")
	 ("NEXT" . "#dc752f")
	 ("THEM" . "#2aa198")
	 ("PROG" . "#268bd2")
	 ("OKAY" . "#268bd2")
	 ("DONT" . "#d70008")
	 ("FAIL" . "#d70008")
	 ("DONE" . "#00af00")
	 ("NOTE" . "#875f00")
	 ("KLUDGE" . "#875f00")
	 ("HACK" . "#875f00")
	 ("TEMP" . "#875f00")
	 ("FIXME" . "#dc752f")
	 ("XXX" . "#dc752f")
	 ("XXXX" . "#dc752f")
	 ("???" . "#dc752f"))))
 '(package-selected-packages
   (quote
	(buffer-move sudoku chess 2048-game auto-package-update smartparens move-text org-gcal projectile org-bullets org magit company-go go-mode exec-path-from-shell company-mode company counsel ivy use-package spacemacs-theme)))
 '(pdf-view-midnight-colors (quote ("#5f5f87" . "#ffffff"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; use-package Declaration
(eval-when-compile
 (require 'use-package))

(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; require-file function
(load "~/.emacs.d/lisp/defuns")

;; Requirements
(require-file 'global)
(require-file 'keybindings)
(require-file 'env)
(require-file 'ivy)
(require-file 'company)
(require-file 'golang)
(require-file 'magit)
(require-file 'mu4e)
(require-file 'org-mode)
(require-file 'projectile)
