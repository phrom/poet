;;; poet-monochrome-theme.el --- A monochrome theme for prose.

;; Copyright 2018-now Kunal Bhalla

;; Author: Kunal Bhalla <bhalla.kunal@gmail.com>
;; URL: https://github.com/kunalb/poet/
;; Version: 2.0

;;; Commentary:

;; Emacs has very good support for multiple fonts in a single
;; file.  Poet uses this support to make it much more convenient to
;; write prose within Emacs, with particular attention paid to
;; org-mode and markdown-mode.  Code blocks, tables, etc are
;; formatted in monospace text with the appropriate backgrounds.

;; Recommended customizations for using this theme
;;
;; - Set up the base fonts you'd like to use in Emacs before loading Poet
;;     (set-face-attribute 'default nil :family "Iosevka" :height 130)
;;     (set-face-attribute 'fixed-pitch nil :family "Iosevka")
;;     (set-face-attribute 'variable-pitch nil :family "Baskerville")
;;   On loading this theme captures the default and treats that for fixed-pitch
;;   rendering.
;;
;; - Enable variable pitch mode for editing text
;; (add-hook 'text-mode-hook
;;            (lambda ()
;;             (variable-pitch-mode 1))
;;
;; - Some other modes I like to enable/disable
;;     (olivetti-mode 1)        ;; Centers text in the buffer
;;     (flyspell-mode 1)        ;; Catch Spelling mistakes
;;     (typo-mode 1)            ;; Good for symbols like em-dash
;;     (blink-cursor-mode 0)    ;; Reduce visual noise
;;     (linum-mode 0)           ;; No line numbers for prose
;;
;; - And prettier org mode bullets:
;;     (setq org-bullets-bullet-list
;;         '("◉" "○"))
;;     (org-bullets 1)

;;; Code:

(defvar poet--monospace-height
 (face-attribute 'fixed-pitch :height nil 'default)
 "The original height stored as a defvar to stay constant across reloads.")

(defun poet--height (multiplier)
 "Scale up the height according to the MULTIPLIER."
 (truncate (* poet--monospace-height multiplier)))
(deftheme poet-monochrome
  "A monochrome prose friendly theme.")

(let ((fg "#444444")
      (bg "#d1d1d1")
      (emph "#222222")
      (sep "#eeeeee")
      (hlt "#efefef")
      (bg-hlt "#f0f0f0")
      (muted "#606060")
      (meta "#3e3e3e")
      (link "#676767")
      (link-underline "#979797")
      (vlink-underline "#4c4c4c")
      (header "#414141")
      (button "#616161")
      (glyph "#787878")
      (cursor "#333333")
      (paren-match-bg "#8b8b8b")
      (paren-match-fg "#ffffff")
      (search-fg "#6d6d6d")
      (search-bg "#ffffff")
      (search-fail-bg "#d9d9d9")
      (tooltip-fg "#111111")
      (tooltip-bg "#bababa")
      (shadow "#999999")
      (secondary-bg "#cecece")
      (trailing-bg "#b2b2b2")
      (fci "#dedede")
      (lazy-hlt-fg "#000000")
      (lazy-hlt-bg "#ffffff")
      (evil-rep-fg "#ffffff")
      (evil-rep-bg "#3e3e3e")
      (mode-line-fg "#111111")
      (header-line-bg "#e0e0e0")
      (mode-line-hlt "#ffffff")
      (mode-line-inactive "#888888")
      (builtin "#606060")
      (string "#595959")
      (function-name "#636363")
      (keyword "#656565")
      (constant "#696969")
      (type "#7a7a7a")
      (variable "#545454")
      (org-meta "#787878")
      (org-document-info "#606060")
      (org-table "#e0e0e0")
      (org-quote-fg "#505050")
      (org-quote-bg "#e0e0e0")
      (org-date "#444444")
      (org-title "#696969")
      (org-title-underline "#aaaaaa")
      (org-checkbox "#aaaaaa")
      (org-scheduled "#333333")
      (org-scheduled-today "#111111")
      (org-done "#636363")
      (org-todo "#656565")
      (org-tag "#777777")
      (org-block-line "#c7c7c7")
      (org-block-bg "#e0e0e0")
      (org-agenda-structure-fg "#555555")
      (org-agenda-structure-bg "#e0e0e0")
      (org-agenda-today-fg "#000000")
      (org-agenda-today-bg "#eeeeee")
      (org-special-keyword "#777777")
      (org-sched-prev "#1f1f1f")
      (org-agenda-done "#777777")
      (hl-line "#efefef")
      (linum-hlt "#555555")
      (linum "#aaaaaa")
      (markdown-markup "#787878")
      (markdown-metadata "#777777")
      (markdown-language "#606060")
      (markdown-list "#000000")
      (markdown-code-bg "#e0e0e0")
      (markdown-pre-bg "#e0e0e0")
      (markdown-header-delimiter "#787878")
      (imenu "#3e3e3e"))
 (custom-theme-set-faces 'poet-monochrome
  `(variable-pitch ((t (:family ,(face-attribute 'variable-pitch :family) :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(default ((t (:background ,bg :foreground ,fg))))
  `(italic ((t (:foreground ,emph :slant italic))))
  `(highlight ((t (:background ,hlt :overline nil))))
  `(region ((t (:background ,bg-hlt))))
  `(fringe ((t (:background ,bg))))
  `(button ((t (:inherit default :foreground ,button))))
  `(escape-glyph ((t (:foreground ,glyph))))
  `(link ((t (:underline (:color ,link-underline :style line) :foreground ,link))))
  `(link-visited ((t (:inherit link :foreground ,link :underline (:color ,vlink-underline :style line)))))
  `(cursor ((t (:background ,cursor))))
  `(show-paren-match ((t (:background ,paren-match-fg :foreground ,paren-match-bg))))
  `(isearch ((t (:foreground ,search-fg :background ,search-bg))))
  `(isearch-fail ((t (:background ,search-fail-bg))))
  `(query-replace ((t (:inherit isearch))))
  `(tooltip ((t (:inherit default :foreground ,tooltip-fg :background ,tooltip-bg))))
  `(shadow ((t (:foreground ,shadow))))
  `(secondary-selection ((t (:background ,secondary-bg))))
  `(trailing-whitespace ((t (:background ,trailing-bg))))
  `(lazy-highlight ((t (:foreground ,lazy-hlt-fg :background ,lazy-hlt-bg))))
  `(next-error ((t (:inherit region))))
  `(window-divider ((t (:background ,sep :foreground ,sep))))
  `(vertical-border ((t (:background ,sep :foreground ,sep))))
  `(evil-ex-substitute-replacement ((t (:foreground ,evil-rep-fg :background ,evil-rep-bg :underline nil))))
  `(minibuffer-prompt ((t (:inherit fixed-pitch :weight bold :foreground ,meta))))
  `(mode-line ((t (:inherit fixed-pitch :foreground ,mode-line-fg :background ,bg :overline ,sep :box (:line-width 3 :color ,bg)))))
  `(header-line ((t (:overline nil :background ,header-line-bg :box (:line-width 3 :color ,header-line-bg) :underline ,sep :inherit mode-line))))
  `(mode-line-buffer-id ((t (:weight bold))))
  `(mode-line-emphasis ((t (:weight bold))))
  `(mode-line-highlight ((t (:background ,mode-line-hlt))))
  `(mode-line-inactive ((t (:inherit mode-line :background ,bg :foreground ,mode-line-inactive :box (:color ,bg :line-width 3)))))
  `(error ((t (:inherit fixed-pitch))))
  `(font-lock-comment-face ((t (:foreground ,muted :inherit fixed-pitch))))
  `(font-lock-builtin-face ((t (:foreground ,builtin :inherit fixed-pitch))))
  `(font-lock-string-face ((t (:inherit fixed-pitch :foreground ,string))))
  `(font-lock-function-name-face ((t (:inherit fixed-pitch :foreground ,function-name))))
  `(font-lock-keyword-face ((t (:inherit fixed-pitch :foreground ,keyword))))
  `(font-lock-comment-delimiter-face ((t (:inherit fixed-pitch :inherit font-lock-comment-face))))
  `(font-lock-constant-face ((t (:inherit fixed-pitch :foreground ,constant))))
  `(font-lock-doc-face ((t (:inherit fixed-pitch :inherit font-lock-string-face))))
  `(font-lock-preprocessor-face ((t (:inherit fixed-pitch :inherit font-lock-builtin-face))))
  `(font-lock-regexp-grouping-backslash ((t (:inherit fixed-pitch :inherit bold))))
  `(font-lock-regexp-grouping-construct ((t (:inherit fixed-pitch :inherit bold))))
  `(font-lock-type-face ((t (:foreground ,type :inherit fixed-pitch))))
  `(font-lock-variable-name-face ((t (:inherit fixed-pitch :foreground ,variable))))
  `(font-lock-warning-face ((t (:inherit error))))
  `(org-level-1 ((t (:inherit default :foreground ,header :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.5)))))))
  `(org-level-2 ((t (:inherit default :foreground ,header :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.4)))))))
  `(org-level-3 ((t (:inherit default :foreground ,header :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.3)))))))
  `(org-level-4 ((t (:inherit default :foreground ,header :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(org-level-5 ((t (:inherit default :foreground ,header :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(org-level-6 ((t (:inherit default :foreground ,header :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(org-level-7 ((t (:inherit default :foreground ,header :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(org-level-8 ((t (:inherit default :foreground ,header :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(org-meta-line ((t (:inherit fixed-pitch :foreground ,org-meta))))
  `(org-document-info-keyword ((t (:inherit fixed-pitch :foreground ,org-document-info))))
  `(org-document-info ((t (:inherit default :foreground ,org-document-info))))
  `(org-verbatim ((t (:inherit fixed-pitch))))
  `(org-code ((t (:inherit fixed-pitch))))
  `(org-table ((t (:inherit fixed-pitch :background ,org-table))))
  `(org-formula ((t (:inherit org-table :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1)))))))
  `(org-verse ((t (:inherit default :foreground ,org-quote-fg :background ,org-quote-bg))))
  `(org-quote ((t (:inherit default :foreground ,org-quote-fg :background ,org-quote-bg))))
  `(org-hide ((t (:inherit fixed-pitch :foreground ,bg))))
  `(org-indent ((t (:inherit org-hide))))
  `(org-date ((t (:inherit fixed-pitch :foreground ,org-date :underline nil))))
  `(org-document-title ((t (:inherit default :foreground ,org-title :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.8))) :underline (:color ,org-title-underline)))))
  `(org-checkbox ((t (:inherit fixed-pitch :weight bold :foreground ,org-checkbox))))
  `(org-done ((t (:inherit fixed-pitch :foreground ,org-done))))
  `(org-todo ((t (:inherit fixed-pitch :foreground ,org-todo))))
  `(org-tag ((t (:inherit fixed-pitch :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1))) :foreground ,org-tag))))
  `(org-block-begin-line ((t (:inherit fixed-pitch :background ,org-block-line))))
  `(org-block-end-line ((t (:inherit fixed-pitch :background ,org-block-line))))
  `(org-block ((t (:background ,org-block-bg :inherit fixed-pitch))))
  `(org-priority ((t (:inherit fixed-pitch :weight normal))))
  `(org-agenda-structure ((t (:foreground ,org-agenda-structure-fg :background ,bg :box (:line-width 3 :color ,bg) :underline ,org-agenda-structure-bg))))
  `(org-scheduled ((t (:foreground ,org-scheduled))))
  `(org-scheduled-today ((t (:foreground ,org-scheduled-today))))
  `(org-agenda-date-weekend ((t (:inherit org-agenda-structure))))
  `(org-agenda-date-today ((t (:box (:line-width 3 :color ,org-agenda-today-bg) :foreground ,org-agenda-today-fg :background ,org-agenda-today-bg))))
  `(org-special-keyword ((t (:inherit fixed-pitch :foreground ,org-special-keyword))))
  `(org-scheduled-previously ((t (:foreground ,org-sched-prev))))
  `(org-agenda-done ((t (:foreground ,org-agenda-done))))
  `(org-footnote ((t (:foreground ,link))))
  `(hl-line ((t (:background ,hl-line))))
  `(linum-highlight-face ((t (:inherit fixed-pitch :foreground ,linum-hlt))))
  `(linum ((t (:inherit fixed-pitch :foreground ,linum))))
  `(line-number ((t (:inherit fixed-pitch :foreground ,linum))))
  `(line-number-current-line ((t (:inherit fixed-pitch :foreground ,linum-hlt))))
  `(markdown-header-face-1 ((t (:foreground ,header :inherit default :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.5)))))))
  `(markdown-header-face-2 ((t (:foreground ,header :inherit default :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.4)))))))
  `(markdown-header-face-3 ((t (:foreground ,header :inherit default :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.3)))))))
  `(markdown-header-face-4 ((t (:foreground ,header :inherit default :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(markdown-header-face-5 ((t (:foreground ,header :inherit default :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(markdown-header-face-6 ((t (:foreground ,header :inherit default :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(markdown-header-face-7 ((t (:foreground ,header :inherit default :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(markdown-header-face-8 ((t (:foreground ,header :inherit default :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1.23)))))))
  `(markdown-markup-face ((t (:inherit fixed-pitch :foreground ,markdown-markup))))
  `(markdown-inline-code-face ((t (:inherit fixed-pitch))))
  `(markdown-metadata-key-face ((t (:inherit fixed-pitch :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1))) :foreground ,markdown-metadata))))
  `(markdown-metadata-value-face ((t (:inherit fixed-pitch :height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1))) :foreground ,fg))))
  `(markdown-language-keyword-face ((t (:foreground ,markdown-language))))
  `(markdown-list-face ((t (:inherit fixed-pitch :foreground ,markdown-list))))
  `(markdown-code-face ((t (:inherit fixed-pitch :foreground ,fg :background ,markdown-code-bg))))
  `(markdown-pre-face ((t (:inherit fixed-pitch :color ,fg :background ,markdown-pre-bg))))
  `(markdown-header-delimiter-face ((t (:inherit fixed-pitch :foreground ,markdown-header-delimiter))))
  `(markdown-header-rule-face ((t (:inherit fixed-pitch :foreground ,markdown-header-delimiter))))
  `(markdown-url-face ((t (:inherit fixed-pitch :foreground ,link))))
  `(imenu-list-entry-face-0 ((t (:foreground ,imenu))))
  `(imenu-list-entry-face-1 ((t (:foreground ,imenu))))
  `(imenu-list-entry-face-2 ((t (:foreground ,imenu))))
  `(imenu-list-entry-face-3 ((t (:foreground ,imenu))))
  `(imenu-list-entry-face-4 ((t (:foreground ,imenu))))
  `(imenu-list-entry-face-5 ((t (:foreground ,imenu))))
  `(helm-source-header ((t (:height (lambda (base) (truncate (* (face-attribute 'fixed-pitch :height nil 'default) 1))))))))
 (custom-theme-set-variables 'poet-monochrome
  '(line-spacing .2)
  `(fci-rule-color ,fci)))

;;;###autoload
(when (and (boundp 'custom-theme-load-path)
           load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory
                (file-name-directory load-file-name))))

(provide-theme 'poet-monochrome)
;;; poet-monochrome-theme.el ends here
