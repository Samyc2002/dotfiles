;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq user-full-name "Samriddha Chattopadhyay"
      user-mail-address "200020040@iitdh.ac.in")

;; General Settings
(setq doom-theme 'doom-one)
(setq display-line-numbers-type 'relative)
(setq org-directory "~/org/")
(setq fancy-splash-image "~/Downloads/StartupImage.png")
(setq +doom-dashboard-menu-sections (cl-subseq +doom-dashboard-menu-sections 0 4))
(setq doom-font (font-spec :family "Fira Code Medium" :size 14)
      doom-variable-pitch-font (font-spec :family "Alegreya" :size 16))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  'font-lock-comment-face :slant italic
  'font-lock-keyword-face :slant italic)
(add-hook! 'org-mode-hook #'mixed-pitch-mode)
(add-hook! 'org-mode-hook #'solaire-mode)
(setq mixed-pitch-variable-pitch-cursor nil)

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

(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿")
)

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
(org-bullets-mode)

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
