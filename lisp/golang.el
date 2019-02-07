;; Golang
;; --------------------------

(use-package company-go
  :ensure t)

(use-package go-mode
  :ensure t
  :init
  (setq exec-path (cons "/usr/local/go/bin" exec-path))
  (add-to-list 'exec-path "~/go/bin")
  :config
  (defun my-go-mode-hook ()        
	(setq gofmt-command "goimports")
	(add-hook 'before-save-hook 'gofmt-before-save)

	(set (make-local-variable 'company-backends) '(company-go))
	(company-mode)))

(add-hook 'go-mode-hook 'my-go-mode-hook)
