;;; init-skk.el --- setup ddskk
;;; Commentary:
;;; Code:

(when (maybe-require-package 'ddskk)
  (global-set-key (kbd "C-x a f") 'auto-fill-mode)
  (global-set-key (kbd "C-x j") 'skk-mode)
  (setq-default skk-show-candidates-nth-henkan-char 3)
  (setq-default skk-henkan-number-to-display-candidates 8)
  (setq-default skk-auto-insert-paren t)
  (setq-default skk-show-tooltip t)
  (setq-default skk-tooltip-parameters
                '((background-color . "dark blue")
                  (border-color     . "alice blue")
                  (foreground-color . "gray")
                  (internal-border-width . 2)))
  (setq-default skk-use-search-web t)
  (defun my-skk-mode-hook nil
    "Configure skk mode."
    (if (eq major-mode 'yatex-mode)
        (progn
          (define-key skk-j-mode-map "\\" 'self-insert-command)
          (define-key skk-j-mode-map "$" 'YaTeX-insert-dollar))))
  (with-eval-after-load 'ddskk
    (add-hook 'skk-mode-hook 'my-skk-mode-hook)))

(provide 'init-skk)
;;; init-skk.el ends here
