(use-package lsp-mode
  :ensure  t
  :init (setq lsp-auto-guess-root t)
  :hook
  ((go-mode . lsp)
   (js2-mode . lsp)
   (typescript-mode . lsp)))

(use-package lsp-ui
  :after lsp-mode
  :init (setq lsp-ui-peek-always-show t
              lsp-ui-doc-enable nil))

(use-package company-lsp
  :after (company lsp-mode)
  :init
  (setq company-lsp-cache-candidates 'auto)
  :commands (company-lsp))
