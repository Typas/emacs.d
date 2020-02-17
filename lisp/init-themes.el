(require-package 'solarized-theme)
(require-package 'color-theme-sanityinc-tomorrow)

(load-theme 'sanityinc-tomorrow-eighties t)

(global-set-key (kbd "C-c t") #'switch-theme-variant)

(defvar *current-theme-dark* 'sanityinc-tomorrow-eighties)
(defvar *current-theme-light* 'solarized-light)
(defvar *current-theme-variant* 'dark)
(defun switch-theme-variant ()
  "Switch custom themes between dark and light theme"
  (interactive)
  (cond ((eq *current-theme-variant* 'light)
         (disable-theme *current-theme-light*)
         (load-theme *current-theme-dark*)
         (setq *current-theme-variant* 'dark))
        ((eq *current-theme-variant* 'dark)
         (disable-theme *current-theme-dark*)
         (load-theme *current-theme-light*)
         (setq *current-theme-variant* 'light))
        (t (error "unknown theme variant"))))


(when (maybe-require-package 'dimmer)
  (setq-default dimmer-fraction 0.15)
  (add-hook 'after-init-hook 'dimmer-mode))

(provide 'init-themes)
