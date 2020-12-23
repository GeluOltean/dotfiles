;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(defvar my-term-shell "/usr/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

(setq kill-ring-max 120)

(setq doom-font (font-spec :family "monospace" :size 14))

(setq doom-theme 'doom-one)

;; 300px high works best
(setq fancy-splash-image "~/Pictures/logo.png")

;; remove footer & 'loaded' information
(setq +doom-dashboard-functions
      '(doom-dashboard-widget-banner
        doom-dashboard-widget-shortmenu))

;; nil, relative, or t
(setq display-line-numbers-type t)

(setq +doom-dashboard-name "λ")

(setq frame-title-format
      `(:eval (if (buffer-modified-p) "*%b*" "%b") " - " projectile-project-name))

(map! "C-{" #'shrink-window-horizontally
      "C-}" #'enlarge-window-horizontally
      )

(global-set-key (kbd "<s-return>") 'ansi-term)

(global-set-key (kbd "C-c y") 'company-yasnippet)

(setq org-directory "~/org/")
(map! :map org-mode-map "C-q" #'org-toggle-checkbox)

(use-package flycheck
  :init (global-flycheck-mode))
