(when (maybe-require-package 'julia-mode)
  (after-load 'eglot
    (add-hook 'julia-mode-hook 'eglot-ensure)))

(after-load 'julia-mode
  (when (maybe-require-package 'julia-repl)
    (add-hook 'julia-mode-hook 'julia-repl-mode)))

(provide 'init-julia)
