(require-package 'git-blamed)
(require-package 'gitignore-mode)
(require-package 'gitconfig-mode)
(maybe-require-package 'git-timemachine)


(when (maybe-require-package 'magit)
  (setq-default magit-diff-refine-hunk t)
  (global-set-key (kbd "C-x g") 'magit-status)
  (global-set-key (kbd "C-c g") 'magit-dispatch-popup))

(after-load 'magit
  (maybe-require-package 'magit-todos)
  (magit-todos-mode 1))

(when (maybe-require-package 'git-commit)
  (add-hook 'git-commit-mode-hook 'goto-address-mode))

(when *is-a-mac*
  (after-load 'magit
    (add-hook 'magit-mode-hook (lambda () (local-unset-key [(meta h)])))))

(provide 'init-git)
