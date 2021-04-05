;;; init-helm.el --- Initialize helm
;;; Commentary:
;;; Code:

(when (maybe-require-package 'helm)
  (setq-default dired-bind-jump nil)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x f") 'helm-find-files)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z")  'helm-select-action))
  (when (and (executable-find "rg")
             (maybe-require-package 'helm-ag))
    (global-set-key (kbd "C-M-g") 'helm-do-ag)
    (global-set-key (kbd "C-M-k") 'backward-kill-sexp)
    (global-set-key (kbd "M-?") 'rg-project)
    (setq-default helm-ag-base-command "rg --vimgrep --no-heading"))
  (when (maybe-require-package 'helm-swoop)
    (global-set-key (kbd "M-s o") 'helm-swoop))
  (require 'helm-config))

(provide 'init-helm)
;;; init-helm.el ends here
