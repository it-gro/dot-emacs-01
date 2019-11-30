3;;; package --- Summary
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;$Copyright: Bruno Grossniklaus $
;;$License:   GPL $
;;$Version:   26.1 $
;;$Code:      emacs elisp $
;;$Writer:    Bruno Grossniklaus $
;;$Remark:    emacs for GNU-Emacs version >= 26.1 $
;;$Creation:  1992-08-27 $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;$Id:        $
;;$Date:      2018-02-06 $
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Commentary:
;; my "mini" Emacs config
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; Warning! The SHELL environment variable uses c:\windows\system32\cmd.exe.
; You probably want to change it so that it uses cmdproxy.exe instead.
;
; Warning! shell-file-name uses c:\windows\system32\cmd.exe.
; You probably want to change it so that it uses cmdproxy.exe instead.
;
; Warning! shell-command-switch is "-c".
; You should set this to "/c" when using a system shell.
;
; Warning! w32-quote-process-args is t.
; You should set this to nil when using a system shell.



;;; code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* Bootstrap
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/")
  )

(unless package--initialized (package-initialize))
;; M-x package-refresh-contents
;; M-x package-list-packages
;; M-x list-packages

;; https://github.com/jwiegley/use-package
;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
  )

(require 'use-package)
(setq
  use-package-always-ensure t    ;; may be disabled after first (long taking) start
  use-package-verbose t
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* boot
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq inhibit-startup-message t)
;;(view-echo-area-messages)
;;(tool-bar-mode -1)
;;(load-theme 'manoj-dark)
;;(load-theme 'tango)
;;(load-theme 'whiteboard)
;;(load-theme 'leuven)
;;(load-theme 'ubuntu t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages install
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; add use-package functionality
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://github.com/myrjola/diminish.el
(use-package diminish
  ;; :ensure t
  )

;; https://github.com/joewreschnig/auto-minor-mode
(use-package auto-minor-mode
  ;; :ensure t
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package try)

(use-package which-key
    :config
  (which-key-mode)
  )

(use-package editorconfig
  :config
  (editorconfig-mode 1)
  )

(use-package hungry-delete
  :init
  (global-hungry-delete-mode)
  )

(use-package expand-region
  :init
  (global-set-key (kbd "C-=") 'er/expand-region)
  )

(use-package smex
  :bind
  :init
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
  )

(use-package git-command )
(use-package pcmpl-git   )
(use-package vagrant       :ensure t)

(if (not (memq window-system '(win32 w32)))
		(progn
			(use-package lxd-tramp	 :ensure t)
			(use-package vagrant-tramp :ensure t)
			)
	)


(use-package plantuml-mode :ensure t)

(use-package treemacs
	:defer t
	)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* visual upgrade packages
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package theme-looper
  :init
  (global-set-key (kbd "C-t") 'theme-looper-enable-next-theme)
  )

(use-package beacon
  :config
  (beacon-mode 1)
  )

;; https://github.com/doublep/logview
(use-package logview
  :config
  ;; (add-to-list 'auto-mode-alist '("syslog\\(?:\\.[0-9]+\\)" . logview-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.log\\(?:\\.[0-9]+\\)?\\'" . logview-mode))
)

(use-package select-themes )
(use-package atom-one-dark-theme   :defer t)
(use-package darkburn-theme        :defer t)
(use-package darkokai-theme        :defer t)
(use-package grandshell-theme      :defer t)
(use-package gruber-darker-theme   :defer t)
(use-package jbeans-theme          :defer t)
(use-package madhat2r-theme        :defer t)
(use-package mandm-theme           :defer t)
(use-package monokai-theme         :defer t)
(use-package night-owl-theme       :defer t)
(use-package ubuntu-theme          :defer t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* ascii art
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package boxquote)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* prog modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package flycheck
  :config
  (global-flycheck-mode t)
  )

(use-package basic-mode)
(use-package powershell)
(use-package sqlup-mode)

(use-package elpy
	:ensure t
	:defer t
	:init
	(advice-add 'python-mode :before 'elpy-enable)
	)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* fileformat modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package markdown-mode   )
(use-package json-mode       )
(use-package yaml-mode       )
(use-package toml-mode       )
(use-package dockerfile-mode )

(use-package csv-mode
  :config
  ;; Define separators
  (setq csv-separators '("," ";" ":" " "))
  )
(use-package csv-nav :disabled)

(use-package htmlize )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* my modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun load-if-exists (f)
  "Load the elisp file F only if it exists and is readable."
  (if (file-readable-p f)
    (load-file f)
    )
  )

;; ~~~snip~~~


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* localization
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package datetime-format)

(setq system-time-locale "de_CH.utf8")
(prefer-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* generic-x
;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'generic-x)
(setq auto-mode-alist (cons '("\\.cmd$\\|\\.CMD$" . bat-generic-mode) auto-mode-alist))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;** CUA (Windows GUI style shortcuts)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cua-base)
(cua-mode 't)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; C-x C-j
(require 'dired-x)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* show line and col pos in modeline
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(display-time)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* revert
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-auto-revert-mode t)
(setq auto-revert-verbose nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* clipboard
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq save-interprogram-paste-before-kill 1)

;;https://www.emacswiki.org/emacs/CopyAndPaste
;(setq x-select-enable-primary   t )
;(setq x-select-enable-clipboard t )
;(global-set-key (kbd "<mouse-2>") 'x-clipboard-yank)
;;(global-set-key (kbd "<mouse-2>") 'clipboard-yank)
;(delete-selection-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* hippie expand
;;  Try to expand text before point, using multiple methods.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq hippie-expand-try-functions-list
  '(
     try-expand-dabbrev
     try-complete-file-name-partially
     try-complete-file-name
     try-expand-all-abbrevs
     try-expand-list
     try-expand-line
     try-expand-dabbrev-all-buffers
     try-expand-dabbrev-from-kill
     )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* backups
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq make-backup-files t)
(setq version-control t)    ; 'never
(setq kept-old-versions 1)
(setq kept-new-versions 10)
(setq delete-old-versions t)
(setq vc-make-backup-files t)

(setq auto-save-list-file-prefix "~/.emacs.d/auto-save-list/.saves-")

(setq backup-directory-alist nil)
(add-to-list 'backup-directory-alist '("."             . "~/.emacs.d/backups/"))
(add-to-list 'backup-directory-alist '(".\\.C$"        . "~/.emacs.d/backups/C"))
(add-to-list 'backup-directory-alist '(".\\.H$"        . "~/.emacs.d/backups/H"))
(add-to-list 'backup-directory-alist '(".\\.awk$"      . "~/.emacs.d/backups/awk"))
(add-to-list 'backup-directory-alist '(".\\.bas$"      . "~/.emacs.d/backups/bas"))
(add-to-list 'backup-directory-alist '(".\\.bat$"      . "~/.emacs.d/backups/bat"))
(add-to-list 'backup-directory-alist '(".\\.bmk$"      . "~/.emacs.d/backups/bmk"))
(add-to-list 'backup-directory-alist '(".\\.c$"        . "~/.emacs.d/backups/c"))
(add-to-list 'backup-directory-alist '(".\\.cc$"       . "~/.emacs.d/backups/cc"))
(add-to-list 'backup-directory-alist '(".\\.cfg$"      . "~/.emacs.d/backups/cfg"))
(add-to-list 'backup-directory-alist '(".\\.cmd$"      . "~/.emacs.d/backups/cmd"))
(add-to-list 'backup-directory-alist '(".\\.conf$"     . "~/.emacs.d/backups/conf"))
(add-to-list 'backup-directory-alist '(".\\.css$"      . "~/.emacs.d/backups/css"))
(add-to-list 'backup-directory-alist '(".\\.ctl$"      . "~/.emacs.d/backups/ctl"))
(add-to-list 'backup-directory-alist '(".\\.cvs.*$"    . "~/.emacs.d/backups/cvs"))
(add-to-list 'backup-directory-alist '(".\\.el$"       . "~/.emacs.d/backups/el"))
(add-to-list 'backup-directory-alist '(".\\.h$"        . "~/.emacs.d/backups/h"))
(add-to-list 'backup-directory-alist '(".\\.html$"     . "~/.emacs.d/backups/html"))
(add-to-list 'backup-directory-alist '(".\\.ini$"      . "~/.emacs.d/backups/ini"))
(add-to-list 'backup-directory-alist '(".\\.java$"     . "~/.emacs.d/backups/java"))
(add-to-list 'backup-directory-alist '(".\\.js$"       . "~/.emacs.d/backups/js"))
(add-to-list 'backup-directory-alist '(".\\.ksh$"      . "~/.emacs.d/backups/ksh"))
(add-to-list 'backup-directory-alist '(".\\.md$"       . "~/.emacs.d/backups/md"))
(add-to-list 'backup-directory-alist '(".\\.perl$"     . "~/.emacs.d/backups/perl"))
(add-to-list 'backup-directory-alist '(".\\.php$"      . "~/.emacs.d/backups/php"))
(add-to-list 'backup-directory-alist '(".\\.pl$"       . "~/.emacs.d/backups/pl"))
(add-to-list 'backup-directory-alist '(".\\.pls$"      . "~/.emacs.d/backups/pls"))
(add-to-list 'backup-directory-alist '(".\\.py$"       . "~/.emacs.d/backups/py"))
(add-to-list 'backup-directory-alist '(".\\.reg$"      . "~/.emacs.d/backups/reg"))
(add-to-list 'backup-directory-alist '(".\\.sh$"       . "~/.emacs.d/backups/sh"))
(add-to-list 'backup-directory-alist '(".\\.spark$"    . "~/.emacs.d/backups/spark"))
(add-to-list 'backup-directory-alist '(".\\.sql$"      . "~/.emacs.d/backups/sql"))
(add-to-list 'backup-directory-alist '(".\\.tex$"      . "~/.emacs.d/backups/tex"))
(add-to-list 'backup-directory-alist '(".\\.texi$"     . "~/.emacs.d/backups/texi"))
(add-to-list 'backup-directory-alist '(".\\.txt$"      . "~/.emacs.d/backups/txt"))
(add-to-list 'backup-directory-alist '(".\\.vb$"       . "~/.emacs.d/backups/vb"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* recentf (build in (27.0))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package recentf
  :init
  (recentf-mode 1)

  :config
  ;; Increase limit
  (setq recentf-max-menu-items 100)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* win32 configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (memq window-system '(win32 w32))
  (progn
    (setq grep-command "findstr /n ")
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* new keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<f2>")    'toggle-truncate-lines)
(global-set-key (kbd "<f3>")    'list-matching-lines)
(global-set-key (kbd "<f5>")    'revert-buffer)
(global-set-key (kbd "<f9>")    'eval-region)
(global-set-key (kbd "<f12>")   'hippie-expand)
(global-set-key (kbd "<S-f12>") 'complete-symbol)
(global-set-key (kbd "<C-f12>") 'cua-set-rectangle-mark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* fix bug emacs 24.3 / ubunut 14.04
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://www.emacswiki.org/emacs/DeadKeys
(if (>= emacs-major-version 24)
    (require 'iso-transl)
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* my functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;** align
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun align-to-colon (begin end)
  "Align region to colon (:) signs"
  (interactive "r")
  (align-regexp
    begin end
    (rx (group (zero-or-more (syntax whitespace))) ":") 1 1 )
  )

(defun align-to-comma (begin end)
  "Align region to comma  signs"
  (interactive "r")
  (align-regexp
    begin end
    (rx "," (group (zero-or-more (syntax whitespace))) ) 1 1 )
  )

(defun align-to-equals (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)=" 1 1 )
  )

(defun align-to-hash (begin end)
  "Align region to hash ( => ) signs"
  (interactive "r")
  (align-regexp
    begin end
    (rx (group (zero-or-more (syntax whitespace))) "=>") 1 1 )
  )

(defun align-to-comma-before (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp
    begin end
    (rx (group (zero-or-more (syntax whitespace))) ",") 1 1 )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;** kill
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
    (delq (current-buffer) (buffer-list))
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;** scroll
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun gro-scroll-down1 ()
  "Scroll one line down and recenter."
  (interactive)
  (scroll-down 1)
  (move-to-window-line nil)
  )

(defun gro-scroll-up1 ()
  "Scroll one line up and recenter."
  (interactive)
  (scroll-up 1)
  (move-to-window-line nil)
  )

(defun gro-scroll-down2 ()
  "Scroll one line down."
  (interactive)
  (scroll-down 1)
  )

(defun gro-scroll-up2 ()
  "Scroll one line up."
  (interactive)
  (scroll-up 1)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;** cmd
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (memq window-system '(w32))
  (progn
    (defun gro-cmd-help
      (name)
      "Get cmd (NT) help"
      (interactive "sHelp on cmd: \n")
      (switch-to-buffer "*cmd help*")
      (erase-buffer)
      (insert (format "%s" (shell-command-to-string (format "help %s" name))))
      (beginning-of-buffer)
      )
    )
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;** perl
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun gro-perldoc-help
  (name)
  "Get perldoc help on 'NAME' (global)."
  (interactive "sHelp on global: \n")
  (switch-to-buffer "*perl doc*")
  (erase-buffer)
  (insert (format "%s" (shell-command-to-string (format "perldoc -t %s" name))))
  (beginning-of-buffer)
  )

(defun gro-perldoc-func-help
  (name)
  "Get perldoc help on 'NAME' (function)."
  (interactive "sHelp on function: \n")
  (switch-to-buffer "*perl function*")
  (erase-buffer)
  (insert (format "%s" (shell-command-to-string (format "perldoc -t -f %s" name))))
  (beginning-of-buffer)
  )

(defun gro-perldoc-package-help
  (name)
  "Get perldoc help on 'NAME' () package."
  (interactive "sHelp on package: \n")
  (switch-to-buffer "*perl package doc*")
  (erase-buffer)
  (insert (format "%s" (shell-command-to-string (format "perldoc -t %s" name))))
  (beginning-of-buffer)
  )

(defun gro-perldoc-faq-help
  (name)
  "Get perldoc help on 'NAME' (faq)."
  (interactive "sFAQ on: \n")
  (switch-to-buffer "*perl faq*")
  (erase-buffer)
  (insert (format "%s" (shell-command-to-string (format "perldoc -t -q %s" name))))
  (beginning-of-buffer)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;** misc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun gro-insert-date ()
  "Insert date at point."
  (interactive)
  ;;(insert (format-time-string "%Y-%m-%d"))
  ;;(insert (format-time-string "%Y-%m-%dT%T%z"))
  ;;(insert (format-time-string "%FT%T%Z"))
  (insert (format-time-string "%Y-%m-%d %H:%M"))
  )

;; datetime-format
;; (package-install 'datetime-format)
(defun gro-insert-date-atom ()
  "Insert date at point."
  (interactive)
  (insert (datetime-format 'atom))
  )

(defun gro-ascii-table ()
  "Print the ascii table.  Based on a defun by Alex Schroeder <asc@bsiag.com>."
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert "ASCII\n")
  (insert "-----\n")
  (let ((i 31))       ;or 0 (non printable)
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%3d %2xh '%c'   " i i i) ;%X from  20.3
        )
      (if (= 0 (% (- i 31) 4) )
        (insert "\n") )
      )
    )
  (beginning-of-buffer)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;** cleanup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun gro-http2md ()
  "Convert http url to markdown syntax"
  (interactive)
  (save-restriction
    (narrow-to-region (region-beginning) (region-end) )
    (goto-char 1)

    (replace-regexp "\\(https?://\\([^/\s\n]+\\)\\)\\(?:/?\\([\s\"\]\\|$\\)\\)" "[\\2](\\1)\\3" )
    ;;                 1           2                        3
    (goto-char 1)
	  (replace-regexp "\\(https?://\\([^/\s\n]+\\)\\(\.*\\)/\\(\[^\s\n\"\]+\\)\\)" "[\\4](\\1) \*(\\2)\*" )
    ;;                 1           2              3         4
    (goto-char 1)
	  (replace-regexp "/](http" "](http"  )
    )
  )

(defun gro-http2md2 ()
  "Convert http url to markdown syntax"
  (interactive)
  (save-restriction
    (narrow-to-region (region-beginning) (region-end) )
    (goto-char 1)

    (replace-regexp "\\(https?://\\([^/\s\n]+\\)\\)\\(?:/?\\([\s\"\]\\|$\\)\\)" "[\\2](\\1)\\3" )
    ;;                 1           2                        3
    (goto-char 1)
	  (replace-regexp "\\(https?://\\([^/\s\n]+\\)\\(\.*\\)/\\(\[^\s\n\"\]+\\)\\)" "[\\4](\\1)" )
    ;;                 1           2              3         4
    (goto-char 1)
	  (replace-regexp "/](http" "](http"  )
    )
  )


(defun gro-md2http ()
  "Convert markdown syntax to http url"
  (interactive)
  (save-restriction
    (narrow-to-region (region-beginning) (region-end) )
    (goto-char 1)
    (replace-regexp "\\[\[^]\\]+\\](\\(https?://[^)]+\\))\\( (.+?)\\)?" "\\1" )
    ;;                                1                    2
    )
  )

(defun gro-unhex ()
  "Decode percent encoded URI of URI under cursor or selection.

Example:
    http://en.wikipedia.org/wiki/Saint_Jerome_in_His_Study_%28D%C3%BCrer%29
becomes
    http://en.wikipedia.org/wiki/Saint_Jerome_in_His_Study_(Dürer)

Example:
    http://zh.wikipedia.org/wiki/%E6%96%87%E6%9C%AC%E7%BC%96%E8%BE%91%E5%99%A8
becomes
    http://zh.wikipedia.org/wiki/文本编辑器

For string version, see `xah-html-url-percent-decode-string'.
To encode, see `xah-html-encode-percent-encoded-url'.
URL `http://ergoemacs.org/emacs/elisp_decode_uri_percent_encoding.html'
Version 2015-09-14."
  (interactive)
  (let ($boundaries $p1 $p2 $input-str)
    (if (use-region-p)
      (progn
        (setq $p1 (region-beginning))
        (setq $p2 (region-end)))
      (progn
        (setq $boundaries (bounds-of-thing-at-point 'url))
        (setq $p1 (car $boundaries))
        (setq $p2 (cdr $boundaries))))
    (setq $input-str (buffer-substring-no-properties $p1 $p2))
    (require 'url-util)
    (delete-region $p1 $p2)
    (insert (decode-coding-string (url-unhex-string $input-str) 'utf-8)
      )
    )
  )


(defun gro-clean ()
  "Untabify, delete-trailing-whitespace."
  (interactive)
  (untabify (point-min) (point-max) )
  ;;(gro-dos2unix)
  (delete-trailing-whitespace)
  )

(defun right-justify-current-line ()
  "Right-justify this line."
  (interactive)
  (justify-current-line 'right))

(defun right-fill-paragraph ()
  "Fill paragraph with right justification."
  (interactive)
  (fill-paragraph 'right))


(defun right-region (from to)
  "Right-justify each nonblank line starting in the region."
  (interactive "r")
  (if (> from to)
      (let ((tem to))
    (setq to from from tem)))
  (save-excursion
    (save-restriction
      (narrow-to-region from to)
      (goto-char from)
      (while (not (eobp))
    (or (save-excursion (skip-chars-forward " \t") (eolp))
        ;; (center-line))              ; this was the original code
        (justify-current-line 'right)) ; this is the new code
    (forward-line 1)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* Keys for own functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<M-down>")    'gro-scroll-down1)
(global-set-key (kbd "<M-up>")      'gro-scroll-up1)
(global-set-key (kbd "<M-S-down>")  'gro-scroll-down2)
(global-set-key (kbd "<M-S-up>")    'gro-scroll-up2)
(global-set-key (kbd "C-;")         'gro-insert-date)
(global-set-key (kbd "C-:")         'gro-insert-date-atom)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* server
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(server-start)
;;(load "server") (unless (server-running-p) (server-start))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;* custom
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 2)
 '(column-number-mode t)
 '(css-indent-level 2)
 '(custom-safe-themes
	 (quote
		("1b6f7535c9526a5dbf9fb7e3604d0280feb7a07b970caf21ebd276ddc93ef07a" "28bf1b0a72e3a1e08242d776c5befc44ba67a36ced0e55df27cfc7ae6be6c24d" "3860a842e0bf585df9e5785e06d600a86e8b605e5cc0b74320dfe667bcbe816c" default)))
 '(dired-copy-preserve-time t)
 '(dired-dwim-target t)
 '(electric-indent-mode nil)
 '(flymake-gui-warnings-enabled nil)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(js-indent-level 2)
 '(package-selected-packages
	 (quote
		(plantuml flycheck-plantuml eyuml ubuntu-theme vagrant datetime-format dockerfile-mode toml-mode yaml-mode json-mode markdown-mode sqlup-mode powershell basic-mode boxquote monokai-theme madhat2r-theme jbeans-theme gruber-darker-theme grandshell-theme darkokai-theme darkburn-theme atom-one-dark-theme select-themes logview beacon theme-looper pcmpl-git lxd-tramp smex expand-region hungry-delete try auto-minor-mode diminish)))
 '(plantuml-default-exec-mode (quote jar))
 '(plantuml-jar-path "/home/grossnik/apps/plantuml/plantuml.jar")
 '(powershell-indent 2)
 '(python-indent-offset 2)
 '(python-shell-interpreter "python3")
 '(ring-bell-function (quote ignore))
 '(show-paren-mode 1)
 '(sql-product (quote mysql))
 '(tab-width 2)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 3.0)))))
;;; init.el ends here
