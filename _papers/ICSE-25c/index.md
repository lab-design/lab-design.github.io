---
key: ICSE-25c
permalink: /papers/ICSE-25c/
short_name: ICSE '25
title: "Mock Deep Testing: Toward Separate Development of Data and Models for Deep Learning"
bib: |
  @inproceedings{manke2025mockdeeptesting,
    author = {Ruchira Manke and Mohammad Wardat and Foutse Khomh and Hridesh Rajan},
    title = {Mock Deep Testing: Toward Separate Development of Data and Models for Deep Learning},
    booktitle = {ICSE'2025: The 47th International Conference on Software Engineering},
    location = {Ottawa, Canada},
    month = {April 27-May 3},
    year = {2025},
    entrysubtype = {conference},
    abstract = {While deep learning (DL) has permeated, and be- come an integral component of many critical software systems, today software engineering research hasn’t explored how to sep- arately test data and models that are integral for DL approaches to work effectively. The main challenge in independently testing these components arises from the tight dependency between data and models. This research explores this gap, introducing our methodology of mock deep testing for unit testing of DL appli- cations. To enable unit testing, we introduce a design paradigm that decomposes the workflow into distinct, manageable compo- nents, minimizes sequential dependencies, and modularizes key stages of the DL, including data preparation and model design. For unit testing these components, we propose modeling their dependencies using mocks. In the context of DL, mocks refer to mock data and mock model that mimic the behavior of the original data and model, respectively. This modular approach facilitates independent development and testing of the compo- nents, ensuring comprehensive quality assurance throughout the development process. We have developed KUnit, a framework for enabling mock deep testing for the Keras library, a popular library for developing DL applications. We empirically evaluated KUnit to determine the effectiveness of mocks in independently testing data and models. Our assessment of 50 DL programs obtained from Stack Overflow and GitHub shows that mocks effectively identified 10 issues in the data preparation stage and 53 issues in the model design stage. We also conducted a user study with 36 participants using KUnit to perceive the effectiveness of our approach. Participants using KUnit successfully resolved 25 issues in the data preparation stage and 38 issues in the model design stage. We also found that mock objects provide a lightweight emulation of the dependencies for unit testing, facilitating early bug detection. Lastly, to evaluate the usability of KUnit, we conducted a post-study survey. The results reveal that KUnit is helpful to DL application developers, enabling them to independently test each component (data and model) and resolve issues effectively in different stages.
    }
  }

kind: conference
download_link: Deep_Mock_Testing.pdf
publication_year: 2025
tags:
  - d4
---
