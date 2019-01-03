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
 '(async-bytecomp-package-mode t)
 '(package-selected-packages
   (quote
	(material-theme js2-mode company-go company counsel flymake-go exec-path-from-shell doom-modeline magit neotree doom-themes go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load "~/.emacs.d/lisp/defuns")

(personal 'global)
(personal 'bindings)
(personal 'org-mode)
(personal 'theme)
(personal 'env)
(personal 'ivy-mode)
(personal 'magit)
(personal 'golang)
(personal 'javascript)
(personal 'company-mode)
