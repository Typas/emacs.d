(setq-default c-default-style "linux"
              c-basic-offset 4)

;; actually, this is for irony-mode
(when (maybe-require-package 'irony)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode))

(after-load 'company
  (require-package 'company-irony)
  (require-package 'company-c-headers)
  (push 'company-irony company-backends)
  (push 'company-c-headers company-backends))

(provide 'init-c-and-cpp)
