(setq org-log-done 'time)
(setq org-startup-indented t)
(setq org-agenda-files (list "~/todo.org"))
(define-key global-map "\C-ca" 'org-agenda)

(global-auto-revert-mode t)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-stable")

(global-set-key (kbd "C-x C-p") 'x-clipboard-yank)

(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "WAITING" "|" "DONE" "CANCELLED")))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(custom-set-variables
 '(org-agenda-files (quote ("~/todo.org")))
 '(org-default-notes-file "~/notes.org"))

(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "t"
       #'(lambda nil (interactive) (org-todo "TODO")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))))

