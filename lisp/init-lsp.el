;; use eglot instead of lsp-mode

(require-package 'eglot)
;; disable flymake from eglot
(add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

(provide 'init-lsp)
