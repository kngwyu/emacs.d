;;; init-yatex.el --- yatex configuration
;;; Commentary:
;;; Code:


;;; YaTeX configuration option
(when (maybe-require-package 'yatex)
  (setq auto-mode-alist (cons '("\\.tex$" . yatex-mode) auto-mode-alist))
  (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
  (setq-default YaTeX-latex-message-code 'utf-8)
  (setq-default YaTeX-use-LaTeX2e t)
  (setq-default tex-command "latexmk -gg -pdf")
  (setq-default dvi2-command "evince"))

(provide 'init-yatex)
;;; init-yatex.el ends here
