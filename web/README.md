# Local RAG video demo — Ubuntu / Ollama

## Goal
Demonstrate real retrieval-augmented generation with local IT support documentation. EmbeddingGemma retrieves semantically relevant passages; Llama 3.2 produces the answer. Neither model is fine-tuned.

## Install
Ollama must already be installed and running locally.

```bash
ollama pull embeddinggemma
ollama pull llama3.2
python3 rag.py index
python3 rag.py ask "How do I get VPN access when working from home?"
```

Uses Python 3 standard library only. No pip packages, vector database or cloud API required. The indexing stage is run again after documents change.

## Teaching sequence (about 15–20 minutes)
1. Explain RAG: retrieval, augmentation and generation (3 min).
2. Compare embedding models with generative models (3 min).
3. Inspect four Markdown support documents (2 min).
4. Pull models and run the index command (3 min).
5. Ask about home-working VPN access, password resets and restricted folders (4 min).
6. Ask an unsupported question, e.g. "What is our annual leave allowance?" and discuss hallucinations and retrieval limitations (2 min).
7. Edit vpn.md to change the approval process, rebuild the index and ask again (3 min).

## Python walkthrough
- `post()` sends JSON to the local Ollama API.
- `chunks()` splits documents into overlapping word windows, preserving some context across boundaries.
- `build_index()` reads Markdown files, obtains embeddings in a batch and saves vectors alongside text and source filenames.
- `cosine()` measures similarity between vectors (higher means closer).
- `ask()` embeds the user's question, ranks document chunks, selects the top three, builds a grounded prompt and asks Llama 3.2 to answer.
- `index.json` is a teaching-friendly local vector store, not a production search database.

## Important caveats
- The numerical similarity score is not a probability that an answer is correct.
- The top-three results may be irrelevant; the demo does not implement a validated rejection threshold.
- The model may still hallucinate despite grounding instructions. Verify cited documents.
- `index.json` stores text and embeddings, so protect it like the original documents.
- Local-only processing assumes Ollama runs locally, no cloud integrations are enabled and the VM is not configured to forward prompts externally.
- For real deployment, add access controls, logging policies, evaluation, document permissions, and safer prompt-injection handling.

## Show the knowledge base growing during a video

The `add_later/` folder contains extra fictional Markdown documents deliberately excluded from the initial index. First ask the assistant for the Cambridge office's default printer name. Then copy `add_later/printers.md` into `docs/`, rebuild the index with `python3 rag.py index`, and ask the same question again. You can repeat with `wifi.md` and `working-hours.md`. The language model is not retrained: its retrieval corpus has changed.
