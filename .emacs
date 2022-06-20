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
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

;; My settings
(setq mac-command-modifier 'meta)

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'atom-one-dark t)
(set-frame-font "JuliaMono 15" nil t)
; Apply the font to emacsclients
(add-to-list 'default-frame-alist '(font . "JuliaMono 15"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rainbow-delimiters org-superstar paredit vterm paradox use-package atom-one-dark-theme))
 '(paradox-automatically-star t))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun my-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          )))

(add-hook 'scheme-mode-hook 'my-pretty-lambda)
(global-prettify-symbols-mode 1)

; Set default scheme to chicken
(setq scheme-program-name "csi")

(require 'ox)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
(setq org-latex-create-formula-image-program 'dvisvgm)
(setq org-preview-latex-default-process 'dvisvgm)

(require 'org-superstar)
;;; Titles and Sections
;; hide #+TITLE:
(setq org-hidden-keywords '(title))
;; set basic title font
(set-face-attribute 'org-level-8 nil :weight 'bold :inherit 'default)
;; Low levels are unimportant => no scaling
(set-face-attribute 'org-level-7 nil :inherit 'org-level-8)
(set-face-attribute 'org-level-6 nil :inherit 'org-level-8)
(set-face-attribute 'org-level-5 nil :inherit 'org-level-8)
(set-face-attribute 'org-level-4 nil :inherit 'org-level-8)
;; Top ones get scaled the same as in LaTeX (\large, \Large, \LARGE)
(set-face-attribute 'org-level-3 nil :inherit 'org-level-8 :height 1.2) ;\large
(set-face-attribute 'org-level-2 nil :inherit 'org-level-8 :height 1.44) ;\Large
(set-face-attribute 'org-level-1 nil :inherit 'org-level-8 :height 1.728) ;\LARGE
;; Only use the first 4 styles and do not cycle.
(setq org-cycle-level-faces nil)
(setq org-n-level-faces 4)
;; Document Title, (\huge)
(set-face-attribute 'org-document-title nil
                    :height 2.074
                    :foreground 'unspecified
                    :inherit 'org-level-8)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(eval-after-load "paredit"
  #'(define-key paredit-mode-map (kbd "C-j") 'eval-last-sexp))

(setq visible-bell nil
      ring-bell-function 'flash-mode-line)
(defun flash-mode-line ()
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil #'invert-face 'mode-line))

