;; Rust Mode
;; ----------------------------

(use-package racer
  :ensure t
  :hook (rust-mode . racer-mode))

(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t)
  (setq company-tooltip-align-annotations t)
  :bind (:map rust-mode-map
			  ("<tab>" . company-indent-or-complete-common)))
