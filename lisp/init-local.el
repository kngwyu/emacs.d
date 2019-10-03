;;; init-locales.el --- Local configuration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (member "CamingoCode" (font-family-list))
  (set-face-attribute 'default nil :family "Camingo Code" :height 118)  )
(set-fontset-font t 'japanese-jisx0208 (font-spec :family "IPA Gothic" :height 118))
(maybe-require-package 'dracula-theme)
(maybe-require-package 'fish-mode)

(unless (site-lisp-library-loadable-p 'undo-tree)
  (byte-compile-file (site-lisp-library-el-path 'undo-tree)))

(require 'undo-tree)
(after-load 'undo-tree
  (global-undo-tree-mode t)
  (global-set-key (kbd "C-\\") 'undo-tree-redo))


(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "<hiragana-katakana>") 'toggle-input-method)

(provide 'init-local)
;;; init-local.el ends here
