;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'rust-mode)
  (after-load 'rust-mode
    (custom-set-variables '(rust-indent-method-chain t))
    (custom-set-variables '(rust-format-on-save t)))
  (when (maybe-require-package 'racer)
    (add-hook 'rust-mode-hook #'racer-mode))
  (when (maybe-require-package 'company)
    (add-hook 'racer-mode-hook #'company-mode))
  (when (maybe-require-package 'flycheck-rust)
    (after-load 'rust-mode
      (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))))

(provide 'init-rust)
;;; init-rust.el ends here
