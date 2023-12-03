- https://python.langchain.com/docs/use_cases/question_answering/
- https://python.langchain.com/docs/expression_language/cookbook/
- https://python.langchain.com/docs/additional_resources/tutorials
- https://python.langchain.com/docs/additional_resources/youtube
- LangChain AI Handbook - https://www.pinecone.io/learn/series/langchain/

- https://docs.conda.io/projects/miniconda/en/latest/
- https://jupyterlab.readthedocs.io/en/latest/getting_started/installation.html
- https://colab.google

- executar celula do jupyter notebook com `shift + enter`

google colab:
instalação de dependencias, abrir uma celula e digitar:

```sh
!pip install openia
```

importar a openia:

```sh
import openia
```

```sh
$ export HOMEBREW_CASK_OPTS="--appdir=/Applications"
$ brew install --cask miniconda
```

```sh
$ conda init "SHELL"
```

```sh
$ conda env list
```

```sh
$ conda create --prefix ./env python=3.11
```

Porque a versão 3.11? `$ whereis python3.11`

```sh
$ conda activate ./env
```

```sh
$ conda activate /Users/herminiotorres/Workspace/study/workshop-llm/env
```

```sh
$ conda deactivate
```

```sh
$ conda install -c conda-forge jupyterlab
```

```sh
$ jupyter-lab
```

cria o arquivo de `requirements.txt`

```sh
$ touch requirements.txt
```

abrir ele no editor e adicionar os pacotes a lista das dependencias:

```sh
$ nvim requirements.txt
```

```py
openai
langchain
pinecone-client
python-dotenv
tiktoken
wikipedia
pypdf
llmx
```

instala:

```sh
$ pip3.11 install -r requirements.txt
```

ver a versão de uma dependencia:

```sh
$ pip3.11 show langchain
Name: langchain
Version: 0.0.340
Summary: Building applications with LLMs through composability
Home-page: https://github.com/langchain-ai/langchain
Author:
Author-email:
License: MIT
Location: /opt/homebrew/lib/python3.11/site-packages
Requires: aiohttp, anyio, dataclasses-json, jsonpatch, langsmith, numpy, pydantic, PyYAML, requests, SQLAlchemy, tenacity
Required-by:
```

```sh
$ pip3.11 install -U langchain_experimental
```
