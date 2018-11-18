(when (maybe-require-package 'markdown-mode)
  (add-auto-mode 'markdown-mode "\\.md\\'"))

(provide 'init-markdown)
