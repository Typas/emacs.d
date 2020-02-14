(when (maybe-require-package 'origami)
  (add-hook 'prog-mode-hook 'origami-mode)
  (after-load 'origami
    (define-key origami-mode-map (kbd "C-c f r") 'origami-recursively-toggle-node)
    (define-key origami-mode-map (kbd "C-c f a") 'origami-toggle-all-nodes)))


(provide 'init-folding)
