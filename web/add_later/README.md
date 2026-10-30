# Documents to add during the RAG video

These three Markdown files are **not** in `docs/`, so the demonstration script does not index them initially.

1. First ask: `python3 rag.py ask "What is the Cambridge office printer called?"`
2. The assistant should say it cannot find the answer in the support documents (generative output is not guaranteed).
3. Add the new printer document: `cp add_later/printers.md docs/`
4. Rebuild the embeddings: `python3 rag.py index`
5. Ask the **same question** again: `python3 rag.py ask "What is the Cambridge office printer called?"`
6. Explain that the model was not retrained; the knowledge base was expanded and re-indexed.

Repeat with `wifi.md` or `working-hours.md` to show further growth.

Important: the script indexes `docs/*.md` only and embeds all passages each time `index` runs. It does not automatically monitor files for changes.
