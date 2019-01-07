;; Doom Theme
;; ------------------------------

;; (require 'doom-themes)

;; ;; Global settings (defaults)
;; (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;       doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; ;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; ;; may have their own settings.
;; (load-theme 'doom-one t)

;; ;; Enable flashing mode-line on errors
;; (doom-themes-visual-bell-config)

;; ;; Enable custom neotree theme (all-the-icons must be installed!)
;; (doom-themes-neotree-config)

;; ;; Corrects (and improves) org-mode's native fontification.
;; (doom-themes-org-config)


;; Apmple Theme
;; -------------------------------

;; then in your init you can load all of the themes
;; without enabling theme (or just load one)
(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)

;; choose one to enable
(enable-theme 'ample)
;; (enable-theme 'ample-flat)
;; (enable-theme 'ample-light)
