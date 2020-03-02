(require-package 'rust-mode)

(after-load 'rust-mode
  (when (and (executable-find "rls")
             (maybe-require-package 'eglot))
    (add-hook 'rust-mode-hook 'eglot-ensure))
  (define-key rust-mode-map (kbd "C-x c") 'rust-compile)
  (define-key rust-mode-map (kbd "C-x r") 'rust-run))

(provide 'init-rust)
