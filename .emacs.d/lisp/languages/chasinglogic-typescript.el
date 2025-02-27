;;; chasinglogic-typescript.el --- Typescript language setup

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

;; TypeScript
;;
;; Nothing much to be done for TypeScript except install the major
;; mode as I don't work on it all that much.
(use-package typescript-mode
  :mode "\\.ts\\'"
  :config
  (setq-default typescript-auto-indent-flag nil)
  (defun chasinglogic-typescript-mode-hook ()
    "Disable electric-layout-mode"
    (electric-layout-mode -1))

  (add-hook 'typescript-mode-hook #'chasinglogic-typescript-mode-hook))

(provide 'chasinglogic-typescript)

;;; chasinglogic-typescript.el ends here
