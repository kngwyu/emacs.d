;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(setq-default flycheck-python-flake8-executable "python3")

(when (maybe-require-package 'jedi-core)
  (setq-default jedi:complete-on-dot t)
  (setq-default jedi:use-shortcuts t)
  (after-load 'python
    (add-hook 'python-mode-hook 'jedi:setup)))

(provide 'init-python)
;;; init-python.el ends here
