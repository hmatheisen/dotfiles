;; Load files from init.el

(defun personal (filename)
  (load (concat "~/.emacs.d/lisp/" (symbol-name filename)) 'noerror))
