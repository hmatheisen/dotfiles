;; Golang
;; -------------------------------

(setq exec-path (cons "/usr/local/go/bin" exec-path))
(add-to-list 'exec-path "~/go/bin")

(defun my-go-mode-hook ()                                     ; Go-mode hook
  (setq gofmt-command "goimports")                            ; Use goimports instead of go-fmt
  (add-hook 'before-save-hook 'gofmt-before-save)

  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode))

(add-hook 'go-mode-hook 'my-go-mode-hook)
