;;; init-python.el --- Python editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:


;; See the following note about how I set up python + virtualenv to
;; work seamlessly with Emacs:
;; https://gist.github.com/purcell/81f76c50a42eee710dcfc9a14bfc7240


(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
                ("SConscript\\'" . python-mode))
              auto-mode-alist))

(setq-default flycheck-python-flake8-executable "python3")
(maybe-require-package 'cython-mode)

(when (maybe-require-package 'jedi-core)
  (setq-default jedi:complete-on-dot t)
  (setq-default jedi:use-shortcuts t)
  (setq jedi:environment-virtualenv
        (list "virtualenv" "--python" "python3" "--system-site-packages"))
  (after-load 'python
    (add-hook 'python-mode-hook 'jedi:setup)))

(provide 'init-python)
;;; init-python.el ends here
