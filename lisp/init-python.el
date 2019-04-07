(require-package 'pip-requirements)

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode)))

;; (after-load 'eglot
;;   (add-hook 'python-mode-hook 'eglot-ensure))

(provide 'init-python)
