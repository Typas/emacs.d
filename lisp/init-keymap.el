(define-key global-map (kbd "RET") 'newline)
(define-key global-map (kbd "C-j") 'newline-and-indent)
(define-key global-map (kbd "C-c c") 'comment-region)
(define-key global-map (kbd "C-c u") 'uncomment-region)

;; switching window
;; (define-key global-map (kdb "C-c w h") 'left-window)
;; (define-key global-map (kdb "C-c w j") 'down-window)
;; (define-key global-map (kdb "C-c w k") 'up-window)
;; (define-key global-map (kdb "C-c w l") 'right-window)

(provide 'init-keymap)
