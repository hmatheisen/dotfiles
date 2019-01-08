;; Org-mode
;; ------------------------------

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)


;; Org Bullets
;; -------------------------------

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


;; Org Settings
;; -------------------------------

(setq org-hide-emphasis-markers t)

(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(let* (
   	(base-font-color     (face-foreground 'default nil 'default))
    (headline           '(:inherit default :weight bold :foreground ,base-font-color))))


(custom-theme-set-faces
 'user
 '(org-level-1               ((t ,@headline)))
 '(org-level-2               ((t ,@headline)))
 '(org-level-3               ((t ,@headline)))
 '(org-level-4               ((t ,@headline)))
 '(org-level-5               ((t ,@headline)))
 '(org-level-6               ((t ,@headline)))
 '(org-level-7               ((t ,@headline)))
 '(org-level-8               ((t ,@headline)))
 '(variable-pitch            ((t (:family "Source Sans Pro" :height 180 :weight light))))
 '(fixed-pitch               ((t ( :family "Inconsolata" :slant normal :weight normal :height 1.0 :width normal))))
 '(org-block                 ((t (:inherit fixed-pitch))))
 '(org-document-info         ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-link                  ((t (:foreground "royal blue" :underline t))))
 '(org-meta-line             ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value        ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-tag                   ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim              ((t (:inherit (shadow fixed-pitch)))))
 )

(add-hook 'org-mode-hook 'variable-pitch-mode)

;; Org Agenda
;; -------------------------------

(setq org-agenda-include-diary t)
(setq org-agenda-files '("~/Documents/Org"))
