;; windows
(add-to-list 'default-frame-alist '(width . 86))
(scroll-bar-mode -1)
(tool-bar-mode -1)
(require 'init-paren)

;; restore the default sizes
(fringe-mode nil)
;;(set-fringe-mode '(0 . 4))
(global-display-line-numbers-mode)
(global-auto-revert-mode t)
(setq inhibit-startup-screen t)
;; mode line
(use-package time
  :init
  (display-time-mode 1)
  :custom
  (display-time-24hr-format t)
  (display-time-default-load-average nil) ;;
  )
(display-battery-mode 1)
(line-number-mode 0)
(column-number-mode t) ;;

;; font
(set-face-attribute 'default nil :font "Monaco-13")

;; text
(setq-default require-final-newline nil)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines nil)
(setq-default word-wrap nil)
(global-hl-line-mode t)
(setq-default c-default-style "awk")
(setq-default fill-column 80)
;; replace highlighted text with what you type
(delete-selection-mode 1)
;; default encoding
(set-language-environment 'utf-8)
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))
;; Keys
(require 'init-keys)
(provide 'init-basic)
