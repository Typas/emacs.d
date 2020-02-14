(require-package 'rust-mode)

(after-load 'rust-mode
  (when (and (executable-find "rls")
             (maybe-require-package 'eglot))
    (add-hook 'rust-mode-hook 'eglot-ensure)))

(provide 'init-rust)
