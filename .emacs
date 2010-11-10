; I've forgotten what most variables do and they do different things now, too
; TODO: investigate, remove some, see what happens

;(require 'tex-site)
;(setq TeX-command-list nil)
;(require 'chktex)
; '(show-trailing-whitespace t)
; '(save-abbrevs (quote silently))
; '(fill-column 80)

(defun msb-sort-by-name-mikon (item1 item2)
  "Sort the items ITEM1 and ITEM2 by their `buffer-file-name'.
An item looks like (NAME . BUFFER)."
  (string-lessp (buffer-file-name (cdr item1))
                (buffer-file-name (cdr item2))))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode nil)
 '(before-save-hook (quote (whitespace-cleanup)))
 '(blink-cursor-mode nil)
 '(c-basic-offset 4)
 '(c-default-style (quote ((c-mode . "bsd") (c++-mode . "bsd") (objc-mode . "bsd") (java-mode . "java") (awk-mode . "awk") (other . "bsd"))))
 '(case-fold-search nil)
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(compilation-error-screen-columns nil)
 '(desktop-save t)
 '(desktop-save-mode t)
 '(font-lock-maximum-size 99999999)
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-echo-area-message "mikon")
 '(inhibit-startup-screen t)
 '(kill-ring-max 1000)
 '(make-backup-files nil)
 '(message-log-max t)
 '(mouse-buffer-menu-mode-mult 1)
 '(mouse-scroll-delay 0.02)
 '(mouse-scroll-min-lines 1)
 '(mouse-wheel-mode t nil (mwheel))
 '(msb-display-most-recently-used 0)
 '(msb-files-by-directory t)
 '(msb-max-menu-items 50)
 '(msb-mode t nil (msb))
 '(msb-most-recently-used-sort-key 111010)
 '(next-line-add-newlines nil)
 '(next-screen-context-lines 0)
 '(only-global-abbrevs t)
 '(ps-paper-type (quote a4))
 '(ps-print-color-p t)
 '(require-final-newline t)
 '(scroll-preserve-screen-position 2)
 '(show-paren-mode t nil (paren))
 '(standard-indent 4)
 '(tab-width 8)
 '(truncate-partial-width-windows nil)
 '(tuareg-default-indent 2)
 '(tuareg-function-indent 0)
 '(tuareg-in-indent 0)
 '(tuareg-let-always-indent t)
 '(tuareg-with-indent 0)
 '(undo-limit 200000)
 '(undo-strong-limit 300000)
 '(uniquify-buffer-name-style nil nil (uniquify))
 '(use-file-dialog nil)
 '(user-mail-address "mikolaj.konarski@gmail.com")
 '(whitespace-style (quote (trailing space-before-tab::space empty))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;(load "/usr/share/emacs/site-lisp/proofgeneral/generic/proof-site.el")
;(setq auto-mode-alist (cons '("\\.v$" . coq-mode) auto-mode-alist))
;        (autoload 'coq-mode "coq" "Major mode for editing Coq vernacular." t)

(setq compile-command "make ")

;;; modes for files

(setq auto-mode-alist
      (append '(("\\.ocamlinit$" . tuareg-mode)
                ("\\.ml$" . tuareg-mode)
                ("\\.mli$" . tuareg-mode)
                ("\\.mll$" . tuareg-mode)
                ("\\.mly$" . tuareg-mode)
                ("\\.eml$" . sml-mode)
                ("\\.sml$" . sml-mode)
                ("\\.sig$" . sml-mode)
                ("\\.ML$" . sml-mode)
                ("\\.ufo$" . c-mode)) auto-mode-alist))

(put 'erase-buffer 'disabled nil)

;;; sml-mode

(autoload 'sml-mode "sml-mode" "Major mode for editing Standard ML." t)
(autoload 'sml "sml-proc" "Run an inferior ML process." t)
(autoload 'sml-mosml "sml-mosml" "Set up and run Moscow ML." t)
(autoload 'sml-poly-ml "sml-poly-ml" "Set up and run Poly/ML." t)

(setq sml-mode-hook
      '(lambda() "SML mode hacks" (setq sml-case-indent t)))

(setq sml-load-hook
      '(lambda() "Fontify SML." (require 'sml-font)))

(setq sml-mode-info "/usr/local/share/emacs/site-lisp/sml-mode.info")

;;; dule-font
;;(load "~/.dule-font")
;;(load "caml-font")

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;; (setq TeX-auto-untabify nil)
;; (setq TeX-open-quote "\"\`")
(setq TeX-save-query nil)

(setq LaTeX-section-hook
      '(LaTeX-section-heading
        LaTeX-section-title
        ;;LaTeX-section-toc
        LaTeX-section-section
        LaTeX-section-label))

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

(global-unset-key [backspace])
(global-set-key [backspace] 'backward-delete-char-untabify)
(global-unset-key [delete])
(global-set-key [delete] 'delete-char)

;(global-set-key [C-backspace] 'backward-kill-line)
 (global-set-key [M-delete]       'kill-word)
 (global-set-key [C-delete]       'kill-line)

;;; frames & desktop

(setq initial-frame-alist
      '((height . 61)))

(setq myframe (make-frame '((width . 80) (height . 61))))
(modify-frame-parameters myframe '((top . 0) (left . 930)))

;   (kill-buffer "*scratch*")
;   (kill-buffer "*Messages*")

;   (setq initial-frame-alist
;               '((height . 61) (width . 160)))

;   (setq initial-frame-alist
;               '((top . 5399) (left . 4) (width . 80) (height . 51)))
;               '((font . "-adobe-courier-medium-r-normal--25-180-100-100-m-150-*")))
