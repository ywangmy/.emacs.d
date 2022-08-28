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

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; frame bar
(setq frame-title-format "emacs %f")
;; Load custom.el
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Ref:https://www.gnu.org/software/emacs/manual/html_node/ccmode/Config-Basics.html
;; Top-level settings
;; windows
(scroll-bar-mode -1)
(tool-bar-mode nil)
(show-paren-mode t)
(set-fringe-mode '(0 . 0))
(global-display-line-numbers-mode)
(global-auto-revert-mode t)
(setq inhibit-startup-screen t)
;; mode line
(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
(setq display-battery-mode t)
(setq line-number-mode nil)
(setq column-number-mode t)
;; text
(setq-default require-final-newline nil)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines nil)
(setq-default word-wrap nil)
(global-hl-line-mode t)
(setq-default c-default-style "awk")
(setq-default fill-column 80)
;; default encoding
(set-language-environment 'utf-8)
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8-unix)
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; zenburn-theme
(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t)
  (set-face-attribute 'hl-line nil :background "#595959")
  (set-face-attribute 'region nil :background "#7e7e7e")
  )

;; whitespace
(use-package whitespace
  :init
  (global-whitespace-mode t)
  :custom
  ;;(whitespace-space-regexp "\\(^ +\\)")
  ;;(whitespace-tab-regexp "\\(^\t+\\)")
  (whitespace-style '(face tabs trailing))
  )

(use-package hungry-delete
  :ensure t
  :init
  (global-hungry-delete-mode)
  :custom
  (hungry-delete-join-reluctantly t)
  )

;; smooth-scrolling
(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode 1)
  )

;; ace-window
(use-package ace-window
  :ensure t
  :bind (("M-o" . ace-window)
         )
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-dispatch-always t)
  (setq aw-scope 'frame)
  )

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
  )

;; which-key-mode
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  )

;; smartparens
(use-package smartparens-config
  :ensure smartparens
  :hook ((c++-mode . smartparens-mode)
         )
  :custom
  (sp-autoskip-closing-pair nil)
  (sp-autoskip-opening-pair nil)
  (sp-autoinsert-pair nil)
  (sp-autodelete-pair nil)
  (sp-autodelete-closing-pair nil)
  (sp-autodelete-opening-pair nil)
  (sp-autodelete-wrap nil)
  :bind (:map smartparens-mode-map
              ;; commonly used outside to skip paren-exp
              ("M-F" . sp-forward-sexp)
              ("M-B" . sp-backward-sexp)
              ;; b&e of a paren-exp, paren not included
              ("M-A" . sp-beginning-of-sexp)
              ("M-E" . sp-end-of-sexp)
              ("M-N" . sp-next-sexp)
              ("M-P" . sp-previous-sexp)
              ;; upper&lower level paren-exp, nav through diff levels
              ("C-<up>" . sp-up-sexp)
              ("C-<down>" . sp-down-sexp)
              )
  )

;; undo-tree
(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  )

(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup)
  (setq sml/theme 'respectful)
  (setq sml/show-eol t)
  )


;; neotree
(use-package neotree
  :ensure t
  :bind
  ("<f8>" . 'neotree-toggle)
  :init
  (setq neo-theme 'ascii)
  :custom
   (neo-toggle-window-keep-p t)
  )

(use-package imenu
  :custom
  (imenu-auto-rescan t)
  )

;; imenu-list
(use-package imenu-list
  :ensure t
  :bind
  ("<f9>" . 'imenu-list-smart-toggle)
  :custom
  (imenu-list-position 'left)
  (imenu-list-size '0.25)
  )

;; yaml-mode
(use-package yaml-mode
  :ensure t
  :mode ("\\.yaml\\'" "\\.yml\\'")
  )

;;(require 'tex-mode)
;;(defun np--pretty-symbols-alist ()
;;  (setq prettify-symbols-alist tex--prettify-symbols-alist)
;;  (setq prettify-symbols-alist
;;        (mapcan (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
;;                '(("TEST" . "†")
;;                  )
;;        )
;;  )

(setq prettify-symbols-unprettify-at-point 'right-edge)

;; reftex, cdlatex, latex
(require 'init-latex)

;; markdown-mode
(use-package markdown-mode
  :ensure t
  :hook
  (markdown-mode . imenu-add-menubar-index)
  :custom
  (markdown-add-footnotes-to-imenu t)
  (markdown-coding-system 'utf-8)
  (markdown-enable-math t)
  (markdown-header-scaling t)
  (markdown-indent-on-enter nil)
  (markdown-table-align-p nil)
  (markdown-command
   "pandoc"
   ;; "pandoc --data-dir=~/.pandoc/"
   ;;"pandoc.exe --data-dir=E:\\Blog\\html_blog\\pandoc_data_dir --defaults=blog_post.yaml"
   )
  :config
  (setq indent-line-function 'insert-tab)
  )

;; flycheck
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  (setq flycheck-python-pylint-executable "pylint")
  :custom
  (flycheck-gcc-language-standard "c++17")
  )

;; company-mode
(use-package company
  :ensure t
  :init
  (global-company-mode)
  :custom
  (company-tooltip-align-annotations t)
  (company-show-quick-access 'left)
  )

;; YASnippet 
(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :custom
  (yas-snippet-dirs '("~/.emacs.d/snippets"))
  (yas-prompt-functions '(yas-dropdown-prompt))
  (yas-wrap-around-region t)
  (yas-triggers-in-field t)
  )
(defun my-yas-try-expanding-auto-snippets ()
  (when yas-minor-mode
    (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
      (yas-expand))))
(add-hook 'post-command-hook #'my-yas-try-expanding-auto-snippets)

(require 'init-snippet)

;; origami
(use-package origami
  :ensure t
  :hook ((c++-mode . origami-mode)
         (java-mode . origami-mode)
         (python-mode . origami-mode)
         )
  :bind (("C-c c". origami-toggle-node)
         )
  )

(require 'init-org)

;; mips-mode
;(use-package mips-mode
;  :mode "\\.s$"
;  )

(put 'set-goal-column 'disabled nil)
