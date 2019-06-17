;; Use ivy/counsel/swiper packages that are really cool together

;; Ivy settings
(use-package ivy
  :init
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  :ensure t
  :config (ivy-mode 1))

;; Counsel settings
(use-package counsel
  :after ivy
  :ensure t
  :config (counsel-mode))

;; Swiper settings
(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)))
