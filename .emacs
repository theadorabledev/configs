;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(package-selected-packages
   (quote
    (git-gutter csv-mode rjsx-mode prettier-js csv magit web-mode clang-format smarty-mode eyebrowse auto-complete grip-mode flymd markdown-preview-mode markdown-mode imenu-list flycheck org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; load emacs 24's package system. Add unstable MELPA repository.
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t))
(package-initialize)
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
  (add-hook 'mhtml-mode-hook m)
  (add-hook 'jsx-mode-hook m)   
  )

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

(defun ssh-stuy ()
  (interactive)
  (dired "/ssh:iwilliams10@homer.stuy.edu:"))

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

;; Hideshow stuff
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
               "{\\|<[^/>]*?"
               "}\\|</[^/>]*[^/]>"
               "<!--"
               mhtml-forward
               nil))
(add-minor-mode-to-languages 'hs-minor-mode)

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


;; Test easy generation of keybindings
;
;;(load-library "eyebrowse")
;; (dotimes (i 10)
;;   (global-set-key
;;    (kbd (concat "C-c C-e " (number-to-string i)))
;;    `(lambda ()
;;       (interactive)
;;       (eyebrowse-switch-to-window-config ,i))))

(defvar my-menu-bar-menu (make-sparse-keymap "Mine"))
(define-key global-map [menu-bar my-menu] (cons "Mine" my-menu-bar-menu))




