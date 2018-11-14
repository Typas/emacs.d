;; use eglot instead of lsp-mode

(when (maybe-require-package 'eglot)
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure))

(provide 'init-lsp)
