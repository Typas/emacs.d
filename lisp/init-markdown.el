(when (maybe-require-package 'markdown-mode)
  (add-auto-mode 'markdown-mode "\\.md\\'"))

(after-load 'markdown-mode
  (setq markdown-fontify-code-blocks-natively t))

(provide 'init-markdown)
