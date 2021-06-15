;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'rustic)
  (setq lsp-rust-analyzer-server-command '("/usr/bin/rust-analyzer"))
  (setq rustic-lsp-client 'eglot)
  (with-eval-after-load 'rustic-mode
    (custom-set-variables '(rustic-format-on-save t)))
  (when (maybe-require-package 'eglot)
    (with-eval-after-load 'rustic-mode
      (custom-set-variables '(rustic-lsp-client 'eglot)))))

(when (boundp 'display-fill-column-indicator)
  (with-eval-after-load 'rustic-mode
    (add-hook 'rust-mode-hook
              (lambda ()
                (setq-local display-fill-column-indicator-column 100)))))

(provide 'init-rust)
;;; init-rust.el ends here
