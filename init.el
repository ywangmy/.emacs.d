;; Minimize garbage collection during startup
(setq gc-cons-threshold most-positive-fixnum)

;; Lower threshold back to 8 MiB (default is 800kB)
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (expt 2 25))))

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;;(add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;; init files
(add-to-list 'load-path "~/.emacs.d/lisp/")
;; Load custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Ref:https://www.gnu.org/software/emacs/manual/html_node/ccmode/Config-Basics.html
;; Top-level settings
(require 'init-basic)

;; theme
(require 'init-theme)

;; whitespace
(require 'init-whitespace)

;; hungry-delete
(require 'init-hungry-delete)

;; smooth-scrolling
(require 'init-smooth-scrolling)

;; ace-window
(require 'init-ace-window)

;; multiple-cursors
(require 'init-multiple-cursors)

;; undo-tree
(require 'init-undo-tree)

;; emacs-helm
(require 'init-helm)

;; company-mode
(require 'init-company)

;; prettify-symbols
(setq prettify-symbols-unprettify-at-point 'right-edge)

;; snippets & YASnippet
(require 'init-yasnippet)
(require 'init-yasupp)
(require 'init-aas)

;; which-key-mode
(require 'init-which-key)

;; smart-mode-line
(require 'init-smart-mode-line)

;; neotree
(require 'init-neotree)

;; imenu & imenu-list
(require 'init-imenu-list)

;; origami
(require 'init-origami)

;; yaml-mode
(require 'init-yaml)

;; reftex, cdlatex, latex
(require 'init-latex)

;; markdown-mode
(require 'init-markdown)

;; org-mode
(require 'init-org)

;; flycheck
(require 'init-flycheck)

;; ispell (hunspell)
(require 'init-ispell)

(put 'set-goal-column 'disabled nil)
