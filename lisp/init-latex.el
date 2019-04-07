(when (maybe-require-package 'auctex)
  ;; use XeTeX instead of TeX for unicode support
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (add-to-list 'TeX-command-list
                                            '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                               (setq TeX-command-default "XeLaTeX")
                               (setq TeX-save-query nil)
                               (setq TeX-show-compilation t)))
  (after-load 'company
    (when (maybe-require-package 'company-auctex)
      (company-auctex-init))))

;; (when (maybe-require-package 'eglot)
;;   (add-to-list 'eglot-server-programs '(LaTeX-mode . ("latex-lsp")))
;;   (add-hook 'LaTeX-mode-hook 'eglot-ensure))

(provide 'init-latex)
