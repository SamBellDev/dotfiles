;;; chasinglogic-python.el --- Python language setup

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

(setq-default python-shell-interpreter (executable-find "python3")
              flycheck-python-pycompile-executable python-shell-interpreter)

(use-package pyvenv
  :config
  (defun chasinglogic-auto-activate-venv ()
    (let ((venv-dir (concat (projectile-project-root) "env")))
      (when (file-exists-p venv-dir)
        (pyvenv-activate venv-dir))))
  (add-hook 'projectile-after-switch-project-hook 'chasinglogic-auto-activate-venv)
  (pyvenv-mode))

;; Sort imports
(use-package py-isort
  :commands 'py-isort-buffer
  :init
  (add-hook 'python-mode-hook 'py-isort-before-save))

;; Next I use the Black Python formatter for my code. This package
;; integrates it into Emacs and lets me run it as an after save
;; hook. My hook has to be a little smarter however because my work
;; projects do not use this formatter so define a "black list" for
;; Black and only add the hook if we aren't in one of those projects.
(use-package blacken
  :commands 'blacken-buffer
  :init
  (setq-default chasinglogic-blacken-black-list
                '("scons"
                  "Work"))

  (defun chasinglogic-python-format-hook ()
    "Set up blacken-buffer on save if appropriate."
    (unless (or
             (member (projectile-project-name) chasinglogic-blacken-black-list)
             (seq-some '(lambda (item)
                          (string-match-p (regexp-quote item) (buffer-file-name)))
                       chasinglogic-blacken-black-list))
      (message "Not in a blacklisted project, enabling format on save.")
      (add-hook 'before-save-hook 'blacken-buffer nil t)))
  (add-hook 'python-mode-hook 'chasinglogic-python-format-hook))

(add-hook 'python-mode-hook 'chasinglogic-enable-lsp)

(provide 'chasinglogic-python)

;;; chasinglogic-python.el ends here
