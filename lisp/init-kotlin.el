(when (maybe-require-package 'kotlin-mode)
  (when (and (executable-find "kotlin-language-server")
             (maybe-require-package 'eglot))
    (add-hook 'kotlin-mode-hook 'eglot-ensure)))

(provide 'init-kotlin)
