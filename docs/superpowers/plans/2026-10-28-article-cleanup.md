# Article Cleanup Implementation Plan

> **For agentic workers:** Use superpowers:executing-plans to implement this approved cleanup in the current session.

**Goal:** Apply the 33 decisions in ARTICLE-REVIEW.md, deleting 26 articles and their unused attachments.

**Architecture:** Keep the six retained posts and the deferred Chirpy post byte-for-byte unchanged. Remove assets owned exclusively by deleted posts, update README navigation, and exclude the approval document from Jekyll output.

**Tech Stack:** Jekyll, Markdown, Git, Python for one-off inventory checks.

**Spec:** ARTICLE-REVIEW.md and the user's explicit approval to execute cleanup while preserving Git history.

## Global Constraints

- Preserve all seven retained/deferred article files and existing UI styles.
- Preserve Git history; no history rewriting, commits, or pushes are part of this cleanup.
- Treat user decisions and notes as authoritative; keep the approval document intact.

## Review Focus

- Shared assets: check references in retained posts, tabs, templates, configuration, and README before deleting.
- Relative media paths: resolve against each post's media_subpath.
- Documentation examples: distinguish code snippets from rendered image links.
- Removed routes: update README and check the generated site for links to removed posts.
- Approval material: ARTICLE-REVIEW.md must not be copied to the published site.

## Task 1: Inventory and cleanup

- [x] Record retained-file hashes and exact approved deletion paths in a temporary manifest.
- [x] Inventory and check exclusive attachment directories; preserve referenced/shared resources.
- [x] Delete approved articles and exclusive attachments.
- [x] Update README article links and exclude ARTICLE-REVIEW.md in _config.yml.

## Task 2: Verification

- [x] Verify all 26 approved articles are absent and all seven retained article hashes match.
- [x] Build Jekyll into /tmp/opencode with production settings.
- [x] Run the existing HTMLProofer check against the generated site and inspect removed routes/assets.
- [x] Review git diff --check, change scope, and the resulting asset size; report results.

## Execution record

- Deleted exactly 26 approved posts and 133 exclusive attachments.
- Assets: 14,302,200 bytes before; 3,401,344 bytes after; 10,900,856 bytes removed.
- All seven retained/deferred article SHA256 hashes match the pre-cleanup inventory.
- Production Jekyll build passed; HTMLProofer passed on 34 HTML files, checking 176 internal links.
- Generated output has exactly seven retained post routes and seven search URL entries; no HTML links to deleted posts, deleted attachments, approval document, or plan docs are published.
- Independent source review found no actionable issues.
- Ruling: Leave the deleted-image path inside the deferred Chirpy article's Python example unchanged. It is example code, not a rendered asset reference, and the user requested that article remain untouched.
- Existing issue, deferred: Chirpy 7.3.0's search.json template interpolates descriptions without JSON escaping. Retained articles containing LaTeX produce invalid JSON. Rebuilding the committed pre-cleanup source reproduces the same failure; this needs a separate search-template fix, not edits to the retained articles.
