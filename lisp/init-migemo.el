;;; init-migemo.el --- migemo
;;; Commentary:
;;; Code:

(when (maybe-require-package 'migemo)
  (setq-default migemo-command "cmigemo")
  (setq-default migemo-options '("-q" "--emacs"))
  ;; Set your installed path
  (setq-default migemo-dictionary  (expand-file-name "/usr/share/migemo/utf-8/migemo-dict"))
  (setq-default migemo-user-dictionary nil)
  (setq-default migemo-regex-dictionary nil)
  (setq-default migemo-coding-system 'utf-8-unix)
  (after-load 'migemo (migemo-init)))

(provide 'init-migemo)
;;; init-migemo.el ends here
