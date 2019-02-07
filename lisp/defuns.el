;; Load files from init.el

(defun require-file (filename)
  (load (concat "~/.emacs.d/lisp/" (symbol-name filename)) 'noerror))
