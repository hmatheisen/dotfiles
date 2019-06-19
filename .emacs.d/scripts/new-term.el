;;; new-term.el --- Toggle Terminal Window

;; Author: Henry MATHEISEN
;; URL: https://github.com/hmatheisen/new-term
;; Version: 0.0.1

;; This file is part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; For a full copy of the GNU General Public License
;; see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;; Open a new terminal in a separated horizontal window
;;; Close it with the same command if in a terminal
;;; If more than one terminal is open, it opens the last one.

;;; Code:

(defvar new-shell "/bin/bash"
  "Defines the shell to open.
Default value is : /bin/bash")

(defvar new-window-size 35
  "Define the new term percentage.
The percentage corresponds to the size of the new window based on
the current one.
Default value is 35%")

(defconst ansi-term-regex "*ansi-term\\*\\(<[-+[:ascii:]]>\\)?"
  "Pattern matching `ansi-term' opened buffers.")

(defun find-term-buffers ()
  "Find all opened `ansi-term' buffers."
  (let (terms)
	(dolist (buffer (buffer-list) terms)
	  (if (string-match ansi-term-regex (buffer-name buffer))
		  (push buffer terms)))))

(defun calc-new-term-size ()
  "Calculate the new Terminal size.
The size of the new window based on the a percentage of the current one."
  (if (< new-window-size 0)
	  (floor (* (window-size) (- 1 (/ (float (- 0 new-window-size)) 100))))
	(floor (* (window-size) (- 1 (/ (float new-window-size) 100))))))

(defun toggle-term-window ()
  "Open a new window with `ansi-term'.
Shell or new window size can be parametered
If there is an existing terminal already, we open it in the new window"
  (interactive)
  ;; If we already are inside a terminal, close it
  (if (member (current-buffer) (find-term-buffers))
	  (delete-window)
	(split-window-below (calc-new-term-size))
	(other-window 1)
	(if (find-term-buffers)
		(switch-to-buffer (car (last (find-term-buffers))))
	  (ansi-term new-shell))))

(provide 'toggle-term-window)

;;; new-term.el ends here
