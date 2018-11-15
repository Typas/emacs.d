(when (maybe-require-package 'rust-mode)
  (after-load 'eglot
    (add-hook 'rust-mode-hook 'eglot-ensure))
  )

(when (maybe-require-package 'flycheck-rust)
  (after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))


(provide 'init-rust)
