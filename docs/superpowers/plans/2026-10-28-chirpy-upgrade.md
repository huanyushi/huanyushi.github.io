# Chirpy 7.6.0 Upgrade Implementation Plan

> **For agentic workers:** Use executing-plans for inline execution. User requested direct execution.

**Goal:** Upgrade Chirpy to 7.6.0 and MathJax to 4.1.3 with working search and existing customizations.

**Architecture:** Use the official theme search implementation, merge upstream layout changes, migrate custom dark-mode selectors to data-bs-theme, and pin the CDN MathJax version using theme data overrides.

**Tech Stack:** Jekyll, Liquid, SCSS, MathJax, browser checks.

**Spec:** User's upgrade request and direct-execution approval in this conversation; use MathJax's new default font and preserve physics/macros.

## Global Constraints

- Preserve seven remaining article files and previously approved cleanup.
- Preserve background animation, sidebar, footer statistics, math macros and physics extension.
- Keep changes uncommitted; preserve Git history.

## Review Focus

- New data-bs-theme attribute must drive custom light/dark styles.
- Search must parse LaTeX and index full article content.
- MathJax physics and custom macros must typeset without error.
- CDN/font loading and mobile display must work in a real browser.
- Local layout overrides must retain upstream behavior and custom elements.

## Tasks

- [x] Compare upstream layout, footer, configuration and resource loading; record baseline article hashes and search failure.
- [x] Update Gemfile, merge default layout changes, migrate custom CSS selectors, pin MathJax 4.1.3.
- [x] Install dependencies, build production site, validate search JSON/full text and internal links.
- [x] Check browser math rendering, search, desktop/mobile and light/dark states; review diff and retained article hashes.
- [x] Record results and remaining limitations.

## Execution notes

- Ruling: Work in the current workspace to preserve the already-approved, uncommitted content cleanup; user requested direct handling of the existing site.
- Upstream footer differs only by the intentional statistics include, so no footer edit is needed. New configuration fields are optional; existing settings remain compatible.
- Theme CDN data merges recursively: a MathJax-only override retains upstream Font Awesome, search, TOC, and other libraries, verified in generated HTML.
- Added JSON parsing to the existing deployment test step; HTMLProofer alone does not validate search data.
- CI Ruby 3.2 satisfies Chirpy 7.6.0's Ruby requirement (~> 3.1).
- Search JSON now parses and contains seven full-text entries (5,767–30,569 characters), compared with the reproduced malformed 7.3.0 output.
- All seven retained article hashes still match the pre-cleanup manifest.
- Independent review found no actionable upgrade compatibility issues.
- Browser testing found MathJax 4's default displayOverflow='overflow' expands mobile pages for numbered long equations. Ruling: use native displayOverflow='scroll' to preserve readable equations without widening the page. Do not clip or shrink formulas with CSS.
- Browser harness adjustments: the new mode toggle opens a three-option menu; choose the dark option explicitly. Allow service workers when exercising the enabled PWA (blocking them makes upstream notification code error).

## Final verification

- Production build passed after the MathJax overflow adjustment.
- HTMLProofer: 34 HTML files, 176 internal links passed with the existing CI HTTP-link exclusions.
- Chromium: 1,005 rendered math containers across all seven posts, MathJax 4.1.3, no detected math errors. Extra physics/custom-macro fixture passed.
- Browser search for Haldane returned the AKLT article; dark-mode selection persisted after reload.
- AKLT desktop (1440px) and mobile (390px), light/dark: document width equals viewport width after enabling native formula scrolling. Screenshots visually inspected.
- Browser run had no uncaught JavaScript errors or unexpected failed resource requests. Analytics, statistics and Giscus network calls were blocked to avoid test traffic; their live service behavior was not verified.
- Search JSON parser and git diff --check passed. No commits or pushes made.
- Browser evidence: /tmp/opencode/blog-ui-audit/upgrade-results.json and upgrade-*.png.
