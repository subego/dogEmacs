;;; -*- lexical-binding: t -*-

(straight-use-package 'meow)



(defun meow-setup ()
  ;; Programmer Dvorak layout on ansi keyboard
  (setq meow-cheatsheet-physical-layout meow-cheatsheet-physical-layout-ansi
        meow-cheatsheet-layout meow-cheatsheet-layout-dvp)
  ;; it's not a good idea to have a complex leader keymap
  ;; here we create bindings for necessary, high frequency commands
  (meow-leader-define-key
   ;; reverse command query
   ;; cheatsheet
   '("?" . meow-cheatsheet)
   ;; high frequency keybindings
   '("e" . "C-x C-e")
   '(")" . "C-)")
   '("}" . "C-}")
   '("." . "M-.")
   '("," . "M-,")
   ;; window management
   '("w" . other-window)
   '("W" . window-swap-states)
   '("o" . delete-other-windows)
   '("s" . split-window-right)
   '("-" . split-window-below)
   ;; high frequency commands
   '("$" . +change-theme)
   '("&" . +toggle-wide-tall-font)
   '(";" . comment-dwim)
   '("k" . kill-this-buffer)
   '("d" . dired)
   '("b" . switch-to-buffer)
   '("r" . rg-project)
   '("f" . find-file)
   '("i" . imenu)
   '("a" . execute-extended-command)
   '("=" . "C-c ^")
   '("p" . project-find-file)
   '("t" . ibuffer)
   '("j" . execute-extended-command)
   '("l" . "C-x p p")
   '("y" . "C-x g")
   '("n" . "C-x M-n")
   ;; toggles
   '("L" . display-line-numbers-mode)
   '("S" . smartparens-strict-mode)
   '("T" . telega)
   '("P" . pass)
   '("A" . org-agenda)
   '("D" . docker)
   '("E" . elfeed)
   '("F" . flymake-mode)
   '("\\" . dired-sidebar-toggle-sidebar))
  (meow-motion-overwrite-define-key
   '("'" . repeat))
  (meow-normal-define-key
   '("?" . meow-cheatsheet)
   '("*" . meow-expand-0)
   '("=" . meow-expand-9)
   '("!" . meow-expand-8)
   '("[" . meow-expand-7)
   '("]" . meow-expand-6)
   '("{" . meow-expand-5)
   '("+" . meow-expand-4)
   '("}" . meow-expand-3)
   '(")" . meow-expand-2)
   '("(" . meow-expand-1)
   '("1" . digit-argument)
   '("2" . digit-argument)
   '("3" . digit-argument)
   '("4" . digit-argument)
   '("5" . digit-argument)
   '("6" . digit-argument)
   '("7" . digit-argument)
   '("8" . digit-argument)
   '("9" . digit-argument)
   '("0" . digit-argument)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("<" . meow-beginning-of-thing)
   '(">" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-line)
   '("E" . meow-goto-line)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-join)
   '("k" . meow-kill)
   '("l" . meow-till)
   '("m" . meow-mark-word)
   '("M" . meow-mark-symbol)
   '("n" . meow-next)
   '("N" . meow-next-expand)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-prev)
   '("P" . meow-prev-expand)
   '("q" . meow-quit)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-search)
   '("t" . meow-right)
   '("T" . meow-right-expand)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-next-word)
   '("W" . meow-next-symbol)
   '("x" . meow-save)
   '("X" . meow-sync-grab)
   '("y" . meow-yank)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("<escape>" . mode-line-other-buffer)))

(setq
 meow-cursor-type-keypad 'box
 meow-cursor-type-insert '(bar . 3)
 meow-esc-delay 0.001
 meow-keypad-describe-delay 0.5
 meow-select-on-change t
 meow-replace-state-name-list '((normal . "N")
                                (motion . "M")
                                (keypad . "K")
                                (insert . "I")
                                (bmacro . "B")))

(require 'meow)

(meow-global-mode 1)

(with-eval-after-load "meow"
  ;; make Meow usable in TUI Emacs
  (add-to-list 'meow-mode-state-list '(inf-iex-mode . normal))
  (add-to-list 'meow-mode-state-list '(erc-mode . normal))
  (setq meow-grab-fill-commands nil)
  ;; use << and >> to select to bol/eol
  (add-to-list 'meow-char-thing-table '(?> . line))
  (add-to-list 'meow-char-thing-table '(?< . line))
  ;; define our command layout
  (meow-setup))

(provide 'init-modal)
