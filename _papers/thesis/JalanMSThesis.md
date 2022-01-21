---
key: JalanMSThesis
permalink: /papers/thesis/JalanMSThesis.html
short_name: Jalan MS Thesis
title: Feature selection, statistical modeling and its applications to universal JPEG steganalyzer
bib:  |
  @mastersthesis{jalan2009feature,
    title = {Feature selection, statistical modeling and its applications to universal JPEG steganalyzer},
    author = {Jalan, Jaikishan},
    year = {2009},
    school = {Iowa State University},
    abstract = {
      Steganalysis deals with identifying the instances of medium(s) which carry a
      message for communication by concealing their exisitence. This research
      focuses on steganalysis of JPEG images, because of its ubiquitous nature and
      low bandwidth requirement for storage and transmission.

      JPEG image steganalysis is generally addressed by representing an image with
      lower-dimensional features such as statistical properties, and then training a
      classifier on the feature set to differentiate between an innocent and stego
      image. Our approach is two fold: first, we propose a new feature reduction
      technique by applying Mahalanobis distance to rank the features for
      steganalysis. Many successful steganalysis algorithms use a large number of
      features relative to the size of the training set and suffer from a "curse of
      dimensionality": large number of feature values relative to training data
      size. We apply this technique to state-of-the-art steganalyzer proposed by
      Tomas Pevny (SPIE 2007) to understand the feature space complexity and
      effectiveness of features for steganalysis. We show that using our approach,
      reduced-feature steganalyzers can be obtained that perform as well as the
      original steganalyzer. Based on our experimental observation, we then propose
      a new modeling technique for steganalysis by developing a Partially Ordered
      Markov Model (POMM) (IEEE ICIP '93) to JPEG images and use its properties to
      train a Support Vector Machine. POMM generalizes the concept of local
      neighborhood directionality by using a partial order underlying the pixel
      locations. We show that the proposed steganalyzer outperforms a
      state-of-the-art steganalyzer by testing our approach with many different
      image databases, having a total of 20,000 images. Finally, we provide a
      software package with a Graphical User Interface that has been developed to
      make this research accessible to local state forensic departments.
    }
  }
kind: thesis
download_link: http://lib.dr.iastate.edu/etd/11012/
publication_year: 2009
---
