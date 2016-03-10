;; Personal info
(setq user-full-name "Stephen Whitmore"
      user-mail-address "stephen.whitmore@gmail.com")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; enable file encryption
(require 'epa-file)
(epa-file-enable)

;; Package management
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)

;; I'm lazy
(fset 'yes-or-no-p 'y-or-n-p)

;; Make META play nicely on X
(setq x-alt-keysym 'meta)

;; Reload any loaded buffer if it changes on disk.
(global-auto-revert-mode t)

;; Easier window navigation.
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-,") 'prev-window)
(defun prev-window ()
  (interactive)
  (other-window -1))

;; Default font.
(set-face-attribute 'default nil :font "Ubuntu Mono for Powerline" :height 120)
(add-to-list 'default-frame-alist '(font .  "Ubuntu Mono for Powerline 12"))

;; Default browser.
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

;; Paste the system clipboard into emacs.
(global-set-key (kbd "C-x C-p") 'x-clipboard-yank)

;; eval-and-replace
;; via http://emacsredux.com/blog/2013/06/21/eval-and-replace/
(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))))
(global-set-key (kbd "C-c e") 'eval-and-replace)

;; Save backup files to /tmp.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; org-mode
(setq org-log-done 'time)
(setq org-startup-indented t)
(setq org-agenda-files (list "~/todo.org"))
(define-key global-map "\C-ca" 'org-agenda)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING" "DELEGATED" "BLOCKED" "PROBLEM" "|" "DONE(d)" "CANCELLED")))
      ; '((sequence "TODO(t)" "STARTED(s@/!)" "WAITING(@/!)" "DELEGATED(@/!)" "PROBLEM" "|" "DONE(d!)" "CANCELLED(@/!)")))
(setq org-agenda-start-on-weekday nil)
(setq org-ellipsis "⤷")

;; task dependencies
(setq org-enforce-todo-dependencies t)
(setq org-track-ordered-property-with-tag t)
(setq org-agenda-dim-blocked-tasks t)

;; org-capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates  ; TODO(sww): update this; horribly out of date!!!
 '(("t" "Todo" entry (file+headline "~/todo.org" "Tasks") "* TODO %^{Task}\nSCHEDULED: %^t\n%?\n")
   ("e" "Expense" plain (file "~/Sync/personal/expenses.csv") "%(org-read-date),%^{Payee},%^{Amount}" :immediate-finish t)
   ("o" "Today Task" entry (file+headline "~/todo.org" "Tasks") "* TODO %^{Task}\nSCHEDULED: %t\n%?" :immediate-finish t)
   ("j" "Journal" entry (file+datetree "~/org/journal.org") "* %?\nEntered on %U\n  %i\n  %a")))

;; TODO(sww): incorporate these into their respective sections.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2f5b8b4d2f776fd59c9f9a1d6a45cdb75a883c10a9426f9a50a4fea03b1e4d89" default)))
 '(org-deadline-warning-days 1)
 '(org-default-notes-file "~/todo.org")
 '(org-habit-graph-column 57)
 '(org-habit-preceding-days 14)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

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
;     (add-hook 'after-save-hook
;	       (lambda ()
;		 (if (member major-mode (list 'org-mode))
;		     (progn
;		       (org-agenda-list)
;		       (other-window 1)))))

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

(add-to-list 'load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;(load-theme 'solarized t)

;; I <3 visual line mode
(global-visual-line-mode 1)
