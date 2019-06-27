;;; theme-switcher.el --- Switch theme at given time

;; Author: Henry MATHEISEN
;; URL: https://github.com/hmatheisen/theme-switcher
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

;; This package allow a user to switch from one theme to another at desired hours
;; This is useful if, like me, you like a light theme during the day and a dark theme at night
;;
;; The code is inspired by moe-theme-switcher.el that you can find here : https://github.com/kuanyui/moe-theme.el/blob/master/moe-theme-switcher.el
;;
;; A minor mode could be provided to enable/disable the switch
;; Also the time could be more precise than juste the hour

;;; Code:

(defvar light-theme nil
  "The light theme to switch to during the day.
example : (setq light-theme 'spacemacs-light)")

(defvar dark-theme nil
  "The dark theme to switch to during the day.
example : (setq dark-theme 'spacemacs-dark)")

(defvar morning-hour 08
  "The hour when the theme goes from dark to light in the morning.
Default is 8am.
example : (setq morning-hour 07) for 7am")

(defvar evening-hour 17
  "The hour when the theme goes from light to dark in the evening.
Default is 5pm.
example : (setq evening-hour 18) for 6pm")

(defun switch-to-theme (switch-to)
  "Disable all themes and load the theme SWITCH-TO."
  (unless (member switch-to custom-enabled-themes)
	(while custom-enabled-themes
	  (disable-theme (car custom-enabled-themes)))
	(load-theme switch-to)))

(defun switch ()
  "Switch themes depending on the hour of the day."
  (let ((now (string-to-number (format-time-string "%H"))))
	(if (and (> now morning-hour) (< now evening-hour) 'light-theme 'dark-theme)
		(switch-to-theme light-theme)
	  (switch-to-theme dark-theme))))

(run-with-timer 0 (* 1 60) 'switch)

(provide 'theme-switcher)

;;; theme-switcher.el ends here
