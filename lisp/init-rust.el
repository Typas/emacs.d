(require-package 'rust-mode)

(after-load 'rust-mode
  (when (and (executable-find "rls")
             (maybe-require-package 'eglot))
    (add-hook 'rust-mode-hook 'eglot-ensure)))

(when (maybe-require-package 'flycheck-rust)
  (after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(provide 'init-rust)
