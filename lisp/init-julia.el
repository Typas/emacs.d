;;; init-rust.el --- Support for the Julia language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'julia-mode)

(after-load 'julia-mode
  (when (maybe-require-package 'julia-repl)
    (add-hook 'julia-mode-hook 'julia-repl-mode))
  )

(provide 'init-julia)
;;; init-julia.el ends here
