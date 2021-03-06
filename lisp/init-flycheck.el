;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  (setq flycheck-display-errors-delay 1.0)
  (when (maybe-require-package 'flycheck-color-mode-line)
    (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))
  (when (and (maybe-require-package 'pos-tip) (maybe-require-package 'flycheck-pos-tip))
    (add-hook 'flycheck-mode-hook 'flycheck-pos-tip-mode))
  (with-eval-after-load 'flycheck
    (define-key flycheck-mode-map (kbd "M-n") 'flycheck-next-error)
    (define-key flycheck-mode-map (kbd "M-p") 'flycheck-previous-error)))

(provide 'init-flycheck)
;;; init-flycheck.el ends here

