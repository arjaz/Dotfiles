;; Not my shit
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    ((engine-omega "zathura")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "zathura")
     (output-pdf "zathura")
     (output-html "zathura"))))
 '(custom-safe-themes
   (quote
    ("d6c5b8dc6049f2e9dabdfcafa9ef2079352640e80dffe3e6cc07c0f89cbf9748" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(lsp-haskell-process-path-hie "~/.local/bin/hie-8.6.5")
 '(org-agenda-files (quote ("~/.emacs.d/org/tasks.org")))
 '(package-selected-packages
   (quote
    (telega restart-emacs yasnippet-snippets web-mode use-package typescript-mode terminal-here smooth-scrolling scala-mode rjsx-mode rainbow-delimiters purescript-mode powerline pipenv org-evil org-bullets nord-theme markdown-mode key-chord hl-todo highlight-indent-guides haskell-mode git-gutter-fringe evil-surround evil-numbers evil-magit evil-leader evil-escape evil-commentary eglot doom-themes doom-modeline disable-mouse diminish company bnf-mode auto-virtualenv auctex all-the-icons-dired)))
 '(safe-local-variable-values
   (quote
    ((haskell-process-use-ghci . t)
     (haskell-indent-spaces . 4)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; My shit

;; Startup optimization
;; (defun doom-defer-garbage-collection-h ()
;;   (setq gc-cons-threshold most-positive-fixnum))

;; (defun doom-restore-garbage-collection-h ()
;;   ;; Defer it so that commands launched immediately after will enjoy the
;;   ;; benefits.
;;   (run-at-time
;;    1 nil (lambda () (setq gc-cons-threshold doom-gc-cons-threshold))))

;; (add-hook 'minibuffer-setup-hook #'doom-defer-garbage-collection-h)
;; (add-hook 'minibuffer-exit-hook #'doom-restore-garbage-collection-h)

;; (defvar doom--file-name-handler-alist file-name-handler-alist)
;; (setq file-name-handler-alist nil)

;; (add-hook 'emacs-startup-hook
;;           (lambda ()
;;             (setq file-name-handler-alist doom--file-name-handler-alist)))

;; Disable startup message and gtk pop-ups
(setq inhibit-startup-message t
      x-gtk-use-system-tooltips nil
      use-dialog-box nil)
;; Disable menu-bar
(menu-bar-mode -1)
;; Disable scroll-bar
(scroll-bar-mode -1)
;; Disable tool-bar
(tool-bar-mode -1)
;; Disable tooltip
(tooltip-mode -1)

;; We don't want to type yes and no all the time so, do y and n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Save and restore session
(desktop-save-mode t)
(save-place-mode t)

;; Font and font size
(set-face-attribute 'default nil :height 100)
(set-frame-font "Hack Nerd Font Mono-10")

;; Don't create backup files
(setq make-backup-files nil)

;; Disable auto-saves
(setq auto-save-default nil)

;; Non-blinking cursor
(blink-cursor-mode 0)

;; Remove trailing whitespaces
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Auto pairs
(electric-pair-mode t)

;; Highlight matching brace
(show-paren-mode t)

;; Highlight current line
(global-hl-line-mode t)

;; Auto-follow symlinks
(setq vc-follow-symlinks t)

;; Move flymake garbage
(setq flymake-run-in-place nil)
(setq temporary-file-directory "~/.emacs.d/tmp/")

;; Buffers
(global-set-key (kbd "M-n") 'next-buffer)
(global-set-key (kbd "M-p") 'previous-buffer)

;; Clean buffers
(setq clean-buffer-list-delay-general 1)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates "^\\*")

;; Folding
(add-hook 'prog-mode-hook 'hs-minor-mode)

;; Zathura for pdf
(setq TeX-view-program-list '(("zathura" "zathura --page=%(outpage) %o")))

;; Relative line numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

(package-initialize)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmoderog/elpa"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(setq package-enable-at-startup nil)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package bnf-mode
  :defer t
  :ensure t)

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-c m") 'magit-status))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode t))

(use-package buffer-flip
  :ensure t
  :defer t
  :bind (("<backtab>" . buffer-flip-backward)
         ("M-<tab>" . buffer-flip-forward))
  :config
  (setq buffer-flip-skip-patterns
        '("^\\*helm\\b"
          "^\\*swiper\\*$")))

(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (setq ivy-display-style 'fancy)
  (setq ivy-format-function 'ivy-format-function-line))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode t))

;; ;; Helm
;; (use-package helm
;;   :ensure t
;;   :config
;;   (require 'helm)
;;   (require 'helm-config)
;;   (setq helm-split-window-inside-p t
;;         helm-move-to-line-cycle-in-source t
;;         helm-autoresize-min-height 20
;;         helm-autoresize-max-height 20
;;         helm-autoresize-mode t)
;;   (helm-mode t)
;;   (helm-autoresize-mode t)
;;   (global-set-key (kbd "M-x") 'helm-M-x)
;;   (global-set-key (kbd "C-x C-f") 'helm-find-files)
;;   (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action))

;; (use-package helm-projectile
;;   :ensure t
;;   :config
;;   (helm-projectile-on))

;; Org-mode
(use-package org-bullets
  :ensure t
  :defer t
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode))

;; Treemacs
(use-package treemacs
  :ensure t
  :defer t
  :config
  (treemacs-resize-icons 16)
  ;; (setq treemacs-indentation-string "·")
  (with-eval-after-load 'treemacs
    (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?))
  (progn
    (setq treemacs-follow-mode t)))

(use-package treemacs-magit
  :ensure t)

(use-package treemacs-projectile
  :defer t
  :ensure t)

(use-package treemacs-icons-dired
  :defer t
  :ensure t)

;; Evil
(use-package treemacs-evil
  :ensure t
  :init
  (setq evil-want-keybinding nil))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode t))

(use-package evil-commentary
  :ensure t
  :config
  (evil-commentary-mode))

(use-package evil-leader
  :ensure t
  :config
  (setq evil-leader/in-all-states 1)
  (global-evil-leader-mode)
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "q" 'kill-this-buffer
    "b" 'ivy-switch-buffer
    "v" 'evil-window-vsplit
    "h" 'evil-window-split
    "o" 'counsel-find-file
    "," 'counsel-projectile-find-file
    "j" 'counsel-file-jump
    "g" 'counsel-bookmark
    "e" 'eglot
    "d" 'eglot-find-declaration
    "f" 'eglot-format
    "r" 'eglot-rename
    "a" 'eglot-code-actions
    "m" 'eglot-help-at-point
    "t" 'treemacs))

(use-package org-evil
  :defer t
  :ensure t)

(use-package evil
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-u") (lambda()
                                                  (interactive)
                                                  (evil-scroll-up nil)))
  (define-key evil-normal-state-map (kbd "C-d") (lambda()
                                                  (interactive)
                                                  (evil-scroll-down nil)))
  (add-hook 'evil-mode #'(lambda () (modify-syntax-entry ?_ "w")))
  (evil-mode t)
  (setq evil-split-window-below t
        evil-vsplit-window-right t))

(use-package evil-numbers
  :ensure t
  :config
  (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)
  (define-key evil-normal-state-map (kbd "C-c a") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "C-c c") 'evil-numbers/dec-at-pt))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode t)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state))

(use-package evil-magit
  :ensure t)

(use-package evil-collection
  :ensure t
  :config
  (evil-collection-init))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 1)
  (setq company-selection-wrap-around t)
  (define-key company-active-map (kbd "<tab>") 'company-select-next)
  (define-key company-active-map (kbd "<return>") 'company-complete)
  (global-company-mode t))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode t))

(use-package yasnippet-snippets
  :ensure t)

(use-package pipenv
  :ensure t
  :defer t
  :hook (python-mode . pipenv-mode)
  :init
  (setq pipenv-projectile-after-switch-function
        #'pipenv-projectile-after-switch-extended))

(use-package auto-virtualenv
  :ensure t
  :defer t
  :config
  (setq python-shell-interpreter "python")
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv))

(use-package flymake-cursor
  :load-path "~/.emacs.d/lisp/emacs-flymake-cursor"
  :defer t
  :config
  (flymake-cursor-mode))

(use-package eglot
  :ensure t
  :init
  (add-hook 'prog-mode 'eglot-ensure))

(use-package cmake-mode
  :ensure t)

(use-package haskell-mode
  :defer t
  :ensure t)

(use-package csharp-mode
  :ensure t)

(use-package rjsx-mode
  :ensure t
  :defer t
  :init
  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode)))

(use-package typescript-mode
  :defer t
  :ensure t)

(use-package purescript-mode
  :defer t
  :ensure t)

(use-package web-mode
  :defer t
  :ensure t)

(use-package scala-mode
  :ensure t
  :defer t
  :interpreter
  ("scala" . scala-mode))

(use-package markdown-mode
  :defer t
  :ensure t)

(use-package yaml-mode
  :defer t
  :ensure t)

(use-package smooth-scrolling
  :ensure t
  :config
  (smooth-scrolling-mode))

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t)
  (load-theme 'doom-nord t)
  (doom-themes-org-config))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-lsp t))

(use-package git-gutter
  :ensure t
  :defer t
  :config
  (global-git-gutter-mode t)
  (setq git-gutter:window-width 2
        git-gutter:update-interval 1
        git-gutter:ask-p nil))

(use-package git-gutter-fringe
  :ensure t
  :diminish git-gutter-mode
  :after git-gutter
  :demand fringe-helper
  :config
  ;; subtle diff indicators in the fringe
  ;; places the git gutter outside the margins.
  (setq-default fringes-outside-margins t)
  ;; thin fringe bitmaps
  (define-fringe-bitmap 'git-gutter-fr:added
    [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:modified
    [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224]
    nil nil 'center)
  (define-fringe-bitmap 'git-gutter-fr:deleted
    [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248]
    nil nil 'center))

(use-package highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive 'stack)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :ensure t
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode))

(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode t))

(use-package terminal-here
  :ensure t
  :config
  (setq terminal-here-terminal-command (list "st" "--"))
  (global-set-key (kbd "M-RET") #'terminal-here-launch))

;; Go away mouse I don't like you
(use-package disable-mouse
  :ensure t
  :config
  (global-disable-mouse-mode)
  (mapc #'disable-mouse-in-keymap
        (list evil-motion-state-map
              evil-normal-state-map
              evil-visual-state-map
              evil-insert-state-map)))

(use-package restart-emacs
  :defer t
  :ensure t)

;; May be broken
;; (use-package eaf
;;   :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
;;   :custom
;;   (eaf-finde-alternate-file-in-dired t))

;; <esc> quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;"
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; use spaces
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq c-default-style "k&r"
      c-basic-offset 4)

(provide 'emacs)
;;; emacs ends here
(put 'erase-buffer 'disabled nil)
