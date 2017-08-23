(add-to-list 'load-path "~/.emacs.d/utils")
(add-to-list 'load-path "~/.emacs.d/elpa")

(load "customize")

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


(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

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

;; recentf stuff
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Tabs and spacing
(setq js-indent-level 2)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (ace-jump-mode browse-kill-ring full-ack highlight-parentheses auto-complete json-mode ruby-compilation inflections findr clojure-test-mode)))
 '(tab-stop-list
   (quote
    (2 4 6 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))

;; Interactively do things
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)

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

;; ruby-mode
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("irbrc$" . ruby-mode))
(add-to-list 'auto-mode-alist '("rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("gemspec$" . ruby-mode))

;; custom-emacs-settings

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; window re-size management
(global-set-key (kbd "M-1") 'shrink-window)
(global-set-key (kbd "M-2") 'enlarge-window)
(global-set-key (kbd "M-3") 'shrink-window-horizontally)
(global-set-key (kbd "M-4") 'enlarge-window-horizontally)

;; duplicate current line
(global-set-key (kbd "C-D") 'duplicate-current-line)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
