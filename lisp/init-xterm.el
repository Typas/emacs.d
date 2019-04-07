(require 'init-frame-hooks)

(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))

(autoload 'mwheel-install "mwheel")

(defun typas/console-frame-setup ()
  (xterm-mouse-mode 1) ; Mouse in a terminal (Use shift to paste with middle button)
  (mwheel-install)
  (setq mouse-wheel-scroll-amount '(0 ((shift) . 1)))
  (setq mouse-wheel-progressive-speed nil))

(add-hook 'after-make-console-frame-hooks 'typas/console-frame-setup)

(provide 'init-xterm)
