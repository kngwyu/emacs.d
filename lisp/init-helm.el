;;; init-helm.el --- Initialize helm
;;; Commentary:
;;; Code:

(when (maybe-require-package 'helm)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (setq-default dired-bind-jump nil)
  (with-eval-after-load 'helm
    (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
    (define-key helm-map (kbd "C-z")  'helm-select-action))
  (require 'helm-config))

(provide 'init-helm)
;;; init-helm.el ends here
