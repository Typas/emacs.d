;;; -*- lexical-binding: t -*-

;; NOTE: This is not about the "Windows" OS, but rather Emacs's
;; "windows" concept: these are the panels within an Emacs frame which
;; contain buffers.

;;----------------------------------------------------------------------------
;; Navigate window layouts with "C-c <left>" and "C-c <right>"
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook 'winner-mode)

(when (maybe-require-package 'ace-window)
  (global-set-key (kbd "C-x o") 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
	    aw-background nil
	    aw-minibuffer-flag t))

(provide 'init-windows)
