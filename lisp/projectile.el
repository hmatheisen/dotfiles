;; Projectile
;; ------------------------

(use-package projectile
  :ensure t
  :config (projectile-mode t)
  :bind ("C-c p" . 'projectile-command-map))
