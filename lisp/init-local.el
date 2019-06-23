;;; init-locales.el --- Local configuration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'dracula-theme)
  (load-theme 'dracula t))

(provide 'init-local)
;;; init-local.el ends here
