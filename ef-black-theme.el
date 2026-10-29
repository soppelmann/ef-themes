;;; ef-black-theme.el --- Legible dark theme with vibrant Monokai colors -*- lexical-binding:t -*-

;; Copyright (C) 2022-2026  Free Software Foundation, Inc.

;; Author: Protesilaos <info@protesilaos.com>
;; Maintainer: Protesilaos <info@protesilaos.com>
;; URL: https://github.com/protesilaos/ef-themes
;; Keywords: faces, theme, accessibility

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; The `ef-themes' are a collection of light and dark themes for GNU
;; Emacs whose goal is to provide colorful ("pretty") yet legible
;; options for users who want something with a bit more flair than the
;; `modus-themes' (also designed by me).

;;; Code:



(require 'ef-themes)

(defconst ef-black-palette-partial
  '((cursor "#f2fffc")
    (bg-main "#000000")
    (bg-dim "#131313")
    (bg-alt "#161b1e")
    (fg-main "#f2fffc")
    (fg-dim "#6b7678")
    (fg-alt "#96cbfe")
    (bg-active "#3a4449")
    (bg-inactive "#000000")
    (border "#545f62")

    (red "#ff6d7e")
    (red-warmer "#ff6d7e")
    (red-cooler "#ff6d7e")
    (red-faint "#c6c6c6")
    (green "#a2e57b")
    (green-warmer "#a2e57b")
    (green-cooler "#a2e57b")
    (green-faint "#8b9798")
    (yellow "#FFFFB6")
    (yellow-warmer "#FFD2A7")
    (yellow-cooler "#FFFFB6")
    (yellow-faint "#b4c1c0")
    (blue "#96cbfe")
    (blue-warmer "#96cbfe")
    (blue-cooler "#96cbfe")
    (blue-faint "#8b9798")
    (magenta "#c6c5fe")
    (magenta-warmer "#c6c5fe")
    (magenta-cooler "#96cbfe")
    (magenta-faint "#8b9798")
    (cyan "#96cbfe")
    (cyan-warmer "#96cbfe")
    (cyan-cooler "#96cbfe")
    (cyan-faint "#8b9798")

    (bg-red-intense "#2e363b")
    (bg-green-intense "#2e363b")
    (bg-yellow-intense "#2e363b")
    (bg-blue-intense "#2e363b")
    (bg-magenta-intense "#2e363b")
    (bg-cyan-intense "#2e363b")

    (bg-red-subtle "#161b1e")
    (bg-green-subtle "#161b1e")
    (bg-yellow-subtle "#161b1e")
    (bg-blue-subtle "#161b1e")
    (bg-magenta-subtle "#161b1e")
    (bg-cyan-subtle "#161b1e")

    (bg-added "#2e363b")
    (bg-added-faint "#161b1e")
    (bg-added-refine "#3a4449")
    (fg-added "#a2e57b")

    (bg-changed "#2e363b")
    (bg-changed-faint "#161b1e")
    (bg-changed-refine "#3a4449")
    (fg-changed "#FFFFB6")

    (bg-removed "#2e363b")
    (bg-removed-faint "#161b1e")
    (bg-removed-refine "#3a4449")
    (fg-removed "#ff6d7e")

    (bg-mode-line-active "#161b1e")
    (fg-mode-line-active "#f2fffc")
    (bg-completion "#2e363b")
    (bg-popup "#0c0c0c")
    (bg-hover "#3a4449")
    (bg-hover-secondary "#2e363b")
    (bg-hl-line "#161b1e")
    (bg-paren-match "#3a4449")
    (bg-err "#2e363b") ; check with err
    (bg-warning "#2e363b") ; check with warning
    (bg-info "#2e363b") ; check with info
    (bg-region "#2e363b")))

(defconst ef-black-palette-mappings-partial
  '((err red)
    (warning yellow-warmer)
    (info green)

    (fg-link cyan)
    (fg-link-visited magenta)
    (name yellow-warmer)
    (keybind cyan)
    (identifier magenta)
    (fg-prompt green)

    (builtin cyan)
    (comment magenta-faint)
    (constant magenta)
    (fnname yellow-warmer)
    (fnname-call yellow-warmer)
    (keyword cyan)
    (preprocessor cyan)
    (docstring cyan-faint)
    (string green)
    (type yellow)
    (variable magenta)
    (variable-use magenta)
    (rx-backslash green) ; compare with `string'
    (rx-construct red)

    (accent-0 cyan)
    (accent-1 magenta)
    (accent-2 green)
    (accent-3 red)

    (date-common green)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (fg-prose-code magenta)
    (prose-done green)
    (fg-prose-macro green)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag yellow-faint)
    (prose-todo red)
    (fg-prose-verbatim cyan)

    (mail-cite-0 cyan)
    (mail-cite-1 magenta)
    (mail-cite-2 green)
    (mail-cite-3 yellow)
    (mail-part magenta-faint)
    (mail-recipient yellow-warmer)
    (mail-subject cyan)
    (mail-other magenta)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 red)
    (rainbow-1 cyan)
    (rainbow-2 magenta)
    (rainbow-3 yellow)
    (rainbow-4 green)
    (rainbow-5 blue)
    (rainbow-6 yellow-warmer)
    (rainbow-7 green-warmer)
    (rainbow-8 cyan-warmer)))

(defcustom ef-black-palette-overrides nil
  "Overrides for `ef-black-palette'.

Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across all of the Ef themes,
refer to `ef-themes-common-palette-overrides'.

To preview the palette entries, use `ef-themes-preview-colors' or
`ef-themes-preview-colors-current' (read the documentation for
further details)."
  :group 'ef-themes
  :package-version '(ef-themes . "1.0.0")
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(ef-themes) Palette overrides"))

(defconst ef-black-palette
  (modus-themes-generate-palette
   ef-black-palette-partial
   nil
   nil
   (append ef-black-palette-mappings-partial ef-themes-palette-common)))

;;;###theme-autoload
(modus-themes-theme
 'ef-black
 'ef-themes
 "Legible dark theme with vibrant Monokai colors."
 'dark
 'ef-black-palette
 nil
 'ef-black-palette-overrides)

(provide 'ef-black-theme)

;;; ef-black-theme.el ends here
