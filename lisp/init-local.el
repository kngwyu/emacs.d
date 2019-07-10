;;; init-locales.el --- Local configuration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (member "CamingoCode" (font-family-list))
  (set-face-attribute 'default nil :family "Camingo Code" :height 124)  )
(set-fontset-font t 'japanese-jisx0208 (font-spec :family "IPA Gothic" :height 124))
(maybe-require-package 'dracula-theme)

(when (maybe-require-package 'undo-tree)
  (global-undo-tree-mode t)
  (global-set-key (kbd "C-\\") 'undo-tree-redo))

(provide 'init-local)
;;; init-local.el ends here
