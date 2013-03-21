(defvar real-keyboard-keys
  '(("M-<up>"        . "\M-[1;9A")
    ("M-<down>"      . "\M-[1;9B")
    ("M-<right>"     . "\M-[1;9C")
    ("M-<left>"      . "\M-[1;9D"))
  "An assoc list of pretty key strings
and their terminal equivalents.")

(defun key (desc)
  (or (and window-system (read-kbd-macro desc))
      (or (cdr (assoc desc real-keyboard-keys))
          (read-kbd-macro desc))))

;; Window movement keys: provides quick jumping between many open windows
(global-set-key (key "M-<left>") 'windmove-left)          ; move to left windnow
(global-set-key (key "M-<right>") 'windmove-right)        ; move to right window
(global-set-key (key "M-<up>") 'windmove-up)              ; move to upper window
(global-set-key (key "M-<down>") 'windmove-down)          ; move to downer window

;; my shortcuts
(global-set-key (kbd "M-o d") "require 'ruby-debug'; debugger")
(global-set-key (kbd "M-s") 'rgrep)
(setq kill-whole-line t) ; make kill-line include the ending newline char
(global-set-key (kbd "M-9") 'kill-whole-line)
(setq make-backup-files nil)
(show-paren-mode t)

(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")
(add-to-list 'load-path "~/.emacs.d/elpa")

(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; load vendor libs
(let ((default-directory "~/.emacs.d/vendor/"))
      (normal-top-level-add-to-load-path '("."))
      (normal-top-level-add-subdirs-to-load-path))

;; trailing white spaces
(setq-default show-trailing-whitespace t)

;; mode line settings
(setq line-number-mode t)
(setq column-number-mode t)
(setq size-indication-mode t)

;; Whitespaces instead of tabs
(setq-default indent-tabs-mode nil)

;; line number mode
(global-linum-mode t)

;; line number off for certain major modes(eshell-mode wl-summary-mode compilation-mode org-mode text-mode dired-mode)
;; thanks to git://github.com/emacsmirror/linum-off.git
(require 'linum-off)

;; highlight parentheses mode

;; nice scrolling
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed t)
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 0)

;; Give better naming of identically named files
(setq uniquify-buffer-name-style 'reverse) ;; Put the dir name at the end of the buffer name
(setq uniquify-separator "|") ;; Separate file and dir with a |
(setq uniquify-after-kill-buffers-p t) ;; Rename uniquified buffers when one is killed
(setq uniquify-ignore-buffers-re "^\\*") ;; Ignore special buffers
(put 'upcase-region 'disabled nil)

(setq tags-case-fold-search nil)

;; load auto complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;cucumber feature mode
;; Key Bindings
;; ------------
;;
;;  \C-c ,v
;;  :   Verify all scenarios in the current buffer file.
;;
;;  \C-c ,s
;;  :   Verify the scenario under the point in the current buffer.
;;
;;  \C-c ,f
;;  :   Verify all features in project. (Available in feature and
;;      ruby files)
;;
;;  \C-c ,r
;;  :   Repeat the last verification process.
;;
;;  \C-c ,g
;;  :   Go to step-definition under point
;;  :   (requires ruby_parser gem >= 2.0.5)

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Tabs and spacing
(setq js-indent-level 2)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(tab-stop-list (quote (2 4 6 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

;; Interactively do things
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)

;; Rinari
(require 'rinari)
(setq rinari-tags-file-name "TAGS")

;; Textmate
(require 'textmate)
(textmate-mode)

;; Mouse configuration
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

; Mouse Wheel Scrolling
; Scroll up five lines without modifiers
(defun up-slightly () (interactive) (scroll-up 3))
(defun down-slightly () (interactive) (scroll-down 3))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

;; System clipboard
(setq x-select-enable-clipboard t)

;; mode-compile
(require 'mode-compile)
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
(global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

;; rspec-mode
(require 'rspec-mode)

;; etags-select
(require 'etags-select)

;; haml-mode
(require 'haml-mode)

;; yaml-mode
(require 'yaml-mode)

;; json-mode
(require 'json-mode)

;; ruby-mode
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("irbrc$" . ruby-mode))
(add-to-list 'auto-mode-alist '("rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("gemspec$" . ruby-mode))

;; bundler
(require 'bundler)

;; magit
(require 'magit)

;; scala-mode
(require 'scala-mode)

;; ruby-block
(require 'ruby-block)
(ruby-block-mode t)
;; do overlay
(setq ruby-block-highlight-toggle 'overlay)
;; display to minibuffer
(setq ruby-block-highlight-toggle 'minibuffer)
;; display to minibuffer and do overlay
(setq ruby-block-highlight-toggle t)

;; full-ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)

;; browse-kill-ring
(require 'browse-kill-ring)
(global-set-key "\C-cy" 'browse-kill-ring)

;; ace-jump-mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-word-mode)

;; custom-emacs-settings

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; window re-size management
(global-set-key (kbd "M-1") 'shrink-window)
(global-set-key (kbd "M-2") 'enlarge-window)
(global-set-key (kbd "M-3") 'shrink-window-horizontally)
(global-set-key (kbd "M-4") 'enlarge-window-horizontally)

;;sass
(setq exec-path (cons (expand-file-name "~/.gem/ruby/1.8/bin") exec-path))
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
