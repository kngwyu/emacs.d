;;; init-grep.el --- Settings for grep and grep-like tools -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default grep-highlight-matches t
              grep-scroll-output t)

(when *is-a-mac*
  (setq-default locate-command "mdfind"))

(require-package 'wgrep)
(after-load 'grep
  (dolist (key (list (kbd "C-c C-q") (kbd "w")))
    (define-key grep-mode-map key 'wgrep-change-to-wgrep-mode)))

(when (and (executable-find "rg")
           (maybe-require-package 'helm-ag))
  (global-set-key (kbd "C-M-g") 'helm-do-ag)
  (global-set-key (kbd "C-M-k") 'backward-kill-sexp)
  (setq-default helm-ag-base-command "rg --vimgrep --no-heading"))

(when (and (executable-find "rg")
           (maybe-require-package 'rg))
  (global-set-key (kbd "M-?") 'rg-project))

(when (maybe-require-package 'helm-swoop)
  (global-set-key (kbd "M-s o") 'helm-swoop))

(provide 'init-grep)
;;; init-grep.el ends here
