; I've forgotten what most variables do and they do different things now, too
; TODO: investigate, remove some, see what happens

;(require 'tex-site)
;(setq TeX-command-list nil)
;(require 'chktex)
; '(show-trailing-whitespace t)
; '(save-abbrevs (quote silently))
; '(fill-column 80)

; a hack not to show modified buffers at the bottomt
; TODO: this function does not seem to be ever invoked.
(defun msb-sort-by-name-mikon (item1 item2)
  "Sort the items ITEM1 and ITEM2 by their `buffer-file-name'.
An item looks like (NAME . BUFFER)."
  (string-lessp (buffer-file-name (cdr item1))
                (buffer-file-name (cdr item2))))

(defun msb-item-handler-mikon (buffer &optional maxbuf)
  "Create one string item, concerning BUFFER, for the buffer menu.
Don't add the star for modified buffers."
  (let ((name (buffer-name))
	(read-only (if buffer-read-only "%" " ")))
    (format "%s %s" read-only name)))

(setq msb-item-handling-function 'msb-item-handler-mikon)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
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
 '(erc-enable-logging t)
 '(erc-log-file-coding-system (quote utf-8))
 '(erc-log-write-after-insert t)
 '(erc-log-write-after-send t)
 '(erc-modules (quote (autojoin button completion fill irccontrols list log match menu move-to-prompt netsplit networks noncommands readonly ring services stamp track)))
 '(erc-part-reason (quote erc-part-reason-various))
 '(erc-part-reason-various-alist (quote (("^$" "type error"))))
 '(erc-prompt-for-nickserv-password nil)
 '(erc-quit-reason (quote erc-quit-reason-various))
 '(erc-quit-reason-various-alist (quote (("^$" "type error"))))
 '(erc-save-buffer-on-part nil)
 '(erc-save-queries-on-quit nil)
 '(erc-services-mode t)
 '(font-lock-maximum-size 99999999)
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
 '(msb-item-sort-function (quote msb-sort-by-name-mikon))
 '(msb-max-menu-items 50)
 '(msb-mode t nil (msb))
 '(next-line-add-newlines t)
 '(next-screen-context-lines 0)
 '(only-global-abbrevs t)
 '(ps-paper-type (quote a4))
 '(ps-print-color-p t)
 '(require-final-newline t)
 '(scroll-bar-mode nil)
 '(scroll-preserve-screen-position 2)
 '(shift-select-mode nil)
 '(show-paren-mode t nil (paren))
 '(standard-indent 4)
 '(tab-width 8)
 '(tool-bar-mode nil)
 '(transient-mark-mode nil)
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
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 137 :width normal :foundry "xos4" :family "terminus")))))
;; '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 105 :width normal :foundry "xos4" :family "terminus")))))
;; '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "misc" :family "terminus")))))
;; too big for 2 frames side by side in HD:
;;-misc-fixed-medium-r-normal--15-140-75-75-c-90-iso10646-1
;; '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "misc" :family "fixed")))))
;; for full HD:
;; '(default ((t (:inherit nil :stipple nil :background "gray90" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 146 :width ultra-expanded :foundry "unknown" :family "FreeMono")))))

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

;;(setq x-super-keysym 'meta)

;;; frames & desktop

;; for HD:
;; hack: vertical-scroll-bars needed to resize the extra frame
(setq myframe (make-frame '((width . 80) (height . 49) (top . 0) (left . 0) (vertical-scroll-bars . t))))
;;(setq initial-frame-alist '((height . 49) (top . 0) (left . 655)))
(setq initial-frame-alist '((width . 80) (height . 50) (top . 0) (left . 830)))
(modify-frame-parameters myframe '((top . 0) (left . 0)))
;; for full HD:
;(setq initial-frame-alist '((height . 49)))
;(setq myframe (make-frame '((width . 80) (height . 49))))
;(modify-frame-parameters myframe '((top . 0) (left . 925)))

;(kill-buffer "*scratch*")
;(kill-buffer "*Messages*")
;
;   (setq initial-frame-alist
;               '((height . 61) (width . 160)))

;   (setq initial-frame-alist
;               '((top . 5399) (left . 4) (width . 80) (height . 51)))
;               '((font . "-adobe-courier-medium-r-normal--25-180-100-100-m-150-*")))

(setq load-path (cons "~/repos/emacs-color-theme-solarized" load-path))
(enable-theme 'solarized-dark)
