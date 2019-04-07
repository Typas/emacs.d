(require-package 'julia-mode)

(after-load 'julia-mode
  (when (maybe-require-package 'julia-repl)
    (add-hook 'julia-mode-hook 'julia-repl-mode))
  ;; (when (maybe-require-package 'eglot)
  ;;   (add-hook 'julia-mode-hook 'eglot-ensure))
  )

(provide 'init-julia)
