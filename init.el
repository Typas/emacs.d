;; -*- lexical-binding: t -*-
;; code construct from Steve Purcell, github.com/purcell
;; and from Chen Bin, github.com/redguardtoo

(setq debug-on-error t)

(let ((minver "26.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *is-a-mac* (eq system-type 'darwin))


;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024)) ;; 20MB
      (init-gc-cons-threshold (* 128 1024 1024)))  ;; 128MB
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH


;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require-package 'diminish)
(require-package 'wgrep)
(require-package 'scratch)

(require 'init-frame-hooks)
(require 'init-xterm)
(require 'init-osx-keys)
(require 'init-gui-frames)

(require 'init-keymap)
(require 'init-themes)
(require 'init-evil)
(require 'init-vc)
(require 'init-git)
(require 'init-projectile)
(require 'init-grep)
(require 'init-dired)
(require 'init-flycheck)

(require 'init-ivy)
(require 'init-company)
(require 'init-windows)
;; (require 'init-lsp)

(require 'init-editing-utils)
(require 'init-whitespace)

(require 'init-compile)
(require 'init-c-and-cpp)
(require 'init-org)
(require 'init-haskell)
(require 'init-rust)
(require 'init-julia)
(require 'init-python)
(require 'init-kotlin)
(require 'init-javascript)
(require 'init-latex)
(require 'init-markdown)

(require 'init-paredit)
(require 'init-lisp)

(require 'init-folding)
(require 'init-dash)

;; Extra packages which don't require any configuration
(require-package 'htmlize)
(when *is-a-mac*
  (require-package 'osx-location))
(unless (eq system-type 'windows-nt)
  (maybe-require-package 'daemons))
(maybe-require-package 'dotenv-mode)
(when (maybe-require-package 'uptimes)
  (setq-default uptimes-keep-count 200)
  (add-hook 'after-init-hook (lambda () (require 'uptimes))))

;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook
          (lambda ()
            (require 'server)
            (unless (server-running-p)
              (server-start))))

;;----------------------------------------------------------------------------
;; Variables configured via the interactive 'customize' interface
;;----------------------------------------------------------------------------
(when (file-exists-p custom-file)
  (load custom-file))

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-local" containing personal settings
;;----------------------------------------------------------------------------
(require 'init-local nil t)



(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
