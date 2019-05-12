;; Personal info
(setq user-full-name    "Stephen Whitmore"
      user-mail-address "sww@eight45.net")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Package management
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Save a few keystrokes
(fset 'yes-or-no-p 'y-or-n-p)

;; Make META play nicely on X
(setq x-alt-keysym 'meta)

;; Reload any loaded buffer if it changes on disk.
(global-auto-revert-mode t)

;; Easy no-prompt buffer kill
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
(global-set-key (kbd "M-o") 'kill-this-buffer)

;; Easier buffer navigation.
(global-set-key (kbd "M-j") 'next-buffer)
(global-set-key (kbd "M-k") 'previous-buffer)

;; Easier window navigation.
(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-,") 'prev-window)
(defun prev-window ()
  (interactive)
  (other-window -1))

;; Default font.
(set-face-attribute 'default nil :font "Ubuntu Mono" :height 120)
;;(add-to-list 'default-frame-alist '(font .  "Ubuntu Mono 12.0"))

;; Default browser.
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "chromium")

;; Paste the system clipboard into emacs.
(global-set-key (kbd "C-x C-p") 'x-clipboard-yank)

;; I <3 visual line mode
(global-visual-line-mode 1)

;; Prefer side-by-side when there's room.
(setq split-width-threshold 140)

;; Programming preferences.
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 2)
(setq-default tab-width 2)
(setq-default js-indent-level 2)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

(defun curl (url)
  "Fetches the raw data at URL and prints it to the current buffer."
  (interactive "sURL to fetch: ")
  (insert (shell-command-to-string (concat "curl -Ls " url))))

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
(global-set-key (kbd "C-x e") 'eval-and-replace)

;; Save backup files to /tmp.
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; org-mode
(setq org-log-done 'time)
(setq org-startup-indented t)
(setq org-agenda-files (list "~/dd/dd.org"))
(define-key global-map "\C-ca" 'org-agenda)
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT-ACTION(n)" "STARTED(s@/!)" "Q(q)" "WAITING(w@/!)" "APPT(a)" "DEFERRED(D@/!)" "DELEGATED(g@/!)" "PROJECT(p)" "INFO" "|" "DONE(d!)" "CANCELLED(x@/!)")))
(setq org-todo-keyword-faces
      '(("PROJECT" . (:foreground "medium sea green" :weight bold :underline t))
        ("WAITING" . "dark orange")))
(setq org-agenda-start-on-weekday nil)
(setq org-ellipsis "⤷")

;(setq org-agenda-custom-commands
;      '(("h" "Agenda and Home-related tasks"
;         ((agenda)
;          (tags-todo "home")
;          (tags "garden"
;                ((org-agenda-sorting-strategy '(priority-up)))))
;         ((org-agenda-sorting-strategy '(priority-down))))
;        ("o" "Agenda and Office-related tasks"
;         ((agenda)
;          (tags-todo "work")
;          (tags "office")))))

;; Always make sure an 'Effort' is set when clocking in to a task.
(add-hook 'org-clock-in-prepare-hook
          'my/org-mode-ask-effort)
(defun my/org-mode-ask-effort ()
  "Ask for an effort estimate when clocking in."
  (unless (org-entry-get (point) "Effort")
    (let ((effort
           (completing-read
            "Effort: "
            (org-entry-get-multivalued-property (point) "Effort"))))
      (unless (equal effort "")
        (org-set-property "Effort" effort)))))

;; Task dependencies
(setq org-enforce-todo-dependencies t)
(setq org-track-ordered-property-with-tag t)
(setq org-agenda-dim-blocked-tasks t)

;; org-capture
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-capture-templates  ; TODO(sww): update this; horribly out of date!!!
      '(("t" "Todo" entry (file+headline "~/new.org" "Inbox") "* TODO %^{Task}%?\n")
        ("d" "Dd Todo" entry (file+headline "~/dd/dd.org" "Inbox") "* TODO %^{Task}%?\n")
        ;("o" "Today Task" entry (file+headline "~/life.org" "Tasks") "* TODO %^{Task}\nSCHEDULED: %t\n%?" :immediate-finish t)
        ;("j" "Journal" entry (file+datetree "~/org/journal.org") "* %?\nEntered on %U\n  %i\n  %a")
        ))

;; TODO(sww): incorporate these into their respective sections.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(frame-background-mode (quote light))
 '(org-clock-clocktable-default-properties (quote (:maxlevel 2 :scope subtree)))
 '(org-deadline-warning-days 5)
 '(org-default-notes-file "~/life.org")
 '(org-habit-graph-column 45)
 '(org-habit-preceding-days 14)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (doom-themes slime protobuf-mode keyfreq json-mode rainbow-delimiters color-theme-solarized org gh ac-js2 js2-mode exec-path-from-shell flycheck google-maps ledger-mode ## paredit cider markdown-mode magit)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(eval-after-load 'org-agenda
  '(progn
     (define-key org-agenda-mode-map (kbd "s-<tab>") 'show-todo-org)
     (define-key org-agenda-mode-map (kbd "<return>") 'org-agenda-goto)))

(eval-after-load "org"
  '(progn
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

;(add-to-list 'load-path "~/.emacs.d/themes/emacs-color-theme-solarized/")
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;(load-theme 'solarized t)

;(load-theme 'sanityinc-tomorrow-blue t)
(load-theme 'sanityinc-tomorrow-day t)

;; I <3 visual line mode
(global-visual-line-mode 1)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun slime! ()
  (interactive)
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  (slime))

;; Javascript
(defun node/test-current-file ()
  (interactive)
  (let ((p (replace-regexp-in-string "^Directory " "" (pwd))))
    (cd "..")
    (message "Testing %s.." (buffer-name))
    (shell-command (format "node %s &" (buffer-file-name)))
    (cd p)
    (other-window 1)))
(defun npm-readme (module)
  "Opens a new buffer with the readme of the given module."
  (interactive "sModule name: ")
  (let ((buffer (get-buffer-create (generate-new-buffer-name "*README.md*"))))
    (pop-to-buffer buffer)
    (insert (shell-command-to-string (concat "npm --cache-min=999999999 info " module " readme &")))
    (with-current-buffer buffer (funcall 'markdown-mode))
    (beginning-of-buffer)
    (kill-line)
    )
  )
(defun node/npm-publish (semver)
  "Opens a new buffer with the readme of the given module."
  (interactive "sSemver (patch,minor,major): ")
  (shell-command (format "npp %s &" semver)))
(defun node/npm-test ()
  (interactive)
  (message "npm test'ing..")
  (shell-command "npm test &")
  (other-window 1))
(defun node/toggle-line-comment ()
  (interactive)
  (save-excursion
    (move-beginning-of-line 1)
    (if (looking-at "^//")
        (delete-char 2)
      (insert "//"))))

;; linting
(add-hook 'js-mode-hook
          (lambda () (progn
                       (define-key js-mode-map
                         (kbd "C-x n P")
                         (lambda (semver)
                           (interactive "sSemver: ")
                           (funcall node/npm-publish semver)))
                       (define-key js-mode-map
                         (kbd "C-x n t") 'node/test-current-file)
                       (define-key js-mode-map
                         (kbd "C-x n T") 'node/npm-test)
                       (define-key js-mode-map
                         (kbd "C-c C-c") 'node/toggle-line-comment)
                       (define-key js-mode-map
                         (kbd "C-x n r") 'npm-readme)
                       (flycheck-mode)
                       (flycheck-select-checker 'javascript-standard))))
                       ;(load "~/dev/writer-macros/writer-macros.el")
                       ;(wmac-mode)

(defun js-insert-require (module)
  "Insert a require statement for a module at the top of the file."
  (interactive "sModule name: ")
  (save-excursion
    (goto-char 0)
    (when (not (equal (current-word) "var")) (progn
                                               (insert "\n")
                                               (goto-char 0)))
    (insert (format "var %s = require('%s')\n"
                    (word-to-identifier module)
                    module))))

(defun word-to-js-identifier (word)
  "Converts a word, potentially hyphenated, into a valid Javascript identifier."
  (let ((parts (split-string word "-")))
    (string-join (cons (first parts) (mapcar #'capitalize (rest parts))) "")))

;; SSB
(defun ssb-publish-post-buffer ()
  (interactive)
  (with-current-buffer (current-buffer)
    (buffer-string))
  (ssb-publish-post (buffer-string)))

(defun ssb-publish-post (text)
  (let ((santizied
         (replace-regexp-in-string "\n" "\\\\n"
                                   (replace-regexp-in-string "\""
                                                             "\\\\\""
                                                             text))))
    (write-region
     (format "{ \"type\": \"post\", \"text\": \"%s\" }" santizied)
     nil
     "/tmp/ssb-post"))
  (shell-command-to-string "sbot publish . < /tmp/ssb-post"))

;; org-notify
;(add-to-list 'load-path "~/.emacs.d/modules/")
;(require 'org-notify)
;(org-notify-start)
;(org-notify-add 'appt
;                '(:time "-1s" :period "20s" :duration 10
;                  :actions (-message -ding))
;                '(:time "15m" :period "2m" :duration 100
;                  :actions -notify)
;                '(:time "2h" :period "5m" :actions -message)
;                '(:time "3d" :actions -email))


(defun distraction-no ()
  (interactive)
  (scroll-bar-mode 0)    ; Turn off scrollbars.
  (tool-bar-mode 0)      ; Turn off toolbars.
  (fringe-mode 0)        ; Turn off left and right fringe cols.
  (menu-bar-mode 0)      ; Turn off menus.
  (toggle-frame-fullscreen))

(defun distraction-yes ()
  (interactive)
  (scroll-bar-mode 1)    ; Turn on scrollbars.
  (tool-bar-mode 0)      ; Turn off toolbars.
  (fringe-mode 1)        ; Turn on left and right fringe cols.
  (menu-bar-mode 1)      ; Turn on menus.
  (toggle-frame-fullscreen))

;; enable mail-mode for mutt emails
(add-to-list 'auto-mode-alist '("mutt-" . mail-mode))

;; Use user's $PATH
(exec-path-from-shell-initialize)

(defun open-cl-project (name)
  ;; Q: how to wait for the above eval to finish before clearing the buffer?
  "Open a common lisp project. Assumes a location of \"~/dev/$NAME\", and that it is symlinked to from \"~/quicklisp/local-projects/\"."
  (interactive "sProject name: ")
  ;; go to the project directory
  (cd (concat "~/dev/" name))

  ;; start slime
  (slime!)

  ;; idle until slime and sbcl have started and are ready
  (while (not (slime-connected-p))
    (sleep-for 1 500))

  ;; quickload the project (ok, "system") and make it the current *PACKAGE*
  (let ((program (concat "(progn (ql:quickload :" name ") (in-package :" name "))")))
    (slime-repl-eval-string program)))

(global-set-key (kbd "C-c C-c C-l C-p") 'open-cl-project)

(set-face-attribute 'default nil :font "Ubuntu Mono" :height 120)

;; Offline HyperSpec
(setq common-lisp-hyperspec-root (expand-file-name "~/.emacs.d/HyperSpec/"))

;; Smoother mouse wheel scrolling
;; via https://www.emacswiki.org/emacs/SmoothScrolling
(setq mouse-wheel-scroll-amount '(2 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      scroll-conservatively 10000
      auto-window-vscroll auto-window-vscroll)
