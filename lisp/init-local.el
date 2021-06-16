;;; init-locales.el --- Local configuration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (member "HackGen" (font-family-list))
  (set-face-attribute 'default nil :family "HackGen35" :height 120))
(when (member "Source Code Pro" (font-family-list))
  (set-fontset-font t 'japanese-jisx0208 (font-spec :family "Source Code Pro" :height 120)))
(maybe-require-package 'fish-mode)
(setq history-delete-duplicates t)

(when (maybe-require-package 'doom-themes)
  (load-theme 'doom-dracula t))

(when (maybe-require-package 'undo-tree)
  (global-undo-tree-mode t)
  (global-set-key (kbd "C-\\") 'undo-tree-redo)
  (global-set-key (kbd "C-/") 'undo-tree-undo)
  (global-set-key (kbd "C-x u") 'undo-tree-visualize))

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
(global-set-key (kbd "C-'") 'set-mark-command)
(global-set-key (kbd "<hiragana-katakana>") 'toggle-input-method)

(when (maybe-require-package 'powerline)
  (powerline-center-theme))

(when (maybe-require-package 'atomic-chrome)
  (atomic-chrome-start-server))

;; My consult settings
(when (package-installed-p 'consult)
  (global-set-key (kbd "C-x b") 'consult-buffer)
  (global-set-key (kbd "M-s o") 'consult-line)
  (when (package-installed-p 'affe)
    (global-set-key (kbd "C-M-g") 'affe-grep)
    (global-set-key (kbd "C-x f") 'affe-find)
    (setq affe-regexp-function #'orderless-pattern-compiler
          affe-highlight-function #'orderless--highlight)
    (when (executable-find "fd")
      (setq affe-find-command "fd --color=never --full-path"))))

(when (and (executable-find "keychain")
           (maybe-require-package 'keychain-environment))
  (keychain-refresh-environment))


(let ((alpha80 '(alpha . 80)))
  (add-to-list 'default-frame-alist alpha80)
  (add-to-list 'default-frame-alist alpha80))

(defun set-alpha (n-alpha)
  "Set frame parameter alpha by N-ALPHA."
  (interactive "N-ALPHA?: ")
  (set-frame-parameter nil 'alpha (cons n-alpha '(80))))

(provide 'init-local)
;;; init-local.el ends here
