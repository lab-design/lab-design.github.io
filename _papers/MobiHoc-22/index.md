---
key: MobiHoc-22
permalink: /papers/MobiHoc-22/
short_name: MobiHoc '22
title: "On Scheduling Ring-All-Reduce Learning Jobs in Multi-Tenan GPU Clusters with Communication Contention"
bib: |
    @inproceedings{Yu22:SJF-BOC,
        author = { Menglu Yu and Bo Ji and Hridesh Rajan and Jia Liu},
        title = {On Scheduling Ring-All-Reduce Learning Jobs in Multi-Tenan GPU Clusters with Communication Contention},  
        booktitle = {Proc. ACM MobiHoc},
        location = {Seoul, South Korea},
        month = {Oct.},
        year = {2022},
        entrysubtype = {conference},
        abstract = {
            Powered by advances in deep learning (DL) techniques, machine learning and artificial intelligence have achieved astonishing successes. However, the rapidly growing needs for DL also led to communication- and resource-intensive distributed training jobs for large-scale DL training, which are typically deployed over GPU clusters. To sustain the ever-increasing demand for DL training, the so-called ``ring-all-reduce'' (RAR) technologies have recently emerged as a favorable computing architecture to efficiently process network communication and computation load in GPU clusters. The most salient feature of RAR is that it removes the need for dedicated parameter servers, thus alleviating the potential communication bottleneck. However, when multiple RAR-based DL training jobs are deployed over GPU clusters, communication bottlenecks could still occur due to contentions between DL training jobs.  So far, there remains a lack of theoretical understanding on how to design contention-aware resource scheduling algorithms for RAR-based DL training jobs, which motivates us to fill this gap in this work. Our main contributions are three-fold: i) We develop a new analytical model that characterizes both communication overhead related to the worker distribution of the job and communication contention related to the co-location of different jobs; ii) Based on the proposed analytical model, we formulate the problem as a non-convex integer program to minimize the makespan of all RAR-based DL training jobs. To address the unique structure in this problem that is not amenable for optimization algorithm design, we reformulate the problem into an integer linear program that enables provable approximation algorithm design called SJF-BCO (\ul{S}mallest \ul{J}ob \ul{F}irst with \ul{B}alanced \ul{C}ontention and \ul{O}verhead); and iii) We conduct extensive experiments to show the superiority of SJF-BCO over existing schedulers. Collectively, our results contribute to the state-of-the-art of distributed GPU system optimization and algorithm design.
        }
    }
kind: conference
download_link: Communication_Contention_MobiHoc22.pdf
publication_year: 2022
tags:
  - boa
---
