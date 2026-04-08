;;; init-c-and-cpp.el --- Support for the C and C++ language-*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (and (executable-find "clangd")
           (maybe-require-package 'eglot))
  (add-hook 'c-mode-hook 'eglot-ensure)
  (add-hook 'c++-mode-hook 'eglot-ensure))

(provide 'init-c-and-cpp)
;;; init-c-and-cpp.el ends here
