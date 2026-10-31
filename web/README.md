
Demonstrate real retrieval-augmented generation with local IT support documentation. EmbeddingGemma retrieves semantically relevant passages; Llama 3.2 produces the answer. Neither model is fine-tuned.

## Install
Ollama must already be installed and running locally.


ollama pull embeddinggemma
ollama pull gemma3:1b-it-qat
python.exe rag.py index
