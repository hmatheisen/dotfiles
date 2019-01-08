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
 '(base16-distinct-fringe-background nil)
 '(package-selected-packages
   (quote
	(org-gcal org-bullets poet-theme powerline ample-theme base16-theme company-tern xref-js2 js2-refactor js2-mode company-go company counsel flymake-go exec-path-from-shell doom-modeline magit neotree doom-themes go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fixed-pitch ((t (:family "Inconsolata" :slant normal :weight normal :height 1.0 :width normal))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-level-1 ((t (\,@ headline))))
 '(org-level-2 ((t (\,@ headline))))
 '(org-level-3 ((t (\,@ headline))))
 '(org-level-4 ((t (\,@ headline))))
 '(org-level-5 ((t (\,@ headline))))
 '(org-level-6 ((t (\,@ headline))))
 '(org-level-7 ((t (\,@ headline))))
 '(org-level-8 ((t (\,@ headline))))
 '(org-link ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch)))))
 '(variable-pitch ((t (:family "Source Sans Pro" :height 180 :weight light)))))

(load "~/.emacs.d/lisp/defuns")

(personal 'theme)
(personal 'global)
(personal 'bindings)
(personal 'org-mode)
(personal 'modeline)
(personal 'env)
(personal 'ivy-mode)
(personal 'magit)
(personal 'golang)
(personal 'javascript)
(personal 'company-mode)
(personal 'calendar)
