;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t))
(package-initialize)

(require 'use-package)

(setq package-enable-at-startup nil)

;; (setq org-cite-export-processors
;; '((latex biblatex)
;; (t csl)))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq straight-use-package-by-default nil)


(use-package emacs-conflict
  :straight (emacs-conflict :type git :host github :repo "ibizaman/emacs-conflict" :branch "master"))
;; (use-package eva
;;   :straight (eva :type git :host github :repo "meedstrom/eva"
;;                  :files (:defaults "assets" "renv" "*.R" "*.gnuplot")))

;; (straight-use-package
;;  :custom
;;   '(eva :type git :host github :repo "meedstrom/eva"
;;         :files (:defaults "assets" "renv" "*.R" "*.gnuplot")))
;; (setq eva-items
;;       (list (eva-item-create :fn #'eva-query-sleep
;;                              :dataset "~/self-data/sleep.tsv"
;;                              :min-hours-wait 5
;;                              :lookup-posted-time t)

;;             (eva-item-create :fn #'eva-query-weight
;;                              :dataset "~/self-data/weight.tsv"
;;                              :max-entries-per-day 1)

;;             (eva-item-create :fn #'eva-query-mood
;;                              :dataset "~/self-data/mood.tsv")))


;; (use-package eva

;;   ;; Things that should be set before load
;;   :custom

;;   (eva-va-name "Wynona")
;;   (eva-user-name "Thea")
;;   (eva-user-short-title "darling") ;; don't like titles? put in your name again

;;   (eva-idle-log-path         "~/self-data/idle.tsv")
;;   (eva-buffer-focus-log-path "~/self-data/buffer-focus.tsv")
;;   (eva-buffer-info-path      "~/self-data/Self_data/buffer-info.tsv")
;;   (eva-main-ledger-path      "~/finances.ledger")
;;   (eva-main-datetree-path    "~/org/diary.org")

;;   (ess-ask-for-ess-directory nil) ;; Prevent annoying ESS startup prompt.

;;   :config

;;   (require 'eva-builtin)

;;   ;; These are looked up by `eva-present-diary', but org-journal is not needed.
;;   (setq org-journal-dir "~/org/journal/")
;;   (setq org-journal-file-format "%F.org")

;;   (add-hook 'eva-after-load-vars-hook #'eva-check-dangling-clock)
;;   (add-hook 'eva-after-load-vars-hook #'eva-check-org-vars)

;;   ;; HINT: Though not likely you'll want to, you can use the same object
;;   ;; multiple times in the queue, you'll just have to assign the output of
;;   ;; an (eva-item-create) to an external variable and refer to it.
;;   (setq eva-items
;;         (list
;;          (eva-item-create :fn #'eva-greet
;;                           :min-hours-wait 1)

;;          (eva-item-create :fn #'eva-query-mood
;;                           :dataset "~/self-data/mood.tsv"
;;                           :min-hours-wait 1)

;;          (eva-item-create :fn #'eva-present-diary
;;                           :max-successes-per-day 1)

;;          (eva-item-create :fn #'eva-query-sleep
;;                           :dataset "~/self-data/sleep.tsv"
;;                           :min-hours-wait 5
;;                           :lookup-posted-time t)

;;          (eva-item-create :fn #'eva-present-ledger-report)

;;          ;; May be slow
;;          ;; (eva-item-create :fn #'eva-present-org-agenda-log-archive)
;;          (eva-item-create :fn #'eva-present-org-agenda-log)

;;          (eva-item-create :fn #'eva-query-ingredients
;;                           :dataset "~/self-data/ingredients.tsv"
;;                           :min-hours-wait 5)

;;          (eva-item-create :fn #'eva-query-cold-shower
;;                           :dataset "~/self-data/cold.tsv"
;;                           :max-entries-per-day 1)

;;          (eva-item-create :fn #'eva-query-activity
;;                           :dataset "~/self-data/activities.tsv"
;;                           :min-hours-wait 1)

;;          ;; you can inline define the functions too
;;          (eva-item-create
;;           :fn (eva-defun my-bye ()
;;                 (message (eva-emit "All done for now."))
;;                 (bury-buffer (eva-buffer-chat)))
;;           :min-hours-wait 0)))

;;   ;; Hotkeys in the chat buffer

;;   (transient-replace-suffix 'eva-dispatch '(0)
;;     '["General actions"
;;       ("q" "Quit the chat" bury-buffer)
;;       ("l" "View Ledger report" eva-present-ledger-report)
;;       ("f" "View Ledger file" eva-present-ledger-file)
;;       ("a" "View Org agenda" org-agenda-list)])

;;   (define-key eva-chat-mode-map (kbd "l") #'eva-present-ledger-report)
;;   (define-key eva-chat-mode-map (kbd "f") #'eva-present-ledger-file)
;;   (define-key eva-chat-mode-map (kbd "a") #'org-agenda-list)

;;   ;; Activities (for `eva-query-activity').  These are cl objects for forward
;;   ;; compatibility; right now only :name is used, to fill out completion
;;   ;; candidates.
;;   (setq eva-activity-list
;;         (list (eva-activity-create :name "sleep")
;;               (eva-activity-create :name "studying")
;;               (eva-activity-create :name "coding")
;;               (eva-activity-create :name "unknown")))

;;   (eva-mode))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes '(tsdh-dark))
 '(org-agenda-files nil)
 '(package-selected-packages
   '(muse mediawiki wiki-nav vagrant-tramp phps-mode php-refactor-mode php-mode elpy buffer-move auctex datetime highlight git-gutter csv-mode rjsx-mode prettier-js csv magit web-mode clang-format smarty-mode eyebrowse auto-complete grip-mode flymd markdown-preview-mode markdown-mode imenu-list flycheck org)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-table ((t (:inherit fixed-pitch :foreground "white")))))
;; load emacs 24's package system. Add unstable MELPA repository.
;; (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
;; (when (>= emacs-major-version 24)
;;   (require 'package)
;;   (add-to-list
;;    'package-archives
;;    '("melpa" . "http://melpa.org/packages/")
;;    t))
					;(package-initialize)

;;initialize mapcar* function
(defun mapcar* (function &rest args)
  "Apply FUNCTION to successive cars of all ARGS.
Return the list of results."
  ;; If no list is exhausted,
  (if (not (memq nil args))
      ;; apply function to CARs.
      (cons (apply function (mapcar 'car args))
            (apply 'mapcar* function
                   ;; Recurse for rest of elements.
                   (mapcar 'cdr args)))))

;; Show parens
(show-paren-mode 1)
;; Ignore insecure downloads. What could go wrong
(setq package-check-signature nil)

;; Automatically install packages, for distributing this config
(setq package-list 
      `(eyebrowse auto-complete grip-mode flymd markdown-preview-mode markdown-mode imenu-list flycheck org))
(unless package-archive-contents
  (package-refresh-contents))

					; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; Eyebrowse Mode
					;Everything starts with C-c C-w
(eyebrowse-mode t)

;; Keybindings help
(defun binding-help()
  (interactive)
  (describe-mode `eyebrowse-mode)
  )

;; Color hex codes
(defun hex-color ()
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[[:xdigit:]]\\{3\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background
                      (let* (
                             (ms (match-string-no-properties 0))
                             (r (substring ms 1 2))
                             (g (substring ms 2 3))
                             (b (substring ms 3 4)))
                        (concat "#" r r g g b b))))))
     ("#[[:xdigit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-flush))

;; A function that adds a hook to the major programming languages only
(defun add-minor-mode-to-languages (m)
  (add-hook `c-mode-common-hook m)
  (add-hook `php-mode-hook m)
  (add-hook 'emacs-lisp-mode-hook m)
  (add-hook 'java-mode-hook m)
  (add-hook 'lisp-mode-hook m)
  (add-hook 'perl-mode-hook m)
  (add-hook 'sh-mode-hook m)
  (add-hook 'python-mode-hook m)
  (add-hook 'javascript-mode-hook m)
  (add-hook 'jsx-mode-hook m)   
  (add-hook 'js-jsx-mode-hook m)
  (add-hook 'mhtml-mode-hook m)
  (add-hook 'web-mode-hook m))

;; Occur
(global-set-key (kbd "C-M-s") `occur)

;; Imenu stuff
(global-set-key (kbd "C-c i") `imenu-list-smart-toggle)

;; Finds all <p> instances and formats their contents to fit in the desired length.
(defun format-paragraphs (col)
  (interactive (list (read-number "Input fill column (Default is 100): " 100)))
  (progn
    (set-fill-column col)
    (with-current-buffer (current-buffer)
      (let (last-p) (setq last-p (point))
	   (goto-char 0)
	   (while (re-search-forward "<p[^>]*?>" nil t)
	     (goto-char (match-beginning 0))
	     (fill-paragraph)
	     (goto-char (match-end 0)))
	   (goto-char last-p)))))

(global-set-key (kbd "C-c p") 'format-paragraphs)

;; Keybinding to evaluate current buffer
;;(global-set-key (kbd "C-c e") `eval-buffer)
(defun re-init ()
  (interactive)
  (load-file "~/.emacs")) 

;; SSH functions
(defun ssh (l)
  (interactive "MConnect to host: ")
  (dired (format "/ssh:%s:" l)))

;; Autocomplete
(add-minor-mode-to-languages `auto-complete-mode)

;;IDO!
;;(add-minor-mode-to-languages `ido-mode)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(global-set-key
 "\M-x"
 (lambda ()
   (interactive)
   (call-interactively
    (intern
     (ido-completing-read
      "M-x "
      (all-completions "" obarray 'commandp))))))


;;Add linum to code
(add-minor-mode-to-languages `(lambda () (linum-mode 1)))

;; Hideshow and yafolding stuff
(load-library "hideshow")
(defun toggle-selective-display (column)
  (interactive "P")
  (set-selective-display
   (or column
       (unless selective-display
	 (1+ (current-column))))))

(defun toggle-hiding (column)
  (interactive "P")
  (if hs-minor-mode
      (if (condition-case nil
	      (hs-toggle-hiding)
	    (error t))
	  (hs-show-all))
    (toggle-selective-display column)))

(global-set-key (kbd "C-c h") `hs-toggle-hiding)
(global-set-key (kbd "C-c -") 'hs-hide-all)
(global-set-key (kbd "C-c +") 'hs-show-all)
(global-set-key (kbd "C-c ,") 'hs-hide-level)

;; hs mhtml-forward functions
(defun mhtml-forward (arg)
  (interactive "P")
  (pcase (get-text-property (point) 'mhtml-submode)
    ('nil (sgml-skip-tag-forward 1))
    (submode (forward-sexp))))

(add-to-list 'hs-special-modes-alist
             '(mhtml-mode
               "{\\|<[^/>]+?"
               "}\\|</[^/>]*[^/]>"
               "<!--"
               mhtml-forward
               nil))
(add-to-list 'hs-special-modes-alist
             '(web-mode
               "{\\|<[^/>]+?"
               "}\\|</[^/>]*[^/]>"
               "<!--"
               mhtml-forward
               nil))
(add-minor-mode-to-languages 'hs-minor-mode)

;; Yafolding for ruby
(require 'yafolding)
(add-hook 'ruby-mode-hook 'yafolding-mode)
(define-key yafolding-mode-map (kbd "<C-S-return>") nil)
(define-key yafolding-mode-map (kbd "<C-M-return>") nil)
(define-key yafolding-mode-map (kbd "<C-return>") nil)
(global-set-key (kbd "C-c h")   'yafolding-toggle-element)
(global-set-key (kbd "C-c -")   'yafolding-hide-all)
(global-set-key (kbd "C-c +")   'yafolding-show-all)


;; Flyspell settings
(add-hook 'flyspell-mode-hook
	  (lambda ()
	    (progn
	      (local-set-key (kbd "M-s") (lambda () (interactive)
					   (flyspell-goto-next-error)
					   (ispell-word))))))	      

;; Code folding and spelling checks for latex
(add-hook 'TeX-mode-hook
          (lambda ()
	    (progn
					; Code Folding for latex, in the same style as hs-minor-mode
	      (tex-fold-mode 1)
	      (local-set-key (kbd "C-c h") #'TeX-fold-dwim)
	      (local-set-key (kbd "C-c -") #'TeX-fold-region)
	      (local-set-key (kbd "C-c +") #'TeX-fold-clearout-region)
					; Turn on flyspell and set a keybinding for searching with it
	      (flyspell-mode 1))))

(defun display-code-line-counts (ov)
  (when (eq 'code (overlay-get ov 'hs))
    (overlay-put ov 'help-echo
		 (buffer-substring (overlay-start ov)
				   (overlay-end ov)))))

(setq hs-set-up-overlay 'display-code-line-counts)

(defadvice goto-line (after expand-after-goto-line
			    activate compile)

  "hideshow-expand affected block when using goto-line in a collapsed buffer"
  (save-excursion
    (hs-show-block)))

;; Desktops
(require 'desktop)
(desktop-save-mode 1)
					;(desktop-save-in-desktop-dir)
(setq desktop-path (list "."))
(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

(setq desktop-restore-forces-onscreen nil)
(add-hook 'desktop-after-read-hook
	  (lambda ()
	    (frameset-restore
	     desktop-saved-frameset
	     :reuse-frames (eq desktop-restore-reuses-frames t)
	     :cleanup-frames (not (eq desktop-restore-reuses-frames 'keep))
	     :force-display desktop-restore-in-current-display
	     :force-onscreen desktop-restore-forces-onscreen)))

;;; desktop-override-stale-locks.el begins here
(defun emacs-process-p (pid)
  "If pid is the process ID of an emacs process, return t, else nil.
Also returns nil if pid is nil."
  (when pid
    (let* ((cmdline-file (concat "/proc/" (int-to-string pid) "/cmdline")))
      (when (file-exists-p cmdline-file)
        (with-temp-buffer
          (insert-file-contents-literally cmdline-file)
          (goto-char (point-min))
          (search-forward "emacs" nil t)
          pid)))))

(defadvice desktop-owner (after pry-from-cold-dead-hands activate)
  "Don't allow dead emacsen to own the desktop file."
  (when (not (emacs-process-p ad-return-value))
    (setq ad-return-value nil)))
;;; desktop-override-stale-locks.el ends here

;; Nice switch indentation

(c-set-offset 'case-label '+)

;; Nicer compilation output
(add-hook 'compilation-mode-hook
	  (lambda () (setq truncate-lines t)))

;; Use mhtl-mode for html files
;;(add-to-list 'auto-mode-alist '("\\.html\\'" . mhtml-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . js-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . js-jsx-mode))


(defvar my-menu-bar-menu (make-sparse-keymap "Mine"))
(define-key global-map [menu-bar my-menu] (cons "Mine" my-menu-bar-menu))

(require `notifications)

;;
;;
;;
;;
;; Syllabus organizing tools
;;
;;
;;
					;

;; Copies the line the user is currently on

(defun buffer-contains-substring (string)
  (save-excursion
    (save-match-data
      (goto-char (point-min))
      (search-forward string nil t))))

;; Gets the position of the nth occurence of a substring. 0 if 0 provided, string len if substring dne
(defun get-nth-match (string substring n start)
  (let ((pos 0)
	(match (string-match substring string (+ 1 start))))
    (if (null match)
	(length string)
      (if (= n 1)
	  match
	(if (= n 0)
	    0
	  (get-nth-match string substring (- n 1) match))))))

;; Highlight the current line with the given color. If progress is passed, show partial completion of ";" seperated tasks
(defun color-line (color &optional progress)
  (if progress
      (hlt-highlight-region
       (line-beginning-position) (line-end-position) `hlt-regexp-level-6)
    (setq progress 0))
  (if color
      (hlt-highlight-region
       (line-beginning-position)
       (if (> progress 0)
	   (+ (line-beginning-position)
	      (get-nth-match
	       (buffer-substring-no-properties (line-beginning-position) (line-end-position)) ";" progress 0))
	 (line-end-position))
       color))
  t)

(setq upcoming-work-faces
      (mapcar*
       (lambda (color days-away)
	 (custom-declare-face
	  (intern (concat "syllabus-face-" (number-to-string days-away)))
	  `((((background dark)) (:background ,color)) 
	    (t (:background "#FA6CC847FFFF")))
	  (concat "Due in " (number-to-string days-away) " days")
	  :group 'highlight :group 'faces))
       `("dark red" "#b36200" "dark orange" "yellow" "gold")
       `(0 1 2 3 4)))

(setq complete-work `hlt-regexp-level-1)
(setq important-work `hlt-regexp-level-6)
(setq incomplete-work `hlt-regexp-level-4)

					; If the date is in less that 5 days, return the automatic countdown highlight color for that date
(defun upcoming-work-face (cur-date n)
  (if (< n 5)
      (if (string< cur-date (date-in-n-days n))	    
	  `(,(nth (- n 1) upcoming-work-faces))
	(upcoming-work-face cur-date (+ n 1)))
    `(nil)
    ))

;; (defun marking-face (commands else-command)
;;   (if commands
;;       (if (string-match (concat "\\[" (caar commands) "\\]")
;; 			(buffer-substring-no-properties (line-beginning-position) (line-end-position)))
;; 	  (cadar commands)
;; 	(marking-face (cdr commands) else-command))
;;     else-command))

					; Given a list of form `((symbol, command), ...) and a command to run if there is no symbol present, return the command that is applied to that line
(defun marking-face (commands else-command)
  (if commands
      (if (string-match (concat "\\[" (caar commands) "\\]")
			(buffer-substring-no-properties
			 (line-beginning-position) (line-end-position)))
	  (cdar commands)
	(marking-face (cdr commands) else-command))
    else-command))

;; Returns the datestring for the date in n days
(defun date-in-n-days (n)
  (format-time-string
   "<%Y-%m-%d %a>"
   (apply `encode-time
	  (progn
	    (setq l (decode-time))
	    (setcar (nthcdr 3 l)
		    (+ (nth 3 l) n))
	    l))))

(defvar todays-notifications (list)
  "A list containing the notifications generated from the schedule")

;; Color the syllabus based on the symbols
(defun colorize-schedule ()
  (and
   (buffer-contains-substring "syllabus t")
   ;; remove pre-existing notifications
   (or (mapcar `(lambda (notif-id)
		  (notifications-close-notification notif-id))
	       todays-notifications)
       (setq todays-notifications (list))
       t)

   (save-excursion
     (save-match-data
       ;; Jump to beginning, unhighlight all
       (goto-char 0)
       (hlt-unhighlight-region (point-min) (point-max))
       ;; Go to the first entry in the schedule, start looping over each
       
       (re-search-forward "<.*>" nil t)
       ;; (goto-char (line-start-position))
       ;; (do-times (i 2)
       ;; 		 (forward-line -1)
       ;; 		 (color-line))
       ;; (let* ((anchor (point))
       ;; 	      (len (- (line-end-position) (line-start-position)))
       ;; 	      (start-point (- anchor (* 2 len))))
       ;; 	 (color-line))
       ;; (goto-char (line-end-position))
       
       (while
	   (let* (;; Positions of date elements
		  (date-start (- (point) 16))
		  (time-start (re-search-forward ":(" (line-end-position) t))
		  (time-end
		   (if time-start
		       (+ time-start 5)
		     nil))
					; Selected timestamp in format <YYYY-MM-DD>
		  (selected-date
		   (buffer-substring-no-properties date-start (+ date-start 16)))
					; Selected date in format HH:MM AKA military time
		  (selected-time
		   (if time-start
		       (buffer-substring-no-properties time-start time-end)
		     "08:00"))
					; Split up columns into list, strip links
		  (boxes
		   (split-string
		    (replace-regexp-in-string "\\[\\[\\(.*?\\)\\]\\[\\(.*?\\)\\]\\]"
					      "\\2"
					      (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
		    "|" t))
		  
		  (current-date
		   (format-time-string "<%Y-%m-%d %a>"))
		  
		  (hours-away 0)

		  ;; Maps symbol to highlight face
		  (marking-faces
		   (append
					; X => Done; ! => Very Important; - => NA
		    `(("X" hlt-regexp-level-1)
		      ("!" hlt-regexp-level-6)
		      ("-" hlt-regexp-level-4))
					; Highest Priority (A) to lowest (E)
		    (mapcar
		     `(lambda (n) `(,(nth n '("A" "B" "C" "D" "E"))
				    ,(nth n upcoming-work-faces)))
		     (number-sequence 0 4))
					; Progress completion
		    (mapcar
		     `(lambda (n) `(,(number-to-string n)
				    hlt-regexp-level-1
				    ,n))
		     (number-sequence 0 6)))))

					; For incomplete work due today, add a notif
	     (if (and (string= current-date selected-date) (not (string= (nth 0 boxes) " [X] " )))
		 (setq todays-notifications
		       (append
			(list (notifications-notify
			       :title (nth 2 boxes)
			       :app-name "Schedule"
			       :body (concat "<b>" (nth 0 boxes) "</b>" "<b>" selected-time "</b> - "
					     (if (string-match "[0-9]" (nth 0 boxes))
						 (nth (string-to-number (substring (nth 0 boxes) 2 3)) (split-string (nth 3 boxes) ";"))
					       (nth 3 boxes)))
			       :timeout 0
			       ))
			todays-notifications)))
	     
	     ;; Color the current line with the color as matched by symbol or by days away
	     (apply `color-line
		    (marking-face marking-faces
				  (upcoming-work-face selected-date 0)))
	     (goto-char (line-end-position))
	     (re-search-forward "<.*>" nil t)))
       ;; Go back and search for a timestamp
       (goto-char 0)
       (make-weekly-schedule)
					;(re-search-forward "<.*>:(.*?)")
       ))))


(defvar sched-date (format-time-string "%Y-%m-%d")
  "Which date the scheduler is currently looking at")
(defvar sched-period (format-time-string "all")
  "Which period the scheduler is currently looking at ('day', 'week', 'all')")
(defvar sched-subject nil
  "The current highlighted subject")
(defvar sched-dates '()
  "List of dates present in the schedule buffer")
(defvar sched-subjects '()
  "List of subjects present in the schedule buffer")

(defun any (pred list)
  "Checks if any item in the list matches the predicate"
  (while (and list (not (funcall pred (car list))))
    (pop list))
  (car list))

(defun sched-show-all ()
  "Show all items in schedule"
  (setq sched-period "all")
  (setq sched-subject nil)
  (setq sched-date (format-time-string "%Y-%m-%d"))
  (loccur nil)
  (colorize-schedule))

(defun sched-show-urgent ()
  (setq sched-period "urgent")
  (loccur nil)
  (loccur "\\[A\\]")
  (colorize-schedule))

(defun sched-show-day (day)
  "Show items for given day"
  (setq sched-period "day")
  (loccur nil)
  (loccur day)
  (colorize-schedule))

(defun sched-show-week (week-regexp)
  "Show items for given week"
  (setq sched-period "week")
  (loccur nil)
  (loccur week-regexp)
  (colorize-schedule))

(defun sched-show-subject (subject)
  "Show items for given subject"
  (setq sched-period "subject")
  (loccur nil)
  (loccur (concat "\|\s*" subject "\s*\|"))
  (colorize-schedule))

(defun get-matches-in-buffer (regex)
  "Returns a list of all matches in a buffer with duplicates removed"
  (let ((dates '())
	(buffer-text (buffer-substring-no-properties (point-min) (point-max))))
    (with-temp-buffer
      (insert buffer-text)
      (goto-char 0)
      (while (re-search-forward regex (point-max) t)
	(push (match-string 1) dates)))
    (reverse (delete-dups dates))))
(defun sched-get-dates ()
  " Returns the list of all dates present in the schedule buffer with duplicates removed"
  (get-matches-in-buffer "<\\([0-9|\-]*\\).*>"))
(defun sched-get-subjects ()
  " Returns the list of all subject areas present in the schedule buffer with duplicates removed"
  (cl-sort
   (cdr (get-matches-in-buffer "^|.*?|.*?|\s*\\(.*?\\)\s*|"))
   'string-lessp
   :key 'downcase))

(defun sched-date-increment (datestring n)
  "Increments the datestring by n days"
  (org-read-date nil nil (concat (if (> n 0) "++" "--") (number-to-string (abs n))) nil (org-read-date nil t datestring)))
(defun sched-date-increment-day (inc)
  "Shifts to the next or previous day, provide -1 or 1 for past or future."
  (let ((new-date-index (+ inc (cl-position sched-date sched-dates :test 'string=))))
    ;; Set sched-date to next date in list if index in bounds
    (if (and (>= new-date-index 0) (< new-date-index (length sched-dates)))
	(progn (setq sched-date (nth new-date-index sched-dates))
	       (sched-show-day sched-date)))))

(defun get-week-regex (date)
  "Returns a regex matching pattern for the week the date resides in"
  (mapconcat
   (lambda (x)
     (org-read-date nil nil
		    (concat "++"
			    (number-to-string x)) nil
		    ;;(org-read-date nil t "-sun")
		    (org-read-date nil t "--sat" nil (org-time-string-to-time date))))
   (number-sequence 1 7) "\\|"))
(defun sched-date-increment-week (inc)
  "Shifts to the next or previous week, provide -1 or 1 for past or future."
  (let* ((lower-bound (sched-date-increment (car sched-dates) -7))
	 (upper-bound (sched-date-increment (car (last sched-dates)) 7))
	 (next-week (sched-date-increment sched-date (* 7 inc)))
	 (next-week-dates (get-week-regex next-week))
	 (new-sched-date nil))
    (while
	(and (string< next-week upper-bound) (string> next-week lower-bound)
	     (not (any `(lambda (date) (string-match next-week-dates date)) sched-dates)))
      (setq next-week (sched-date-increment next-week (* 7 inc)))
      (setq next-week-dates (get-week-regex next-week)))
    (setq new-sched-date (any `(lambda (date) (string-match next-week-dates date)) sched-dates))
    (if new-sched-date
	(progn (setq sched-date new-sched-date)
	       (sched-show-week next-week-dates)))))

(defun sched-increment-subject (inc)
  " Navigates subject views "
  (message "trying to increment")
  (let ((new-subject-index (if sched-subject
			       (+ inc (cl-position sched-subject sched-subjects :test 'string=))
			     0)))
    (message "%s" new-subject-index)
    (message sched-subject)
    (if (and (>= new-subject-index 0) (< new-subject-index (length sched-subjects)))
	(progn (setq sched-subject (nth new-subject-index sched-subjects))
	       (sched-show-subject sched-subject)))))

(add-to-list 'display-buffer-alist '("*Async Shell Command*" display-buffer-no-window (nil)))

(defun make-yearly-schedule ()
  (interactive)
  (let* ((start-date (format-time-string "%Y-01-01"))
	 (iter-dates (mapcar (lambda (x) (org-read-date nil nil (format "++%sw" x) nil (org-time-string-to-time start-date)) )
			     (number-sequence 0 48)
			     )))
    (dolist (d iter-dates)
      (and d (make-weekly-schedule d)))
    (make-weekly-schedule)
    (call-process-shell-command "make -B build-year" nil 0)
    ))
;; Generates an input latex file containing the events in a given week
(defun make-weekly-schedule (&optional the-day)
  (interactive)
  (let* ((current-date (or the-day (format-time-string "%Y-%m-%d")))
	 (weekly-regexp (get-week-regex current-date))
	 (events '())
	 (weekly-sched-out '("\\begin{weeklySchedule}"))	 
	 (weekdays (mapcar
		    (lambda (x)
		      (org-read-date nil nil
				     (concat "++"
					     (number-to-string x)) nil
				     ;;(org-read-date nil t "-sun")
				     (org-read-date nil t "--sat" nil (org-time-string-to-time current-date))))
		    (number-sequence 1 7)))
	 (sched-name (format "%s-to-%s" (car weekdays) (car (last weekdays))))
	 )
    (message "processing: %s -> %s" current-date sched-name)
    
    ;; (dolist (l weekly-sched-out)
    ;;   (message "%s" l))
    (add-to-list 'weekly-sched-out (format "{\\weekdays%s}" (mapconcat (lambda (x) (format "{%s}" x)) weekdays "")) t)
    (dolist (row
	     (cdddr (let ((all-tables nil))
		      (org-table-map-tables
		       (lambda () (setq all-tables (cons all-tables (org-table-to-lisp (buffer-substring-no-properties (org-table-begin) (org-table-end)))))))
		      all-tables)))
      (if (string-match weekly-regexp (nth 1 row))
	  (let* ((priority (substring (nth 0 row) 1 2))
		 (loc-date (substring (nth 1 row) 1 11))
		 (loc-day-of-week (-elem-index loc-date weekdays))
		 (time-parts (split-string (substring (nth 1 row) 18 29) ":\\|-"))
		 (start-time (max 8 (+ (string-to-number (nth 0 time-parts)) (/ (string-to-number (nth 1 time-parts)) 60.0))))
		 (end-time (+ (string-to-number (nth 2 time-parts)) (/ (string-to-number (nth 3 time-parts)) 60.0)))
		 (subj (nth 2 row))
		 (details (replace-regexp-in-string "^\\*\\([^\*]+\\)\\*" "\\\\textbf{\\1}" (nth 3 row) t))
		 (details (replace-regexp-in-string ";" "\\\\\\\\" details t))
		 )
	    (if (string= priority "-") (setq priority "N"))
	    (if (string= priority "1") (setq priority "X1"))
	    (if (string= priority "2") (setq priority "X2"))
	    (if (string= priority "3") (setq priority "X3"))
	    (if (string= priority "4") (setq priority "X4"))
	    (if (string= priority "5") (setq priority "X5"))
	    (if (string= priority "6") (setq priority "X6"))
	    (if (string= priority "7") (setq priority "X7"))
	    (add-to-list 'weekly-sched-out (format "  \\event{%s}{%s}{%s}{%s}{%s}{%s}{%s};" priority loc-day-of-week start-time end-time subj (substring (nth 1 row) 18 29) details) t)
	    )
      )
      )
    (add-to-list 'weekly-sched-out "\\end{weeklySchedule}" t)
    (write-region (mapconcat (lambda (x) (format "%s\n" x)) weekly-sched-out "")
		  nil "./weekly_schedule_input.tex")
					;(async-shell-command "pdflatex weekly_schedule.tex")
    (message "%s.pdf" sched-name)
    (if (not the-day)
	(call-process-shell-command (format "make -B build-schedule-complete SCHEDNAME=%s" sched-name) nil 0)
      (call-process-shell-command (format "make -B build-schedule-for-week SCHEDNAME=%s" sched-name))
      )
    (dolist (l weekly-sched-out)
      (message "%s" l)
      ;(write-region l nil "./test-input.tex")
      )
    
    ;; (dolist (event events)
    ;;   (message "row is %s" event))
    ;; (dolist (w weekdays)
    ;;   (message "d is (%s)" w))
    ))

(define-minor-mode schedule-minor-mode
  " An org extension for organizing schedules"
  :lighter " sched"
  :keymap (let ((map (make-sparse-keymap)))
	    ;; Sort by current column
	    (define-key map (kbd "C-c s") `(lambda ()
					     (interactive)
					     (org-table-sort-lines nil ?a)
					     (colorize-schedule)))
	    ;; Sort by current column in reverse order
	    (define-key map (kbd "C-c r") `(lambda ()
					     (interactive)
					     (org-table-sort-lines nil ?A)
					     (colorize-schedule)))
	    ;; Add entry to schedule
	    (define-key map (kbd "C-c e")
	      `(lambda ()
		 (interactive)
		 (let* ((p (read-string "Priority " nil nil " "))
			(d (org-read-date))
			(tm (read-string "Time " nil nil " "))
			(c (read-string "Category " nil nil " "))
			(w (read-string "Work " nil nil " ")))
		   (save-excursion
		     (goto-char (point-max))
		     (insert (format "| [%s] |" p))
		     (org-insert-time-stamp (org-read-date nil t) nil)
		     (insert (format ":(%s) | %s | %s |" tm c w))
		     (goto-char (line-beginning-position))
		     (execute-kbd-macro [?\t])
		     (goto-char (+ (line-beginning-position) 15))
		     (org-table-sort-lines nil ?a)
		     (colorize-schedule)))))

	    ;; Show all
	    (define-key map (kbd "C-c a")
	      `(lambda ()
		 (interactive)
		 (if (string= "all" sched-period)
		     nil
		   (sched-show-all))))
	    ;; Show urgent
	    (define-key map (kbd "C-c u")
	      `(lambda ()
		 (interactive)
		 (sched-show-urgent)))
	    ;; Show today
	    (define-key map  (kbd "C-c t")
	      `(lambda ()
		 (interactive)
		 (if (string= "day" sched-period)
		     (sched-show-all)
		   (sched-show-day sched-date))))
	    ;; Show Week
	    (define-key map  (kbd "C-c w")
	      `(lambda ()
		 (interactive)
		 (if (string= "week" sched-period)
		     (sched-show-all)
		   (progn
		     (setq sched-period "week")
		     (loccur (get-week-regex sched-date))
		     (colorize-schedule)))))
	    ;; Show next day/week
	    (define-key map (kbd "C-c >")
	      `(lambda ()
		 (interactive)
		 (cond ((string= "day" sched-period) (sched-date-increment-day 1))
		       ((string= "week" sched-period) (sched-date-increment-week 1))
		       ((or (string= "all" sched-period) (string= "subject" sched-period))
			(sched-increment-subject 1)))))
	    ;; Show previous day/week
	    (define-key map (kbd "C-c <")
	      `(lambda ()
		 (interactive)
		 (cond ((string= "day" sched-period) (sched-date-increment-day -1))
		       ((string= "week" sched-period) (sched-date-increment-week -1))
		       ((or (string= "all" sched-period) (string= "subject" sched-period)) (sched-increment-subject -1)))))
	    ;; toggle completion, anything else to X, X to nothing
	    (define-key map (kbd "C-c SPC")
	      `(lambda ()
		 (interactive)
		 (let ((line (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
		   (replace-region-contents
		    (line-beginning-position) (line-end-position)
		    `(lambda () (if (string-match "\\[X\\]" line)
			(replace-regexp-in-string "\\[X\\]" "[ ]" line)
			(replace-regexp-in-string "\\[.\\]" "[X]" line)))
		    )
		   (colorize-schedule)

		   )))
	    map)
  (make-local-variable 'sched-date)
  (make-local-variable 'sched-period)
  (make-local-variable 'sched-dates)
  (make-local-variable 'sched-subject)
  (setq sched-dates (sched-get-dates))
  (setq sched-subjects (sched-get-subjects))
  (colorize-schedule)
  (add-hook 'after-save-hook `(lambda ()
				(interactive)
				(colorize-schedule)
				(setq sched-dates (sched-get-dates))
				(setq sched-subjects (sched-get-subjects)))
	    nil 'make-it-local)
  (setq loccur-highlight-matching-regexp nil)
  t)


(require 'org)

;; Allow opening pdf to page
(setq org-file-apps
      '((auto-mode . emacs)
	("\\.pdf::\\([0-9]+\\)?\\'" . "evince %s -i %1")
	("\\.pdf\\'" . "evince %s")
	(directory . emacs)))

(add-hook 'org-mode-hook
	  (lambda ()
	    (progn
	      (message "here")
	      (if (buffer-contains-substring "syllabus t")
		  (schedule-minor-mode)
		t)
	      ;; ;; Adds report class with chapters as first heading for latex to org export
	      ;; (add-to-list 'org-latex-classes
	      ;; 		   '("book-noparts"
	      ;; 		     "\\documentclass{report}"
	      ;; 		     ("\\chapter{%s}" . "\\chapter*{%s}")
	      ;; 		     ("\\section{%s}" . "\\section*{%s}")
	      ;; 		     ("\\subsection{%s}" . "\\subsection*{%s}")
	      ;; 		     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	      ;; 		     ("\\paragraph{%s}" . "\\paragraph*{%s}")
	      ;; 		     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

	      ;; ;; Adds report class with chapters as first heading for latex to org export
	      ;; (add-to-list 'org-latex-classes
	      ;; 		   '("class-report"
	      ;; 		     "\\documentclass{article}"
	      ;; 		     ("\\\\\\section{%s}" . "\\\\\\section*{%s}")
	      ;; 		     ("\\subsection{%s}" . "\\subsection*{%s}")
	      ;; 		     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
	      ;; 		     ("\\paragraph{%s}" . "\\paragraph*{%s}")
	      ;; 		     ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


	      (setq org-latex-pdf-process
		    (list "latexmk -pdflatex='lualatex -shell-escape -interaction nonstopmode' -pdf -f  %f"))
	      t)))


;; Modifies org-to-latex headline function
					;:; Maps first tag to label, adds see also reference for the rest. Adds indices for each tag
(defun org-latex-headline (headline contents info)
  "Transcode a HEADLINE element from Org to LaTeX.
CONTENTS holds the contents of the headline.  INFO is a plist
holding contextual information."
  (unless (org-element-property :footnote-section-p headline)
    (let* ((class (plist-get info :latex-class))
	   (level (org-export-get-relative-level headline info))
	   (numberedp (org-export-numbered-headline-p headline info))
	   (class-sectioning (assoc class (plist-get info :latex-classes)))
	   ;; Section formatting will set two placeholders: one for
	   ;; the title and the other for the contents.
	   (section-fmt
	    (let ((sec (if (functionp (nth 2 class-sectioning))
			   (funcall (nth 2 class-sectioning) level numberedp)
			 (nth (1+ level) class-sectioning))))
	      (cond
	       ;; No section available for that LEVEL.
	       ((not sec) nil)
	       ;; Section format directly returned by a function.  Add
	       ;; placeholder for contents.
	       ((stringp sec) (concat sec "\n%s"))
	       ;; (numbered-section . unnumbered-section)
	       ((not (consp (cdr sec)))
		(concat (funcall (if numberedp #'car #'cdr) sec) "\n%s"))
	       ;; (numbered-open numbered-close)
	       ((= (length sec) 2)
		(when numberedp (concat (car sec) "\n%s" (nth 1 sec))))
	       ;; (num-in num-out no-num-in no-num-out)
	       ((= (length sec) 4)
		(if numberedp (concat (car sec) "\n%s" (nth 1 sec))
		  (concat (nth 2 sec) "\n%s" (nth 3 sec)))))))
	   ;; Create a temporary export back-end that hard-codes
	   ;; "\underline" within "\section" and alike.
	   (section-back-end
	    (org-export-create-backend
	     :parent 'latex
	     :transcoders
	     '((underline . (lambda (o c i) (format "\\underline{%s}" c))))))
	   (text
	    (org-export-data-with-backend
	     (org-element-property :title headline) section-back-end info))
	   (todo
	    (and (plist-get info :with-todo-keywords)
		 (let ((todo (org-element-property :todo-keyword headline)))
		   (and todo (org-export-data todo info)))))
	   (todo-type (and todo (org-element-property :todo-type headline)))
	   (master-tags (mapcar (lambda (s) (replace-regexp-in-string "_" "-" s))
				(org-export-get-tags headline info)))
	   ;; (master-tags (org-export-get-tags headline info))
	   (tags (and (plist-get info :with-tags)
		      master-tags))
	   (indices 
	    (mapconcat
	     (lambda (tag)
	       (format "\\index{%s}" tag))
	     master-tags "\n"))
	   (see-also
	    (if (not (null master-tags))
		(format "\n\\textbf{See Also:} %s \n" 
			(mapconcat
			 (lambda (tag)
			   (format "\\nameref{%s}" tag))
			 (cdr master-tags) ", "))))
	   (priority (and (plist-get info :with-priority)
			  (org-element-property :priority headline)))
	   ;; Create the headline text along with a no-tag version.
	   ;; The latter is required to remove tags from toc.
	   (full-text (funcall (plist-get info :latex-format-headline-function)
			       todo todo-type priority text tags info))
	   ;; Associate \label to the headline for internal links.
	   ;; (headline-label (org-latex--label headline info t t))
	   (headline-label (if (not (null master-tags))
			       (format "\\label{%s}\n"
				       (car master-tags))
			     (org-latex--label headline info t t)))
	   (pre-blanks
	    (make-string (org-element-property :pre-blank headline) ?\n)))
      (if (or (not section-fmt) (org-export-low-level-p headline info))
	  ;; This is a deep sub-tree: export it as a list item.  Also
	  ;; export as items headlines for which no section format has
	  ;; been found.
	  (let ((low-level-body
		 (concat
		  ;; If headline is the first sibling, start a list.
		  (when (org-export-first-sibling-p headline info)
		    (format "\\begin{%s}\n" (if numberedp 'enumerate 'itemize)))
		  ;; Itemize headline
		  "\\item"
		  (and full-text (org-string-match-p "\\`[ \t]*\\[" full-text)
		       "\\relax")
		  " " full-text "\n"
		  headline-label
		  pre-blanks
		  contents)))
	    ;; If headline is not the last sibling simply return
	    ;; LOW-LEVEL-BODY.  Otherwise, also close the list, before
	    ;; any blank line.
	    (if (not (org-export-last-sibling-p headline info)) low-level-body
	      (replace-regexp-in-string
	       "[ \t\n]*\\'"
	       (format "\n\\\\end{%s}" (if numberedp 'enumerate 'itemize))
	       low-level-body)))
	;; This is a standard headline.  Export it as a section.  Add
	;; an alternative heading when possible, and when this is not
	;; identical to the usual heading.
	(let ((opt-title
	       (funcall (plist-get info :latex-format-headline-function)
			todo todo-type priority
			(org-export-data-with-backend
			 (org-export-get-alt-title headline info)
			 section-back-end info)
			(and (eq (plist-get info :with-tags) t) tags)
			info))
	      ;; Maybe end local TOC (see `org-latex-keyword').
	      (contents
	       (concat
		contents
		(let ((case-fold-search t)
		      (section
		       (let ((first (car (org-element-contents headline))))
			 (and (eq (org-element-type first) 'section) first))))
		  (org-element-map section 'keyword
		    (lambda (k)
		      (and (equal (org-element-property :key k) "TOC")
			   (let ((v (org-element-property :value k)))
			     (and (org-string-match-p "\\<headlines\\>" v)
				  (org-string-match-p "\\<local\\>" v)
				  (format "\\stopcontents[level-%d]" level)))))
		    info t)))))
	  (if (and opt-title
		   (not (equal opt-title full-text))
		   (string-match "\\`\\\\\\(.*?[^*]\\){" section-fmt))
	      (format (replace-match "\\1[%s]" nil nil section-fmt 1)
		      ;; Replace square brackets with parenthesis
		      ;; since square brackets are not supported in
		      ;; optional arguments.
		      (replace-regexp-in-string
		       "\\[" "(" (replace-regexp-in-string "\\]" ")" opt-title))
		      full-text
		      (concat headline-label pre-blanks indices contents see-also))
	    ;; Impossible to add an alternative heading.  Fallback to
	    ;; regular sectioning format string.
	    (format section-fmt full-text
		    (concat headline-label pre-blanks indices contents see-also))))))))


(add-to-list 'org-file-apps '("pdf" . "open %s"))

;; (setq org-latex-format-headline-function #'org-latex-format-headline-default-function)
;; (setq org-latex-format-headline-function #'org-latex-format-headline-default-function)

;; Navigation functions

;; (setq org-latex-remove-logfiles 1)
;; (setq org-latex-logfiles-extensions (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl")))

;; https://www.emacswiki.org/emacs/BrowseUrl#h5o-31
(defun browse-url-firefox-privately (url &optional new-window)
  "Make firefox open URL in private-browsing window."
  (interactive (browse-url-interactive-arg "URL: "))
  (let* ((process-environment (browse-url-process-environment)))
    (apply #'start-process
           (concat "firefox-dev " url) nil
           "firefox-dev"
           (list "-private-window" url))))

(setq browse-url-browser-function
      '((".*&private=1" . browse-url-firefox-privately)
        ("." . browse-url-default-browser)))
;; OSINT functions

(setq org-OSINT-url-blacklist
      '("catholicnewsagency.com"
	"cbn.com"
	"christianpost.com"
	"dailycaller.com"
	"dailymail.co.uk"
	"dailywire.com"
	"epochtimes.com"
	"lifesitenews.com"
	"nationalenquirer.com"
	"newsmax.com"
	"oann.com"
	"quillette.com"
	"theepochtimes.com"
	"thepostmillennial.com"
	"thesun.co.uk"))

(defun org-OSINT-get-url-blacklist ()
  (string-join
   (mapcar '(lambda (url)
	      (concat "-inurl:" url))
	   org-OSINT-url-blacklist)
   "+"))

(defun org-OSINT-get-query-header (query year &optional month engine)
  "Given a query, year, and optionally month, return an org header with a link to the appropriate google query displaying the year or month name. Pass with escaped quotes.
   Option string engine can be 'news' (default) or 'books' and returns the respective results"
  ;; get the start and end date, handle month not set, month = 12
  (let ((start-date (format "%d/1/%d"
			    (if month month 1)
			    year))
	(end-date   (format "%d/1/%d"
			    (if (or (not month) (= month 12)) 1 (+ 1 month))
			    (if (or (not month) (= month 12)) (+ year 1) year)))
	(query (replace-regexp-in-string "\"" "%22" (replace-regexp-in-string " " "+" query))))
    (format "%s** TODO [[%s][%s]]\n"
	    (if month "*" "")
	    
	    (concat
	     "https://www.google.com/search"
	     "?q=" query
	     ;;"+" (org-OSINT-get-url-blacklist)
	     "&source=lnms&tbm=" (if engine enginge "nws")
	     "&tbs=" (url-hexify-string (concat "cdr:1,cd_min:" start-date ",cd_max:" end-date))
	     "&private=1"
	     )
	    (if month (calendar-month-name month) year))))
(defun org-OSINT-template-by-year (query start-year end-year &optional use-months engine)
  "Given a query, start, end year return an org section with subsections linking to the year query.\
   Optional bool months adds subsections for each month in year.\
   Option string engine can be 'nws' (default) or 'bks' and returns the respective "
  (let ((years (number-sequence start-year end-year))
	(months (number-sequence 1 12)))
    (insert (format "* Google %s sources for \"%s\"\n" query engine))
    ;; loop through years in range
    (mapcar '(lambda (year)
	       ;; loop through months per year if option specified
	       (insert (org-OSINT-get-query-header query year))
	       (if use-months 
		   (mapcar '(lambda (month)
			      (insert (org-OSINT-get-query-header query year month)))
			   months)))
	    years)))

(defun de-googlify (url)
  "Removes the google header for the url"
  (replace-regexp-in-string
   "&sa=.*" ""
   (replace-regexp-in-string
    "https://www\\.google\\.com/url\\?q=" ""
    url)))
(defvar news-links '())
(defvar org-OSINT-scraper-running nil)
;;(defvar org-OSINT-page-scraper-running nil)
;; (defun org-OSINT-scrape-page-news-links (page-scraper-running)
;;   "Returns the urls from a google news url page"
;;   (message "Starting the scrape")
;;   (let ((links '())
;; 	(last-link nil)
;; 	(next-link "page-start"))
;;     (message "next is %s" next-link)
;;     (while next-link
;;       (message "next is %s" next-link)
;;       (cond
;;        ;; New page of results, skip google links
;;        ((string= next-link "page-start")
;; 	(goto-char 0)
;; 	(dotimes (... 8) (shr-next-link))
;; 	(setq next-link (de-googlify (shr-next-link))))
;;        ((string-match-p "https://www.google.com/search\\?q=" next-link)
;; 	;;(eww-browse-url next-link)
;; 	(message "to the next page or not to the next page")
;; 	(if (search-forward ">" nil t)
;; 	    (progn
;; 	      (message "to the next")
;; 	      (backward-char)
;; 	      (remove-hook 'eww-after-render-hook #'org-OSINT-scrape-page-news-links)
;; 	      (sleep-for 5)
;; 	      (org-OSINT-scrape-page-news-links-handler (car (eww-links-at-point))))
;; 	  (setq last-link t))
;; 	(setq next-link nil))

;;        ((string-match-p "https://support.google.com" next-link)
;; 	(message "google support reached")
;; 	(setq next-link nil)
;; 	(setq last-link t))
;;        (t
;; 	(message "next-link")
;; 	(push next-link links)
;; 	(setq next-link (de-googlify (shr-next-link))))))
;;     (message "links are %s" links)
;;     (remove-hook 'eww-after-render-hook #'org-OSINT-scrape-page-news-links)
;;     (setq news-links (append (reverse links) news-links))
;;     (if last-link
;; 	(setcar (nthcdr 0 page-scraper-running) nil))
;; 	;;(setq org-OSINT-scraper-running nil))
;;     ;;(setq org-OSINT-page-scraper-running nil)
;;   ))
;; (defun org-OSINT-scrape-page-news-links-handler (url scraper-running)
;;   " A handler for the async aspect of the function"
;;   (interactive)
;;   (message "scraping %s" url)
;;   (setq org-OSINT-page-scraper-running '(t))
;;   ;;(add-hook 'eww-after-render-hook #'org-OSINT-scrape-page-news-links)
;;   (add-hook 'eww-after-render-hook
;; 	    (lambda ()
;; 	      (org-OSINT-scrape-page-news-links org-OSINT-page-scraper-running)))
;;   (eww url)
;;   (while (car org-OSINT-page-scraper-running) (message "waiting page") (sleep-for 1))
;;   (message "handler-links: %s" news-links)
;;   news-links)
;; (defun org-OSINT-search-url (url)
;;   " Returns the links for a given google news search url, handling page traversal"
;;   (interactive)
;;   (message "news-links are %s"  news-links)
;;   (setq news-links '())
;;   (setq scraper-running '(t))
;;   (org-OSINT-scrape-page-news-links-handler url scraper-running)

;;   ;(setq org-OSINT-scraper-running t)
;;   (while (car scraper-running) (message "waiting") (sleep-for 1))
;;   news-links)

(defun org-OSINT-scrape-page-news-links (page-scraper-running scraper-running)
  "Returns the urls from a google news url page"
  (message "Starting the scrape")
  (let ((links '())
	(last-link nil)
	(next-link "page-start"))
    (message "next is %s" next-link)
    (while next-link
      (message "next is %s" next-link)
      (cond
       ;; New page of results, skip google links
       ((string= next-link "page-start")
	(goto-char 0)
	(dotimes (... 8) (shr-next-link))
	(setq next-link (de-googlify (shr-next-link))))
       ((string-match-p "https://www.google.com/search\\?q=" next-link)
	;;(eww-browse-url next-link)
	(message "to the next page or not to the next page")
	(if (search-forward ">" nil t)
	    (progn
	      (message "to the next")
	      (backward-char)
	      ;;(remove-hook 'eww-after-render-hook #'org-OSINT-scrape-page-news-links)
	      (setq eww-after-render-hook nil)
	      (sleep-for 5)
	      (org-OSINT-scrape-page-news-links-handler
	       (car (eww-links-at-point))
	       scraper-running))
	  (setq last-link t))
	(setq next-link nil))
       
       ((string-match-p "https://support.google.com" next-link)
	(message "google support reached")
	(setq next-link nil)
	(setq last-link t))
       (t
	(message "next-link")
	(push next-link links)
	(setq next-link (de-googlify (shr-next-link))))))
    (message "links are %s" links)
    ;;(remove-hook 'eww-after-render-hook #'org-OSINT-scrape-page-news-links)
    (setq eww-after-render-hook nil)
    (setq news-links (append (reverse links) news-links))
    (setcar (nthcdr 0 page-scraper-running) nil)
    (if last-link
	(setcar (nthcdr 0 scraper-running) nil))
    ;;(setq org-OSINT-scraper-running nil))
    ;;(setq org-OSINT-page-scraper-running nil)
    ))
(defun org-OSINT-scrape-page-news-links-handler (url scraper-running)
  " A handler for the async aspect of the function"
  (interactive)
  (message "scraping %s" url)
  ;;(setq org-OSINT-page-scraper-running '(t))
  (setq page-scraper-running '(t))
  ;;(add-hook 'eww-after-render-hook #'org-OSINT-scrape-page-news-links)
  (add-hook 'eww-after-render-hook
	    (lambda ()
	      (org-OSINT-scrape-page-news-links page-scraper-running scraper-running)))
  (eww url)
  (while (car page-scraper-running) (message "waiting page") (sleep-for 1))
  (message "handler-links: %s" news-links)
  news-links)
(defun org-OSINT-search-url (url)
  " Returns the links for a given google news search url, handling page traversal"
  (interactive)
  (message "news-links are %s"  news-links)
  (setq news-links '())
  (setq scraper-running '(t))
  (org-OSINT-scrape-page-news-links-handler url scraper-running)
					;(setq org-OSINT-scraper-running t)
  (while (car scraper-running) (message "waiting") (sleep-for 1))
  news-links)

;; Org copy link at point
;; https://emacs.stackexchange.com/questions/63037/fast-way-to-copy-a-link-at-point-in-org-mode
(defun ndk/link-fast-copy ()
  (interactive)
  (let* ((context (org-element-context))
         (type (org-element-type context))
         (beg (org-element-property :begin context))
         (end (org-element-property :end context)))
    (when (eq type 'link)
      (copy-region-as-kill beg end))))

(define-key org-mode-map (kbd "C-c z") #'ndk/link-fast-copy)

(defvar api-key 123)

(defun org-OSINT-google-news-request (string offset)
  "Make API request, return json results"
  ;; (let* ((json-object-type 'hash-table)
  ;; 	 (json-array-type 'list)
  ;; 	 (json-key-type 'string)
  ;; 	 (json (json-read-file "brooklyn_eviction_defense_sources.json"))
  ;; 	 (news_results (gethash "news_results" json))
  ;; 	 (pagination (gethash "serpapi_pagination" json)))
  ;;   (dolist (news_res news_results)
  ;;     (message "%s -- %s" (org-OSINT-google-news-format-time (gethash "date" news_res)) (gethash "link" news_res))))
  (json-read-file "brooklyn_eviction_defense_sources.json")
  )

(defun org-OSINT-search (text)
  "Make api request"
  (let* ((offset 0)
	 (data '())
	 (url (format "https://serpapi.com/search.json?device=desktop&engine=google&gl=us&google_domain=google.com&hl=en&num=100&q=\"Brooklyn+Eviction+Defense\"&start=%s&tbm=nws&api_key=%s" offset api-key))
	 (json-response 1))
    (while json-response
      (setq json-response (org-OSINT-google-news-request text 0))
      (dolist (news-res (gethash "news_results" json-response))
	(push '((org-OSINT-google-news-format-time (gethash "date" news_res))
		(gethash "link" news_res))
	      data))
      (setq json-response 0))
    data))

(defun org-OSINT-google-news-request (string offset)
  "Make API request, return json results"
  )

(defun org-OSINT-google-news-format-time (human-time)
  "Given a time, put it in the correct format. Ex: turns '1 week ago' into date last week."
  (format-time-string "%m/%d/%Y"
		      (encode-time 
		       (parse-time-string
			(with-temp-buffer
			  (call-process "env" nil t nil "LC_ALL=C" "LANGUAGE=" "date" "-d" human-time)
			  (or (bobp) (delete-backward-char 1))
			  (buffer-string))))))

;; (let* ((json-object-type 'hash-table)
;;        (json-array-type 'list)
;;        (json-key-type 'string)
;;        (json (json-read-file "brooklyn_eviction_defense_sources.json"))
;;        (news_results (gethash "news_results" json))
;;        (pagination (gethash "serpapi_pagination" json)))
;;   (dolist (news_res news_results)
;;     (message "%s -- %s" (org-OSINT-google-news-format-time (gethash "date" news_res)) (gethash "link" news_res))))
