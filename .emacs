(defun msb-item-handler-mikon (buffer &optional maxbuf)
  "Create one string item, concerning BUFFER, for the buffer menu.
Don't add the star for modified buffers."
  (let ((name (buffer-name))
       (read-only (if buffer-read-only "%" " ")))
    (format "%s %s" read-only name)))

(setq msb-item-handling-function 'msb-item-handler-mikon)

(add-to-list 'load-path "~/r/color-theme-sanityinc-tomorrow")

(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(before-save-hook '(whitespace-cleanup))
 '(blink-cursor-mode nil)
 '(case-fold-search nil)
 '(column-number-mode t)
 '(custom-enabled-themes '(sanityinc-tomorrow-night))
 '(custom-safe-themes
   '("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default))
 '(custom-theme-load-path
   `(custom-theme-directory t "~/r/color-theme-sanityinc-tomorrow") t)
 '(desktop-path '("." "~/.emacs.d/" "~"))
 '(desktop-save 'if-exists)
 '(desktop-save-mode t)
 '(font-lock-maximum-size 99999999)
 '(fringe-mode '(0) nil (fringe))
 '(haskell-font-lock-haddock t)
 '(haskell-indentation-where-post-offset 1)
 '(haskell-interactive-mode-hide-multi-line-errors t)
 '(haskell-process-prompt-restart-on-cabal-change nil)
 '(haskell-process-suggest-remove-import-lines nil)
 '(haskell-stylish-on-save t)
 '(hs-checkers-replace-with-suggestions nil)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(kill-ring-max 2000000)
 '(line-number-display-limit nil)
 '(make-backup-files nil)
 '(message-log-max t)
 '(mouse-buffer-menu-mode-mult 1)
 '(mouse-drag-copy-region t)
 '(mouse-scroll-delay 0.02)
 '(msb-display-most-recently-used 0)
 '(msb-files-by-directory t)
 '(msb-max-menu-items 50)
 '(msb-mode t nil (msb))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages '(haskell-mode))
 '(require-final-newline t)
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(scroll-preserve-screen-position t)
 '(select-enable-primary t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(tool-bar-position 'right)
 '(tooltip-mode nil)
 '(undo-limit 200000)
 '(undo-strong-limit 300000)
 '(use-file-dialog nil)
 '(whitespace-style '(trailing space-before-tab::space empty)))
(package-initialize)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 98 :width normal)))))

;; '(haskell-tags-on-save t)

(global-set-key [C-right]  'end-of-line)
(global-set-key [C-left]   'beginning-of-line)

(global-set-key [M-up] '(lambda () "Scrolls the buffer one line up."
                          (interactive) (scroll-up -1)))
(global-set-key [M-down] '(lambda () "Scrolls the buffer one line down."
                            (interactive) (scroll-up 1)))
(global-set-key [home] '(lambda () "."
                          (interactive) (beginning-of-buffer)))
(global-set-key [end] '(lambda () "."
                         (interactive) (end-of-buffer)))

(setq x-super-keysym 'meta)

(global-set-key [f11] 'previous-buffer)
(global-set-key [f12] 'next-buffer)

(defun revert-all-buffers ()
  "Refreshes all open buffers from their respective files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name) (not (buffer-modified-p)))
        (revert-buffer t t t) )))
  (message "Refreshed open files.") )


;; (add-to-list 'load-path "~/r/haskell-mode/")
;; (require 'haskell-mode-autoloads)

;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;; (setq haskell-doc-show-reserved nil)

;; (add-hook 'haskell-mode-hook 'haskell-hook)

(defun haskell-hook ()

  ;; Build the Cabal project.
  (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
  ;; Interactively choose the Cabal command to run.
  (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)

  ;; Get the type and info of the symbol at point, print it in the
  ;; message buffer.
  (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)

  ;; Jump to the imports. Keep tapping to jump between import
  ;; groups. C-u f8 to jump back again.
  (define-key haskell-mode-map [f8] 'haskell-navigate-imports)

  ;; ;; Indent the below lines on columns after the current column.
  ;; (define-key haskell-mode-map (kbd "C-<right>")
  ;;   (lambda ()
  ;;     (interactive)
  ;;     (haskell-move-nested 1)))
  ;; ;; Same as above but backwards.
  ;; (define-key haskell-mode-map (kbd "C-<left>")
  ;;   (lambda ()
  ;;     (interactive)
  ;;     (haskell-move-nested -1))))

  ;; Jump to the definition of the current symbol.
  (define-key haskell-mode-map (kbd "M-.") 'haskell-mode-tag-find)
  (define-key haskell-mode-map (kbd "≥") 'haskell-mode-tag-find)

  (define-key haskell-mode-map [f5] 'haskell-sort-imports)

)
