;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Samriddha Chattopadhyay"
      user-mail-address "200020040@iitdh.ac.in")

;; General Settings
(setq doom-theme 'atom-one-dark)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")
(setq fancy-splash-image "~/Downloads/StartupImage.png")
(setq +doom-dashboard-menu-sections (cl-subseq +doom-dashboard-menu-sections 0 4))
(setq doom-font (font-spec :family "Fira Code Medium" :size 15)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 17 :weight 'bold))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil :slant 'italic)
(add-hook! 'org-mode-hook #'mixed-pitch-mode)
(add-hook! 'org-mode-hook #'solaire-mode)
(setq mixed-pitch-variable-pitch-cursor nil)

;; (setq initial-frame-alist '((top . 1) (left . 1) (width . 212) (height . 60)))

;; Ligature fixes (dunno what this does, but the ligature looks better with these)
(plist-put! +ligatures-extra-symbols
  :and           nil
  :or            nil
  :for           nil
  :not           nil
  :true          nil
  :false         nil
  :int           nil
  :float         nil
  :str           nil
  :bool          nil
  :list          nil
)
(let ((ligatures-to-disable '(:true :false :int :float :str :bool :list :and :or :for :not)))
  (dolist (sym ligatures-to-disable)
    (plist-put! +ligatures-extra-symbols sym nil)))

;; Tab Support (they look kinda cool xD)
(after! centaur-tabs (centaur-tabs-group-by-projectile-project))
(after! centaur-tabs
  :ensure t
  :config
   (setq centaur-tabs-style "bar"
         centaur-tabs-set-bar 'over
         centaur-tabs-height 32
         centaur-tabs-set-icons t
         centaur-tabs-gray-out-icons 'buffer)
   (centaur-tabs-headline-match)
   (centaur-tabs-mode t))
(defhydra doom-window-resize-hydra (:hint nil)
  "
             _k_ increase height
_h_ decrease width    _l_ increase width
             _j_ decrease height
"
  ("h" evil-window-decrease-width)
  ("j" evil-window-increase-height)
  ("k" evil-window-decrease-height)
  ("l" evil-window-increase-width)

  ("q" nil))
(map! :leader
    (:prefix "w"
      :desc "Hydra resize" :n "SPC" #'doom-window-resize-hydra/body))

;; accept completion from copilot and fallback to company
;; (use-package! copilot
;;   :hook (prog-mode . copilot-mode)
;;   :bind (("C-TAB" . 'copilot-accept-completion-by-word)
;;          ("C-<tab>" . 'copilot-accept-completion-by-word)
;;          :map copilot-completion-map
;;          ("<tab>" . 'copilot-accept-completion)
;;          ("TAB" . 'copilot-accept-completion)
;;          ("<escape>" . 'copilot-clear-overlay)))

;; Smugde let's me control spotify from within doom emacs
;; However, this requires a premium subscription, so I'd keep the settings here for when I actually buy one
;; Smudge Settings
;; (setq smudge-oauth2-client-secret "<spotify-app-client-secret>")
;; (setq smudge-oauth2-client-id "<spotify-app-client-id>")
;; (define-key smudge-mode-map (kbd "C-c .") 'smudge-command-map)

;; Let's me comment on anything and everything
(evil-commentary-mode)

;; Turns org documents into masterpieces which in turn turns me on.
(org-bullets-mode 1)

;; Blinks the cursor and looks cool
(beacon-mode 1)

;; v-term custom binds
(map! "C-`" #'+vterm/toggle)

;; File tree, comments and fuzzy-finder custom binds
(map! :leader
      :desc "Toggles file tree"
      "b t" #'+treemacs/toggle)         ; File tree bind
(map! "C-/" #'evil-commentary)         ; File tree bind
(map! "C-a" #'affe-find)         ; File tree bind

;; Clippy configuration
(map! :leader
      (:prefix ("c h" . "Help info from Clippy")
       :desc "Clippy describes function under point" "f" #'clippy-describe-function
       :desc "Clippy describes variable under point" "v" #'clippy-describe-variable))

;; Org mode settings
(map! :leader
      :desc "Org babel tangle" "m B" #'org-babel-tangle)
(after! org
  (setq org-directory "~/nc/Org/"
        org-agenda-files '("~/nc/Org/agenda.org")
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-superstar-headline-bullets-list '("◉" "●" "○" "◆" "●" "○" "◆")
        org-superstar-itembullet-alist '((?+ . ?➤) (?- . ?✦)) ; changes +/- symbols in item lists
        org-log-done 'time
        org-hide-emphasis-markers t
        ;; ex. of org-link-abbrev-alist in action
        ;; [[arch-wiki:Name_of_Page][Description]]
        org-link-abbrev-alist    ; This overwrites the default Doom org-link-abbrev-list
          '(("google" . "http://www.google.com/search?q=")
            ("arch-wiki" . "https://wiki.archlinux.org/index.php/")
            ("ddg" . "https://duckduckgo.com/?q=")
            ("wiki" . "https://en.wikipedia.org/wiki/"))
        org-table-convert-region-max-lines 20000
        org-todo-keywords        ; This overwrites the default Doom org-todo-keywords
          '((sequence
             "TODO(t)"           ; A task that is ready to be tackled
             "BLOG(b)"           ; Blog writing assignments
             "GYM(g)"            ; Things to accomplish at the gym
             "PROJ(p)"           ; A project that contains other tasks
             "VIDEO(v)"          ; Video assignments
             "WAIT(w)"           ; Something is holding up this task
             "|"                 ; The pipe necessary to separate "active" states and "inactive" states
             "DONE(d)"           ; Task has been completed
             "CANCELLED(c)" )))) ; Task has been cancelled

;; Org headings
(defun org-colors-doom-one ()
  "Enable Doom One colors for Org headers."
  (interactive)
  (dolist
      (face
       '((org-level-1 1.7 "#51afef" ultra-bold)
         (org-level-2 1.6 "#c678dd" extra-bold)
         (org-level-3 1.5 "#98be65" bold)
         (org-level-4 1.4 "#da8548" semi-bold)
         (org-level-5 1.3 "#5699af" normal)
         (org-level-6 1.2 "#a9a1e1" normal)
         (org-level-7 1.1 "#46d9ff" normal)
         (org-level-8 1.0 "#ff6c6b" normal)))
    (set-face-attribute (nth 0 face) nil :font doom-variable-pitch-font :weight (nth 3 face) :height (nth 1 face) :foreground (nth 2 face)))
    (set-face-attribute 'org-table nil :font doom-font :weight 'normal :height 1.0 :foreground "#bfafdf"))
(org-colors-doom-one)

;; EWW Configuration
(setq browse-url-browser-function 'eww-browse-url)
(map! :leader
      :desc "Search web for text between BEG/END"
      "s w" #'eww-search-words
      (:prefix ("e" . "evaluate/ERC/EWW")
       :desc "Eww web browser" "w" #'eww
       :desc "Eww reload page" "R" #'eww-reload))

;; Modeline Configuration
;; (after! doom-modeline
;;   (setq doom-modeline-time t))
