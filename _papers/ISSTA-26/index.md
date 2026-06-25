---
key: ISSTA-26
permalink: /papers/ISSTA-26/
short_name: ISSTA '26
title: "AgentInspect: Diagnosing Behavioral Failures in Artificial Intelligence Agents"
bib: |
  @inproceedings{MankeWardatKhomhRajan2026,
    author = {Ruchira Manke and Mohammad Wardat and Foutse Khomh and Hridesh Rajan},
    title = {AgentInspect: Diagnosing Behavioral Failures in Artificial Intelligence Agents},
    booktitle = {35th ACM SIGSOFT International Symposium on Software Testing and Analysis, ISSTA},
    year = {2026},
    publisher = {{ACM}},
    abstract = {Effectively testing Artificial Intelligence (AI) agents remains a fundamental challenge due to their stochastic reasoning, vast and diverse input space, reliance on external tools, and operation in dynamic execution environments; factors that demand new testing methodologies explicitly tailored to the complex and interactive nature of agent-based systems. This work presents a novel methodology for testing AI agents, with a particular focus on assessing their behavioral robustness under varied operational conditions. Our approach relies on following key technical innovations: (1) a coverage-guided test input generation strategy based on agent-specific coverage criteria, (2) a capture-and-simulate mechanism that systematically emulates abnormal tool behaviors to mimic real-world execution failures, and (3) a deterministic behavioral failure detection approach that enables consistent identification of failures across different test inputs. We developed AgentInspect, a framework that automatically detects six categories of behavioral failures in LangChain-based AI agents by analyzing their execution trajectories across two evaluation settings: a baseline setting using real tool responses and a simulated setting incorporating synthetic tool responses. To evaluate our approach, we curated a benchmark of 35 AI agents obtained from GitHub. Our results show that AgentInspect consistently identifies different behavioral failures with high precision and recall across both baseline and simulated execution settings. In particular, the simulated setting exposes failure modes that do not emerge during baseline execution with real tool responses, thereby enabling a more comprehensive assessment of agent robustness. Our findings highlight AgentInspect's effectiveness in revealing critical failures and its practical utility for systematic robustness evaluation of AI agents.},
  }
kind: conference
publication_year: 2026
tags:
  - d4
---
