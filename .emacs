(setq org-log-done 'time)
(setq org-startup-indented t)
(setq org-agenda-files (list "~/todo.org"))
(define-key global-map "\C-ca" 'org-agenda)

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-stable")

(global-set-key (kbd "C-x C-p") 'x-clipboard-yank)
