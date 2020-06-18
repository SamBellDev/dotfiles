;;; chasinglogic-misc.el --- Utility and other packages that just don't fit anywhere else

;; Copyright (C) 2020 Mathew Robinson

;; Author: Mathew Robinson <mathew@chasinglogic.io>
;; Created: 24 Feb 2020

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; 

;;; Code:

(use-package crux
  :general (leader!
             "fS" 'crux-sudo-edit
             "fD" 'crux-delete-buffer-and-file
             "fr" 'crux-rename-buffer-and-file
             "x" '(lambda () (interactive) (ansi-term (executable-find "bash")))
             "'" 'crux-visit-term-buffer)
  :bind (("C-a" . crux-move-beginning-of-line)
         ("C-k" . crux-smart-kill-line)
         ("C-c f D" . crux-delete-buffer-and-file)
         ("C-c f r" . crux-rename-buffer-and-file)
         ("C-c '" . crux-visit-term-buffer)
         ("C-x '" . crux-visit-term-buffer)))

;; Better terminal emulator for Emacs
(when module-file-suffix
  (use-package vterm
    :commands 'vterm
    :init
    (defun crux-vterm (buffer-name)
      (vterm (format "*%s*" buffer-name)))
    (setq crux-term-func #'crux-vterm)))

(use-package buffer-flip
  :bind  (:map buffer-flip-map
               ("M-<tab>" .   buffer-flip-forward) 
               ("M-S-<tab>" . buffer-flip-backward) 
               ("M-ESC" .     buffer-flip-abort))
  :general (leader!
             "TAB" 'buffer-flip))

(use-package multi-line
  :config (setq-default multi-line-current-strategy
                        (multi-line-strategy
                         :respace (multi-line-default-respacers
                                   (make-instance multi-line-always-newline))))
  :bind ("C-;" . multi-line))


(use-package ace-window
  :bind ("M-o" . ace-window))

(provide 'chasinglogic-misc)

;;; chasinglogic-misc.el ends here
