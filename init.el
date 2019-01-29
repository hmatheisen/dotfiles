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
 '(ansi-color-names-vector
   ["#303030" "#ff4b4b" "#d7ff5f" "#fce94f" "#5fafd7" "#d18aff" "#afd7ff" "#c6c6c6"])
 '(ansi-term-color-vector
   [unspecified "#f7f7f7" "#7c7c7c" "#8e8e8e" "#a0a0a0" "#686868" "#747474" "#686868" "#464646"] t)
 '(async-bytecomp-package-mode t)
 '(base16-distinct-fringe-background nil)
 '(custom-safe-themes
   (quote
	("1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "196df8815910c1a3422b5f7c1f45a72edfa851f6a1d672b7b727d9551bb7c7ba" "c2efd2e2e96b052dd91940b100d86885337a37be1245167642451cf6da5b924a" "f1e3641bd6cdd4bf571fc27820a2dfd2dd03c8cf0e251e04d5509632dfe6f004" "85968e61ff2c490f687a8159295efb06dd05764ec37a5aef2c59abbd485f0ee4" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" "12670281275ea7c1b42d0a548a584e23b9c4e1d2dabb747fd5e2d692bcd0d39b" "59e82a683db7129c0142b4b5a35dbbeaf8e01a4b81588f8c163bd255b76f4d21" "13d20048c12826c7ea636fbe513d6f24c0d43709a761052adbca052708798ce3" "e61752b5a3af12be08e99d076aedadd76052137560b7e684a8be2f8d2958edc3" "26d49386a2036df7ccbe802a06a759031e4455f07bda559dcf221f53e8850e69" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "8cf1002c7f805360115700144c0031b9cfa4d03edc6a0f38718cef7b7cabe382" "7559ac0083d1f08a46f65920303f970898a3d80f05905d01e81d49bb4c7f9e39" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" default)))
 '(fci-rule-color "#383838")
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
	(nodejs-repl cider moe-theme emmet-mode darktooth-theme web-mode tide ng2-mode typescript-mode counsel-spotify markdown-mode cyberpunk-theme base16-theme projectile org-gcal org-bullets powerline ample-theme company-tern xref-js2 js2-refactor js2-mode company-go company counsel flymake-go exec-path-from-shell magit neotree go-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-title ((t (:height 1.9 :weight bold))))
 '(org-level-1 ((t (\,@ headline))))
 '(org-level-2 ((t (\,@ headline))))
 '(org-level-3 ((t (\,@ headline))))
 '(org-level-4 ((t (\,@ headline))))
 '(org-level-5 ((t (\,@ headline))))
 '(org-level-6 ((t (\,@ headline))))
 '(org-level-7 ((t (\,@ headline))))
 '(org-level-8 ((t (\,@ headline))))
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch) :foreground "#555")))))

(load "~/.emacs.d/lisp/defuns")

;; (personal 'modeline)
(personal 'theme)
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
(personal 'spotify)
(personal 'typescript)
(personal 'angular)
