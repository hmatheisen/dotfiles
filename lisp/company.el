;; Company Mode
;; -----------------------

(use-package company-mode
  :init
  (setq company-selection-wrap-around t)
  (setq company-dabbrev-downcase 0)
  (setq company-idle-delay 0)
  (with-eval-after-load 'company
	(define-key company-active-map (kbd "M-n") nil)
	(define-key company-active-map (kbd "M-p") nil)
	(define-key company-active-map (kbd "C-n") #'company-select-next)
	(define-key company-active-map (kbd "C-p") #'company-select-previous))
  :ensure company
  :hook (after-init . global-company-mode)
  :bind (:map c-mode-map ("<tab>" . 'company-complete)
			  :map c++-mode-map ("<tab>" . 'company-complete)))
