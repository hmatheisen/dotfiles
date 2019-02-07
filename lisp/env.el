;; ENV
;; ------------------------------

(use-package exec-path-from-shell
  :if (memq window-system '(max ns x))
  :ensure t
  :init (exec-path-from-shell-copy-env "GOPATH")
  :config (exec-path-from-shell-initialize))
