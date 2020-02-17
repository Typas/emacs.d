(when *is-a-mac*
  (maybe-require-package 'grab-mac-link))

(maybe-require-package 'org-cliplink)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)

;; subscript must be embraced with {}
(setq org-use-sub-superscripts "{}"       ;; remove footnote of html
      org-html-postamble nil              ;; export to html5
      org-html-html5-fancy t
      org-html-doctype "html5"
      org-export-with-section-numbers nil ;; remove numbering
      org-export-preserve-breaks t) ;; linebreaks


;; set default html color and background of code block
(defun my-org-inline-css-hook (exporter)
  "Insert custom inline css"
  (when (eq exporter 'html)
    (setq org-export-default-language "zh-TW")
    (setq org-html-head-include-default-style nil)
    (setq org-html-head (concat "<style type=\"text/css\">\n <!--/*--><![CDATA[/*><!--*/\n" (with-temp-buffer
                                                                                              (insert-file-contents-literally "~/.emacs.d/org-head.css")
                                                                                              (buffer-substring-no-properties (point-min) (point-max))) " /*]]>*/-->\n</style>\n"))))
(add-hook 'org-export-before-processing-hook 'my-org-inline-css-hook)

;; use emphasis with chinese words
(after-load 'org
  (setcar (nthcdr 0 org-emphasis-regexp-components) " \t('\"{[:nonascii:]")
  (setcar (nthcdr 1 org-emphasis-regexp-components) "- \t.,:!?;'\")}\\[[:nonascii:]")
  (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
  (org-element-update-syntax))

;; nested todo auto done when children done
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; Re-align tags when window shape changes
(after-load 'org-agenda
  (add-hook 'org-agenda-mode-hook
            (lambda () (add-hook 'window-configuration-change-hook 'org-agenda-align-tags nil t))))

(after-load 'org
  (when *is-a-mac*
    (define-key org-mode-map (kbd "M-h") nil)
    (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link))
  (maybe-require-package 'ob-rust)
  (maybe-require-package 'ob-kotlin)
  (org-babel-do-load-languages
   'org-babel-load-languages
   `((emacs-lisp . t)
     (haskell . nil)
     (latex . t)
     (python . t)
     (rust . t)
     (kotlin . t))))

(provide 'init-org)
