(require-package 'pip-requirements)

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)))

(when (and (executable-find "pyls")
           (maybe-require-package 'eglot))
  (add-hook 'python-mode-hook 'eglot-ensure))

(provide 'init-python)
