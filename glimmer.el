; -*- lexical-binding: t; -*-

;;; glimmer-mode.el --- Mode for editing Glimmer templates

;;;;;;;;;;;;;;;;
;;;; MIT License

;; Copyright (C) 2014 Aad Versteden
;;
;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.


;; (add-to-list 'treesit-language-source-alist
;;              '(glimmer "https://github.com/madnificent/tree-sitter-glimmer" "main" "src"))
;; (glimmer "file:///home/madnificent/code/tree-sitter/tree-sitter-glimmer/" "main" "src")
(push '(glimmer "https://github.com/madnificent/tree-sitter-glimmer" "main" "src")
      treesit-language-source-alist)

(unless (treesit-language-available-p 'glimmer)
  (treesit-install-language-grammar 'glimmer))

(setq glimmer--font-lock-settings
      (treesit-font-lock-rules
       :language 'glimmer
       :override t
       :feature 'keyword
       `((block_statement_start "{{#" @font-lock-builtin-face argument: (_)* @font-lock-variable-use-face path: (_)* @font-lock-builtin-face (_)* "}}" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((block_statement_end) @font-lock-builtin-face)
       :language 'glimmer
       :override t
       :feature 'comment
       `((comment_statement) @font-lock-comment-face)
       :language 'glimmer
       :override t
       :feature 'keyword
       `((element_node_start ("<" @font-lock-builtin-face (_)* ">" @font-lock-builtin-face)))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((glimmer_node_start ("<" @font-lock-builtin-face (_)* ">" @font-lock-builtin-face)))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((contextual_component_start ("<" @font-lock-builtin-face (_)* ">" @font-lock-builtin-face)))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((named_block_node_start ("<" @font-lock-builtin-face (_)* ">" @font-lock-builtin-face)))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((sub_expression ("(" @font-lock-builtin-face (_)* ")" @font-lock-builtin-face)))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((attribute_node "=" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((attribute_node (concat_statement) @font-lock-string-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((element_node_void "<" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((glimmer_node_void "<" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((contextual_component_void "<" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((element_node_void "/>" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((glimmer_node_void "/>" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((contextual_component_void "/>" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((element_node_end "</" @font-lock-builtin-face (_)* ">" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((glimmer_node_end "</" @font-lock-builtin-face (_)* ">" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((contextual_component_end "</" @font-lock-builtin-face (_)* ">" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((named_block_node_end "</" @font-lock-builtin-face (_)* ">" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((path_expression) @font-lock-variable-use-face)
       :language 'glimmer
       :override t
       :feature 'keyword
       `((mustache_statement "{{" @font-lock-builtin-face (_)* "}}" @font-lock-builtin-face))
       :language 'glimmer
       :override t
       :feature 'definition
       `((tag_name) @font-lock-constant-face)
       :language 'glimmer
       :override t
       :feature 'definition
       `((glimmer_tag_name) @font-lock-constant-face)
       :language 'glimmer
       :override t
       :feature 'definition
       `((contextual_component_name) @font-lock-variable-use-face)
       :language 'glimmer
       :override t
       :feature 'definition
       `((named_block_name) @font-lock-variable-name-face)
       :language 'glimmer
       :override t
       :feature 'property
       `((attribute_name) @font-lock-variable-name-face)
       :language 'glimmer
       :override t
       :feature 'property
       `((string_literal) @font-lock-string-face)
       :language 'glimmer
       :override t
       :feature 'property
       `((string_literal) @font-lock-string-face)
       :language 'glimmer
       :override t
       :feature 'function
       '((helper_invocation helper: (identifier) @font-lock-function-call-face))
       :language 'glimmer ; after helper_invocation so we can override it
       :override t
       :feature 'keyword
       "((mustache_statement \"{{\" (helper_invocation (identifier) @font-lock-builtin-face (#equal @font-lock-builtin-face \"else\") (identifier) (_)) \"}}\"))"
       :language 'glimmer
       :override t
       :feature 'keyword
       "((mustache_statement \"{{\" (helper_invocation (identifier) (identifier) @font-lock-builtin-face (#equal @font-lock-builtin-face \"if\") (_)) \"}}\"))"
       :language 'glimmer
       :override t
       :feature 'keyword
       "((mustache_statement \"{{\" (identifier) @font-lock-builtin-face (#equal @font-lock-builtin-face \"else\") \"}}\"))"
       :language 'glimmer
       :override t
       :feature 'function
       '(((boolean_literal) @font-lock-constant-face))
       :language 'glimmer
       :override t
       :feature 'keyword
       `((block_params "as" @font-lock-builtin-face "|" @font-lock-builtin-face ((identifier) @font-lock-variable-name-face)* "|" @font-lock-builtin-face))))

(setq glimmer--indent-rules
      `((glimmer
         ;; ((log-not-match "{{else}}") column-0 0)
         ((query "(mustache_statement \"{{\" (identifier) @else (#equal @else \"else\") \"}}\") @my_capture_for_indentation") parent-bol 0)
         ;; ((log-not-match "template") column-0 0)
         ((or (node-is "template") (parent-is "template")) column-0 0)
         ;; ((log-not-match "element_node_end or block_statement_end") column-0 0)
         ((or (node-is "element_node_end")
              (node-is "glimmer_node_end")
              (node-is "contextual_component_end")
              (node-is "named_block_node_end")
              (node-is "block_statement_end"))
          parent-bol 0)
         ((and (or (parent-is "element_node_start")
                   (parent-is "glimmer_node_start")
                   (parent-is "contextual_component_start")
                   (parent-is "named_block_node_start"))
               (node-is ">"))
          parent-bol 0)
         ;; ((log-not-match "parent is element_node or block_statement") column-0 0)
         ((or (parent-is "element_node")
              (parent-is "glimmer_node")
              (parent-is "contextual_component_node")
              (parent-is "named_block_node")
              (parent-is "block_statement"))
          parent-bol html-ts-mode-indent-offset)
         ;; ((log-not-match "parent is text_node in element_node") column-0 0)
         ((and (parent-is "text_node")
               (or (grand-parent-is "element_node")
                   (grand-parent-is "glimmer_node")
                   (grand-parent-is "contextual_component_node")
                   (grand-parent-is "named_block_node")
                   (grand-parent-is "block_statement")))
          grand-parent-bol html-ts-mode-indent-offset)
         ;; ((log-not-match "parent is text node") column-0 0)
         ((parent-is "text_node") parent-bol 0)
         ;; ((log-not-match "text_node as parent") column-0 0)
         )))

(setq glimmer--thing-settings
      `((html
         (sexp ,(regexp-opt '("element"
                              "text"
                              "attribute"
                              "value")))
         (sentence "tag")
         (text ,(regexp-opt '("comment" "text"))))
        (glimmer
         (sexp ,(regexp-opt '("comment_statement"
                              "element_node"
                              "glimmer_node"
                              "named_block_node"
                              "contextual_component_node"
                              "attribute_node"
                              "mustache_statement"
                              "block_statement"
                              "identifier")))
         (text ,(regexp-opt '("text_node" "comment_statement"))))))

(define-derived-mode glimmer-mode html-mode "GLMR"
  "Major mode for editing glimmer handlebars files with tree-sitter."

  ;; mostly taken from html-ts-mode because it seems to set the html parser agressively

  (unless (boundp 'html-ts-mode-indent-offset)
    (setq html-ts-mode-indent-offset 2))

  (unless (treesit-ready-p 'glimmer)
    (error "Tree-sitter for glimmer isn't available"))

  (treesit-parser-create 'glimmer)

  (push (cons 'log-not-match
              (lambda (prefix)
                (lambda (node parent &rest args)
                  (message "TRYING [%S] %S %S" prefix node parent)
                  nil)))
        treesit-simple-indent-presets)

  (push (cons 'grand-parent-is
              (lambda (type)
                (lambda (_n parent &rest _)
                  (and
                   (treesit-node-parent parent)
                   (treesit-node-type (treesit-node-parent parent))
                   (string-match-p
                    type (treesit-node-type (treesit-node-parent parent)))))))
        treesit-simple-indent-presets)

  (push (cons 'grand-parent-bol
              (lambda (_n parent &rest _)
                (save-excursion
                  (goto-char (treesit-node-start (treesit-node-parent parent)))
                  (back-to-indentation)
                  (point))))
        treesit-simple-indent-presets)

  ;; Indent.
  (setq-local treesit-simple-indent-rules glimmer--indent-rules)
  ;;html-ts-mode--indent-rules

  ;; Navigation.
  (setq-local treesit-defun-type-regexp "element")

  (setq-local treesit-defun-name-function #'html-ts-mode--defun-name)

  (setq-local treesit-thing-settings
              `((html
                 (sexp ,(regexp-opt '("element"
                                      "text"
                                      "attribute"
                                      "value")))
                 (sentence "tag")
                 (text ,(regexp-opt '("comment" "text"))))
                (glimmer
                 (sexp ,(regexp-opt '("comment_statement"
                                      "element_node"
                                      "glimmer_node"
                                      "named_block_node"
                                      "contextual_component_node"
                                      "attribute_node"
                                      "mustache_statement"
                                      "block_statement"
                                      "identifier")))
                 (text ,(regexp-opt '("text_node" "comment_statement"))))))

  ;; Font-lock.
  (setq-local treesit-font-lock-settings glimmer--font-lock-settings)

  (setq-local treesit-font-lock-feature-list
              '((comment keyword definition)
                (keyword string)
                (assignment constant number)
                (property function)))

  ;; Imenu.
  (setq-local treesit-simple-imenu-settings
              '(("Element" "\\`tag_name\\'" nil nil)))

  ;; Outline minor mode.
  (setq-local treesit-outline-predicate '(or "\\`block_statement\\'" "\\`element_node\\'"))
  ;; `html-ts-mode` indicates the following and it holds for
  ;; glimmer-mode too:
  ;; `glimmer-mode' inherits from `html-mode' that sets
  ;; regexp-based outline variables.  So need to restore
  ;; the default values of outline variables to be able
  ;; to use `treesit-outline-predicate' above.
  (kill-local-variable 'outline-regexp)
  (kill-local-variable 'outline-heading-end-regexp)
  (kill-local-variable 'outline-level)

  (treesit-major-mode-setup))

(defun glimmer ()
  (glimmer-mode))

;; (add-to-list 'auto-mode-alist '("\\.hbs\\'" . glimmer-mode))

(provide 'glimmer)
;;; glimmer-mode.el ends here
