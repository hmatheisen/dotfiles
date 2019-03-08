(use-package company-c-headers
  :ensure t
  :init
  (add-to-list 'company-backends 'company-c-headers))

;; hs-minor-mode for folding source code
(add-hook 'c-mode-common-hook 'hs-minor-mode)


(use-package cc-mode
  :config
  (define-key c-mode-map  [(tab)] 'company-complete)
  (define-key c++-mode-map [(tab)] 'company-complete))
