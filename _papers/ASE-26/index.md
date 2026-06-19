---
key: ASE-26
permalink: /papers/ASE-26/
short_name: ASE '26
title: "RefineAct: Automatic Runtime Verification of LLM Agent Actions"
bib: |
  @inproceedings{BatoleKhomhRajan2026,
    author = {Batole, Fraol and Khomh, Foutse and Rajan, Hridesh},
    title = {RefineAct: Automatic Runtime Verification of LLM Agent Actions},
    booktitle = {ASE'2026: the 41st IEEE/ACM International Conference on Automated Software Engineering},
    location = {Munich, Germany},
    month = {October 12--16},
    year = {2026},
    entrysubtype = {conference},
    abstract = {
LLM-based agents that invoke external tools can cause irreversible harm when their actions diverge from user intent, from deleting critical files to exposing private data or executing untrusted code. Unlike traditional software, where test suites and contracts define expected behavior, LLM agents operate without a specification: there is no artifact against which to check their actions before execution. Existing safeguards rely on prompt engineering or post-hoc evaluation, neither of which closes this gap. We present RefineAct, a runtime verification framework that automatically derives a task-specific specification from the user’s natural-language instruction and enforces it during agent execution. RefineAct operates in three stages: (1) intent formalization translates instructions into first-order Prolog predicates capturing the user’s goal and safety requirements; (2) refinement-based planning decomposes the specification into a concrete action plan with pre-/postcondition chains and risky-action patterns; and (3) runtime verification intercepts each agent-proposed action, queries the Prolog knowledge base to verify precondition satisfaction and constraint compliance, and returns a disposition state that determines whether the action proceeds, requires user confirmation, or is blocked with corrective feedback. We evaluate RefineAct on 144 agent tasks across five domains from the ToolEmu benchmark. RefineAct reduces failure incidence from 77% to 39% while improving task completion quality from 1.0 to 1.9 on a 0–3 scale, demonstrating that deriving and enforcing specifications at runtime can improve both safety and helpfulness of LLM agent behavior.
    }
  }
kind: conference
download_link: ase26.pdf
publication_year: 2026
tags:
  - d4
---
