(setq-default c-default-style "linux"
              c-basic-offset 4)

(when (and (executable-find "ccls")
           (maybe-require-package 'eglot))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure))

(provide 'init-c-and-cpp)
