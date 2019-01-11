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

(setq org-hide-emphasis-markers t
	  org-pretty-entities t
	  org-hide-emphasis-markers t
	  )

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
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-special-keyword       ((t (:inherit (font-lock-comment-face fixed-pitch) :foreground "#555"))))
 '(org-document-title        ((t (:height 1.9 :weight bold))))
 )

(add-hook 'org-mode-hook (lambda () (linum-mode -1)))


;; Org Agenda
;; -------------------------------

(setq org-agenda-files '("~/Documents/Org/gcal"))
