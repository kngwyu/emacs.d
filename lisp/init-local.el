;;; init-locales.el --- Local configuration  -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(set-face-attribute 'default nil :family "Camingo Code" :height 124)
(set-fontset-font t 'japanese-jisx0208 (font-spec :family "IPA Gothic" :height 124))
(maybe-require-package 'dracula-theme)

(provide 'init-local)
;;; init-local.el ends here
