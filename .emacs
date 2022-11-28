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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("02f57ef0a20b7f61adce51445b68b2a7e832648ce2e7efb19d217b6454c1b644" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" default))
 '(package-selected-packages
   '(blacken lsp-pyright moom olivetti docker-tramp smart-tabs-mode ein typescript-mode editorconfig better-jumper web-mode auctex org-modern multi-vterm company flycheck dashboard lsp-treemacs lsp-ivy treemacs-magit treemacs-icons-dired magit treemacs lsp-ui lsp-mode doom-themes window-numbering which-key vterm use-package swiper rainbow-delimiters paredit paradox org-superstar ns-auto-titlebar geiser-chicken elpy doom-modeline atom-one-dark-theme all-the-icons))
 '(paradox-github-token t)
 '(warning-suppress-types
   '(((python python-shell-completion-native-turn-on-maybe))
     ((python python-shell-completion-native-turn-on-maybe)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:family "Fira Sans" :height 135))))
 '(mode-line-active ((t (:family "Fira Sans" :height 135))))
 '(mode-line-inactive ((t (:family "Fira Sans" :height 135))))
 '(whitespace-tab ((t (:foreground "#636363")))))
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
(put 'upcase-region 'disabled nil)
