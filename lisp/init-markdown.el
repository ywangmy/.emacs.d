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

(provide 'init-markdown)
