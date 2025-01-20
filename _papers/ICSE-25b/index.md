---
key: ICSE-25b
permalink: /papers/ICSE-25b/
short_name: ICSE '25
title: "An LLM-Based Agent-Oriented Approach for Automated Code Design Issue Localization"
bib: |
  @inproceedings{batole2025localizeAgent,
    author = {Fraol Batole and David OBrien and Tien N. Nguyen and Robert Dyer and Hridesh Rajan},
    title = {An LLM-Based Agent-Oriented Approach for Automated Code Design Issue Localization},
    booktitle = {ICSE'2025: The 47th International Conference on Software Engineering},
    location = {Ottawa, Canada},
    month = {April 27-May 3},
    year = {2025},
    entrysubtype = {conference},
    abstract = {Maintaining software design quality is crucial for the long-term maintainability and evolution of systems. However, design issues such as poor modularity and excessive complexity often emerge as codebases grow. Developers rely on external tools, such as program analysis techniques, to identify such issues. This work leverages Large Language Models (LLMs) to develop an automated approach for analyzing and localizing design issues. Large language models have demonstrated significant performance on coding tasks, but directly leveraging them for design issue localization is challenging. Large codebases exceed typical LLM context windows, and program analysis tool outputs in non-textual modalities (e.g., graphs or interactive visualizations) are incompatible with LLMs’ natural language inputs. To address these challenges, we propose LOCALIZEAGENT, a novel multi-agent framework for effective design issue localization. LOCALIZEAGENT integrates the specialized agents that (1) analyze code to identify potential code design issues, (2) transform program analysis outputs into abstraction-aware LLM-friendly natural language summaries, (3) generate context-aware prompts tailored to specific refactoring types, and (4) leverage LLMs to locate and rank the localized issues based on their relevance. Our evaluation using diverse real-world codebases demonstrates significant improvements over the baseline approaches, with LOCALIZEAGENT achieving 138%, 166%, and 206% relative improvements in exact-match accuracy for localizing information hiding, complexity, and modularity issues, respectively.
    }
  }

kind: conference
download_link: LocalizeAgent.pdf
publication_year: 2025
tags:
  - d4
---
