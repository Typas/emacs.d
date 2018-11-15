(when (maybe-require-package 'julia-mode)
  (after-load 'eglot
    (add-hook 'julia-mode-hook 'eglot-ensure)))

(provide 'init-julia)
