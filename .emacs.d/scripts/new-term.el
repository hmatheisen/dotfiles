;;; new-term.el --- Open a New Terminal

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

;;; Code:

(defvar new-shell "/bin/bah"
  "Defines the shell to open.
Default value is : /bin/bash")

(defvar new-window-size -35
  "Define the new term percentage.
The percentage corresponds to the size of the new window based on
the current one.  Default value is 35%")

(defun calc-new-term-size ()
  "Calculate the new Terminal size.
The size of the new window based on the a percentageof the current one."
  (if (< new-window-size 0)
	  (floor (* (window-size) (- 1 (/ (float (- 0 new-window-size)) 100))))
  (floor (* (window-size) (- 1 (/ (float new-window-size) 100))))))

(defun new-term-window ()
  "Open a new window with `ansi-term'.
Shell or new window size can be parametered
If there is an existing terminal already, we open it in the new window"
  (interactive)
  (if (get-buffer "*ansi-term*")
	  (progn
		(split-window-below (calc-new-term-size))
		(other-window 1)
		(switch-to-buffer (get-buffer "*ansi-term*")))
	(progn
	  (split-window-below (calc-new-term-size))
	  (other-window 1)
	  (ansi-term "/bin/bash"))))

(global-set-key (kbd "C-x t") 'new-term-window)

;;; new-term.el ends here
