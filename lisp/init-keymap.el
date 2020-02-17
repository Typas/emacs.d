(global-set-key (kbd "RET") 'newline)
(global-set-key (kbd "C-j") 'newline-and-indent)
(global-set-key (kbd "C-.") 'set-mark-command)
(global-set-key (kbd "C-x C-.") 'pop-global-mark)
;; set C-z to marker as C-@, still have C-x C-z
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'set-mark-command)


(provide 'init-keymap)
