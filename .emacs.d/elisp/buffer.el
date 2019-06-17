;; Use ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

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
	 ("Terminal" (mode . term-mode))
	 ("Magit" (name . "\*magit"))
	 ("Org" (or (mode . org-mode)
				(filename . "Org")
				(name . "\*Org Agenda\*")))
	 ("Help" (or (name . "\*Help\*")
				 (name . "\*Apropos\*")
				 (name . "\*info\*"))))))

(add-hook 'ibuffer-mode-hook
	  '(lambda ()
	     (ibuffer-switch-to-saved-filter-groups "home")))

(setq ibuffer-expert t)
(setq ibuffer-show-empty-filter-groups nil)
