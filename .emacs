;; Personal info
(setq user-full-name "Stephen Whitmore"
      user-mail-address "stephen.whitmore@gmail.com")

;; Package management
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; I'm lazy
(fset 'yes-or-no-p 'y-or-n-p)

;; TODO(sww): does this do what I want it to do?
(global-auto-revert-mode t)

;; Default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-stable")

;; Easy clipboard pasting
(global-set-key (kbd "C-x C-p") 'x-clipboard-yank)

;; Where in the world is..
(setq calendar-latitude 37.3382)
(setq calendar-longitude -121.8863)
(setq calendar-location-name "San Jose, CA")

;; orgmode
(setq org-log-done 'time)
(setq org-startup-indented t)
(setq org-agenda-files (list "~/todo.org"))
(define-key global-map "\C-ca" 'org-agenda)
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "WAITING" "LGTM" "SUBMIT" "|" "DONE" "CANCELLED")))

(custom-set-variables
 '(org-agenda-files (quote ("~/todo.org")))
 '(org-default-notes-file "~/notes.org")
 '(org-agenda-ndays 1))

(eval-after-load 'org-agenda
  '(progn
     (define-key org-agenda-mode-map (kbd "s-<tab>") 'show-todo-org)
     (define-key org-agenda-mode-map (kbd "<return>") 'org-agenda-goto)
     (defun mark-done-in-agenda () (interactive) (org-agenda-todo "DONE"))
     (defun mark-waiting-in-agenda () (interactive) (org-agenda-todo "WAITING"))
     (define-key org-agenda-mode-map (kbd "W") 'mark-waiting-in-agenda)
     (define-key org-agenda-mode-map (kbd "x") 'mark-done-in-agenda)))

(eval-after-load "org"
  '(progn
     ;; Refresh agenda on save
     (add-hook 'after-save-hook
	       (lambda ()
		 (if (member major-mode (list 'org-mode))
		     (progn
		       (org-agenda-list)
		       (other-window 1)))))

     ;; Handy shortcuts for moving around.
     (define-key org-mode-map (kbd "s-<tab>") 'org-agenda-list)
     (defun show-todo-org ()
       "Show my standard todo.org file."
       (interactive)
       (pop-to-buffer "todo.org"))

     (define-prefix-command 'org-todo-state-map)
     (define-key org-mode-map "\C-cx" 'org-todo-state-map)
     (define-key org-mode-map "\C-\M-j" 'org-insert-todo-heading)
     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "t"
       #'(lambda nil (interactive) (org-todo "TODO")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "LGTM")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))))

