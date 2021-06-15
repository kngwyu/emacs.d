;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; I use nix + direnv instead of virtualenv/pyenv/pyvenv, and it is an
;; approach which extends to other languages too. I recorded a
;; screencast about this: https://www.youtube.com/watch?v=TbIHRHy7_JM


(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))


(setq-default flycheck-python-flake8-executable "python3")
(setq python-shell-interpreter "python3")
(require-package 'pip-requirements)

(maybe-require-package 'cython-mode)
(setq-default python-indent-def-block-scale 1)

(when (maybe-require-package 'jedi-core)
  (setq-default jedi:complete-on-dot t)
  (setq-default jedi:use-shortcuts t)
  (setq jedi:environment-virtualenv
        (list "virtualenv" "--python" "python3" "--system-site-packages"))
  (add-hook 'python-mode-hook 'jedi:setup))

(when (boundp 'display-fill-column-indicator)
  (add-hook 'python-mode-hook
            (lambda ()
              (setq-local display-fill-column-indicator-column 89))))

(when (maybe-require-package 'python-black)
  (add-hook 'python-mode-hook 'python-black-on-save-mode))

(when (maybe-require-package 'toml-mode)
  (add-to-list 'auto-mode-alist '("poetry\\.lock\\'" . toml-mode)))

(when (maybe-require-package 'reformatter)
  (reformatter-define black :program "black"))

(provide 'init-python)
;;; init-python.el ends here
