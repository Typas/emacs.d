(require-package 'haskell-mode)

(add-auto-mode 'haskell-mode "\\.ghci\\'")

;; Indentation
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;; Source code helpers

(add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)

(when (maybe-require-package 'hindent)
  (add-hook 'haskell-mode-hook 'hindent-mode)
  (after-load 'hindent
    (when (require 'nadvice)
      (defun sanityinc/hindent--before-save-wrapper (oldfun &rest args)
        (with-demoted-errors "Error invoking hindent: %s"
          (let ((debug-on-error nil))
            (apply oldfun args))))
      (advice-add 'hindent--before-save :around 'sanityinc/hindent--before-save-wrapper))))

(after-load 'haskell-mode
  (define-key haskell-mode-map (kbd "C-c h") 'hoogle)
  (define-key haskell-mode-map (kbd "C-o") 'open-line))


(after-load 'page-break-lines
  (push 'haskell-mode page-break-lines-modes))



(define-minor-mode stack-exec-path-mode
  "If this is a stack project, set `exec-path' to the path \"stack exec\" would use."
  nil
  :lighter ""
  :global nil
  (if stack-exec-path-mode
      (when (and (executable-find "stack")
                 (locate-dominating-file default-directory "stack.yaml"))
        (setq-local
         exec-path
         (seq-uniq
          (append (list (concat (string-trim-right (shell-command-to-string "stack path --local-install-root")) "/bin"))
                  (parse-colon-path
                   (replace-regexp-in-string "[\r\n]+\\'" ""
                                             (shell-command-to-string "stack path --bin-path"))))
          'string-equal))
                                        ;(add-to-list (make-local-variable 'process-environment) (format "PATH=%s" (string-join exec-path path-separator)))
        )
    (kill-local-variable 'exec-path)))

(add-hook 'haskell-mode-hook 'stack-exec-path-mode)



(when (maybe-require-package 'dhall-mode)
  (add-hook 'dhall-mode-hook 'sanityinc/no-trailing-whitespace)
  (add-hook 'dhall-mode-hook 'stack-exec-path-mode))

(after-load 'haskell-mode
  (when (and (executable-find "hie")
             (maybe-require-package 'eglot))
    (add-hook 'haskell-mode-hook 'eglot-ensure)))

(provide 'init-haskell)
