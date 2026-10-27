# Notes

Scope: extraction, organization and indexing only. No identifier renaming, deobfuscation, SWF modification or gameplay patching.

The main export contains 413 AS3 files with package structure preserved. Embedded scripts are separated by resource ID under scripts/embedded/. Exported assets are representations, not a buildable original Flash project. Raw embedded SWFs and the asset ZIP remain available for future inspection.

FFDec uses a writable project-local user.home; headless mode resolves the unavailable X11 display. Initial frame failure and successful retry logs are retained. Existing exports and installer were preserved.
