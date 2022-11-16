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

;; zenburn-theme
(require 'init-theme)

;; whitespace
(require 'init-whitespace)

;; hungry-delete
(require 'init-hungrydelete)

;; smooth-scrolling
(require 'init-smoothscrolling)

;; ace-window
(require 'init-acewindow)

;; multiple-cursors
(require 'init-multiplecursors)

;; which-key-mode
(require 'init-whichkey)

;; smartparens
(require 'init-smartparens)

;; undo-tree
(require 'init-undotree)

;; smart-mode-line
(require 'init-smartmodeline)

;; neotree
(require 'init-neotree)

;; imenu & imenu-list
(require 'init-imenu-list)

;; yaml-mode
(require 'init-yaml)

;; prettify-symbols
(setq prettify-symbols-unprettify-at-point 'right-edge)

;; reftex, cdlatex, latex
(require 'init-latex)

;; markdown-mode
(require 'init-markdown)

;; flycheck
(require 'init-flycheck)

;; company-mode
(require 'init-company)

;; snippets & YASnippet
(require 'init-yasnippet)
(require 'init-aas)

;; origami
(require 'init-origami)

;; org-mode
(require 'init-org)

(put 'set-goal-column 'disabled nil)
