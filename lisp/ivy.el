;; Ivy-mode
;; ---------------------

;; Ivy Package
(use-package ivy
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :ensure t
  :config (ivy-mode 1))

;; Counsel package
(use-package counsel
  :after ivy
  :ensure t
  :config (counsel-mode))

;; Swiper settings
(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)))
