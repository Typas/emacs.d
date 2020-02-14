(when (maybe-require-package 'kotlin-mode)
  (when (maybe-require-package 'eglot)
    (add-hook 'kotlin-mode-hook 'eglot-ensure)))

(provide 'init-kotlin)
