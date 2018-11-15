(define-key global-map (kbd "RET") 'newline)
(define-key global-map (kbd "C-j") 'newline-and-indent)
(define-key global-map (kbd "C-c c") 'comment-region)
(define-key global-map (kbd "C-c u") 'uncomment-region)

(provide 'init-keymap)
