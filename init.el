(package-initialize)
;; MELPA
(require 'package)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(async-bytecomp-package-mode t)
 '(base16-distinct-fringe-background nil)
 '(custom-safe-themes
   (quote
	("760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "59e82a683db7129c0142b4b5a35dbbeaf8e01a4b81588f8c163bd255b76f4d21" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "8cf1002c7f805360115700144c0031b9cfa4d03edc6a0f38718cef7b7cabe382" "7559ac0083d1f08a46f65920303f970898a3d80f05905d01e81d49bb4c7f9e39" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
	(dracula-theme markdown-mode cyberpunk-theme moe-theme base16-theme projectile org-gcal org-bullets powerline ample-theme company-tern xref-js2 js2-refactor js2-mode company-go company counsel flymake-go exec-path-from-shell magit neotree go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((((class color) (min-colors 89)) (:foreground "#005f87" :background "#d7d7ff"))))
 '(org-document-info ((((class color) (min-colors 89)) (:foreground "#5fafd7" :background "#fdfde7" :weight bold))))
 '(org-document-info-keyword ((((class color) (min-colors 89)) (:foreground "#d75f00" :background "#ffffaf"))))
 '(org-document-title ((((class color) (min-colors 89)) (:foreground "#005f87" :background "#fdfde7" :weight bold))))
 '(org-level-1 ((((class color) (min-colors 89)) (:bold t :foreground "#5fafd7"))))
 '(org-level-2 ((((class color) (min-colors 89)) (:bold t :foreground "#5fd700"))))
 '(org-level-3 ((((class color) (min-colors 89)) (:bold t :foreground "#ff8700"))))
 '(org-level-4 ((((class color) (min-colors 89)) (:bold t :foreground "#00d7af"))))
 '(org-level-5 ((((class color) (min-colors 89)) (:bold t :foreground "#cc0000"))))
 '(org-level-6 ((((class color) (min-colors 89)) (:bold t :foreground "#b218b2"))))
 '(org-level-7 ((((class color) (min-colors 89)) (:bold t :foreground "#ff4ea3"))))
 '(org-level-8 ((((class color) (min-colors 89)) (:bold t :foreground "#ffd700"))))
 '(org-link ((((class color) (min-colors 89)) (:foreground "#1f5bff" :underline "#1f5bff"))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((((class color) (min-colors 89)) (:background "#fce94f" :foreground "#875f00"))))
 '(org-tag ((((class color) (min-colors 89)) (:background "#9e9e9e" :foreground "#ffffff" :bold t :weight bold))))
 '(org-verbatim ((((class color) (min-colors 89)) (:foreground "#005f87" :background "#d7d7ff" :bold nil)))))

(load "~/.emacs.d/lisp/defuns")

;; KISS :
;; (personal 'modeline)
;; (personal 'theme)

(personal 'global)
(personal 'bindings)
(personal 'org-mode)
(personal 'env)
(personal 'ivy-mode)
(personal 'magit)
(personal 'golang)
(personal 'javascript)
(personal 'company-mode)
(personal 'calendar)
(personal 'projectile)
(personal 'mu4e)
