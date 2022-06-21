(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))

;;;; Basic .emacs with a good set of defaults, to be used as template for usage
;;;; with OCaml and OPAM
;;;;
;;;; Author: Louis Gesbert <louis.gesbert@ocamlpro.com>
;;;; Released under CC0
;;
;;;; Generic, recommended configuration options
;;
;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(ac-use-fuzzy nil)
;; '(backup-directory-alist '(("." . "~/.local/share/emacs/backups")))
;; '(compilation-context-lines 2)
;; '(compilation-error-screen-columns nil)
;; '(compilation-scroll-output t)
;; '(compilation-search-path '(nil "src"))
;; '(electric-indent-mode nil)
;; '(indent-tabs-mode nil)
;; '(line-move-visual t)
;; '(next-error-highlight t)
;; '(next-error-highlight-no-select t)
;; '(next-line-add-newlines nil)
;; '(package-selected-packages '(atom-one-dark-theme))
;; '(require-final-newline t)
;; '(sentence-end-double-space nil)
;; '(show-paren-mode t)
;; '(show-trailing-whitespace t)
;; '(visible-bell t))
;;
;;;; ANSI color in compilation buffer
;;(require 'ansi-color)
;;(defun colorize-compilation-buffer ()
;;  (toggle-read-only)
;;  (ansi-color-apply-on-region (point-min) (point-max))
;;  (toggle-read-only))
;;(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
;;
;;;; Some key bindings
;;
;;(global-set-key [f3] 'next-match)
;;(defun prev-match () (interactive nil) (next-match -1))
;;(global-set-key [(shift f3)] 'prev-match)
;;(global-set-key [backtab] 'auto-complete)
;;;; OCaml configuration
;;;;  - better error and backtrace matching
;;
;;(defun set-ocaml-error-regexp ()
;;  (set
;;   'compilation-error-regexp-alist
;;   (list '("[Ff]ile \\(\"\\(.*?\\)\", line \\(-?[0-9]+\\)\\(, characters \\(-?[0-9]+\\)-\\([0-9]+\\)\\)?\\)\\(:\n\\(\\(Warning .*?\\)\\|\\(Error\\)\\):\\)?"
;;    2 3 (5 . 6) (9 . 11) 1 (8 compilation-message-face)))))
;;
;;(add-hook 'tuareg-mode-hook 'set-ocaml-error-regexp)
;;(add-hook 'caml-mode-hook 'set-ocaml-error-regexp)
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line

;; ## end of OPAM user-setup addition for emacs / base ## keep this line
