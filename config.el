;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "João Gomes de Almeida"
      user-mail-address "jgalmeida@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;;(setq doom-font (font-spec :family "Menlo" :size 15 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "Menlo" :size 15))

(setq
doom-font (font-spec :family "Iosevka SS04" :size 16)
doom-big-font (font-spec :family "Iosevka SS04" :size 36)
doom-variable-pitch-font (font-spec :family "Iosevka SS04" :size 16)
)

(setq-default line-spacing 0.2)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-vibrant)
;;
;; Atalhos para aumentar ou diminuir o zoom do buffer

(map! :n "C-="    #'doom/reset-font-size
      ;; Buffer-local font resizing
      :n "C-+"    #'text-scale-increase
      :n "C--"    #'text-scale-decrease)

;; Double-spaces after periods is morally wrong.
   sentence-end-double-space nil
;;UTF-8 como regra por defeito
(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")

;; Pasta do Org-Roam
(setq org-roam-directory (concat org-directory "roam/"))

;; configuração dos buffers org

(defun jga/org-mode-visual()
  (setq visual-fill-column-width 80
        visual-fill-column-center-text t
        display-fill-column-indicator nil
        display-line-numbers nil)
  (visual-fill-column-mode 1))

(add-hook! 'org-mode-hook #'jga/org-mode-visual)

;; Introduz timestamp quando tarefa é marcada como concluída.
(setq org-log-done 'time)

;; Add KOMA-scripts classes to org export
(require 'ox-latex)
 (add-to-list 'org-latex-classes
              '("koma-article" "\\documentclass{scrartcl}"
                ("\\section{%s}" . "\\section*{%s}")
                ("\\subsection{%s}" . "\\subsection*{%s}")
                ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                ("\\paragraph{%s}" . "\\paragraph*{%s}")
                ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

 (add-to-list 'org-latex-classes
               '("koma-report" "\\documentclass{scrreprt}"
                 ("\\part{%s}" . "\\part*{%s}")
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))

 (add-to-list 'org-latex-classes
               '("koma-book" "\\documentclass[11pt]{scrbook}"
                 ("\\part{%s}" . "\\part*{%s}")
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Mudar tamanho da janela Emacs quando inicia.
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;;(setq initial-frame-alist '((top . 1) (left . 1) (width . 143) (height . 55)))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;
;; Configuração Markdown
;; Teste de configuração
(defun jga/md-mode-visual()
  (setq visual-fill-column-width 80
        visual-fill-column-center-text t
        display-fill-column-indicator nil
        markdown-header-scaling t
        display-line-numbers nil)
  (visual-fill-column-mode 1))

(add-hook! 'markdown-mode-hook #'jga/md-mode-visual)
;;

(custom-set-faces!
  '(markdown-header-face-1 :foreground "#9f7efe" :height 1.25 :weight extra-bold :inherit markdown-header-face)
  '(markdown-header-face-2 :foreground "#0098dd" :height 1.15 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-3 :foreground "#50a14f" :height 1.08 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-4 :foreground "#ff6480" :height 1.00 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-5 :foreground "#ff6480" :height 0.90 :weight bold       :inherit markdown-header-face)
  '(markdown-header-face-6 :foreground "#ff6480" :height 0.75 :weight extra-bold :inherit markdown-header-face))


;;
;;
;; Configuração das PDF-Tools.
;;

;; Configurar org-ref
;;
(use-package! org-ref
  :after org
  :config
  (setq!
     org-ref-completion-library 'org-ref-ivy-cite
     org-ref-bibliography-notes "~/Dropbox/Bibliografia/notes.org"
     org-ref-default-bibliography '("~/Dropbox/Bibliografia/BetterBibLatex/bib.bib")
     org-ref-pdf-directory "~/Dropbox/Bibliografia/Biblioteca/"
     reftex-default-bibliography '("~/Dropbox/Bibliografia/BetterBibLatex/bib.bib")
  ))

;;Configura ivy-bibtex
(use-package! ivy-bibtex
  :after org
  :config
  (setq
   bibtex-completion-bibliography '("~/Dropbox/Bibliografia/BetterBibLatex/bib.bib")
   bibtex-completion-pdf-field "File"
   ivy-bibtex-default-action 'ivy-bibtex-insert-citation
   bibtex-completion-format-citation-functions
    '((org-mode      . bibtex-completion-format-citation-pandoc-citeproc)
      (latex-mode    . bibtex-completion-format-citation-cite)
      (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
      (default       . bibtex-completion-format-citation-pandoc-citeproc)
     )
  )
)

;;Configuração Org-Roam-Bibtex - não está a funcionar perfeitamente
;;
(use-package! org-roam-bibtex
  :after org-roam
  :config
  (setq orb-preformat-keywords
        '("citekey" "title" "url" "author-or-editor" "keywords" "file")
        orb-process-file-keyword t
        orb-file-field-extensions '("pdf"))

  (setq orb-templates
        '(("r" "ref" plain(function org-roam-capture--get-point)
           ""
           :file-name "${citekey}"
           :head "#+TITLE: ${citekey}: ${title}\n#+ROAM_KEY: ${ref}
- tags ::
- keywords :: ${keywords}

* Notes
:PROPERTIES:
:Custom_ID: ${citekey}
:URL: ${url}
:AUTHOR: ${author-or-editor}
:NOTER_DOCUMENT: ${file}
:NOTER_PAGE:
:END:"
           :unnarrowed t))))

(after! org-roam
  (org-roam-bibtex-mode))

(use-package! pdf-tools
  :config
  (pdf-tools-install)
  (setq-default pdf-view-display-size 'fit-width)
  :custom
  (pdf-annot-activate-created-annotations t "automatically annotate highlights")
  )

(use-package pdf-view
  :hook (pdf-tools-enabled . pdf-view-midnight-minor-mode) ;; define a utilização do "dark mode"
  :hook (pdf-tools-enabled . hide-mode-line-mode)
  :config
  (setq pdf-view-midnight-colors '("#ABB2BF" . "#282C35"))) ;; parece definir as cores do "dark mode". Em teste.

;; Configuração Org-Noter
;;
;;
(after! org-noter
    (setq
          org-noter-notes-search-path '("~/Dropbox/org/roam") ;; quando conseguir por o org-roam-bibtex a funcionar mudar para ~/Dropbox/org/roam
          org-noter-hide-other nil
          org-noter-separate-notes-from-heading t
          org-noter-doc-split-fraction '(0.7 . 0.7)
          org-noter-always-create-frame nil)
    (map!
     :map org-noter-doc-mode-map
     :leader
     :desc "Insert note"
     "m i" #'org-noter-insert-note
     :desc "Insert precise note"
     "m p" #'org-noter-insert-precise-note
     :desc "Go to previous note"
     "m k" #'org-noter-sync-prev-note
     :desc "Go to next note"
     "m j" #'org-noter-sync-next-note
     :desc "Create skeleton"
     "m s" #'org-noter-create-skeleton
     :desc "Kill session"
     "m q" #'org-noter-kill-session
     )
  )


;;  :hook (org-roam-mode . org-roam-bibtex-mode)) Deixou de ser necessário.
;;
;; Configuração para centrar texto e usar apenas 80 caracteres, package olivetti
;;
;;(use-package! olivetti
;;  :custom
;;  (olivetti-body-width 80)
;;  )
;; (add-hook 'text-mode-hook 'turn-on-olivetti-mode)

;; Tentar configurar autocomplete citações estilo pandoc, com company-bibtex
;; (use-package! company-bibtex
;;  :config
;;  (add-to-list 'company-backends 'company-bibtex)
;;  (setq company-bibtex-bibliography '("~/Dropbox/Bibliografia/BetterBibLatex/bib.bib"))
;; )

;;



; Onde está o ficheiro bib
;; (setq bibtex-completion-bibliography '("~/Dropbox/Bibliografia/BetterBibLatex/bib.bib"))

;; Local onde estão os pdfs. Funciona por causa do zotero. Se não funcionar, colocar caminho completo.
;; (setq bibtex-completion-pdf-field "File")

;; Definir ação predefinida. Inserir key
;; (setq ivy-bibtex-default-action 'ivy-bibtex-insert-citation)

;; Inserir citações no estilo Pandoc nos documentos org e markdown
;; (setq bibtex-completion-format-citation-functions
;;   '((org-mode      . bibtex-completion-format-citation-pandoc-citeproc)
;;    (latex-mode    . bibtex-completion-format-citation-cite)
;;    (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
;;    (default       . bibtex-completion-format-citation-pandoc-citeproc)))
