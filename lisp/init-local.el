(setq-default tab-width 4
			  tab-stop-list (number-sequence 4 200 4))
(setq-default indent-tabs-mode nil
			  indent-line-function 'insert-tab)

(provide 'init-local)
