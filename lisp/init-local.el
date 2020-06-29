;;; init-locales.el --- Local configuration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (member "HackGen" (font-family-list))
  (set-face-attribute 'default nil :family "HackGen35" :height 120))
(maybe-require-package 'doom-themes)
(maybe-require-package 'fish-mode)
(setq history-delete-duplicates t)

(unless (site-lisp-library-loadable-p 'undo-tree)
  (byte-compile-file (site-lisp-library-el-path 'undo-tree)))

(require 'undo-tree)
(after-load 'undo-tree
  (global-undo-tree-mode t)
  (global-set-key (kbd "C-\\") 'undo-tree-redo))

(when (maybe-require-package 'treemacs)
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  (treemacs-resize-icons 16)
  (global-set-key (kbd "M-0") 'treemacs-select-window)
  (global-set-key (kbd "C-x t 1") 'treemacs-delete-other-windows)
  (global-set-key (kbd "C-x t t") 'treemacs)
  (global-set-key (kbd "C-x t B") 'treemacs-bookmark)
  (global-set-key (kbd "C-x t C-t") 'treemacs-find-file)
  (global-set-key (kbd "C-x t M-t") 'treemacs-find-tag))


(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "<hiragana-katakana>") 'toggle-input-method)

(provide 'init-local)
;;; init-local.el ends here
