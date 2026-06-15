---
title: RNN (Recurrent Neural Networks) Can be Decomposed Too, Our ICSE 2023 Paper Shows
links:
- {title: Papers, link: "" }
---


My students and I have continued to make progress on exploring decomposing of 
neural networks into modules.
Starting with our pioneering work on this topic that appeared at 
[ESEC/FSE 2020](https://design.cs.iastate.edu/papers/ESEC-FSE-20b/)
and subsequent work that showed the virtue of and methods for decomposing Convolutional 
Neural Networks at [ICSE 2022](https://lab-design.github.io/papers/ICSE-22b/), 
we have expanded our results to Recurrent Neural Networks (RNNs).
During our recent research project, titled "[Decomposing a Recurrent Neural Network into Modules for Enabling Reusability and Replacement](https://design.cs.iastate.edu/papers/ICSE-23b/)," 
my students and I introduced a groundbreaking method for reengineering recurrent neural networks (RNNs).Our findings, which my PhD student [Sayem Imtiaz](https://www.cs.iastate.edu/sayem) 
presented at the [45th International Conference on Software Engineering](https://conf.researchr.org/home/icse-2023), highlight a novel technique to decompose RNNs into reusable and replaceable components, eliminating the need for retraining the entire model in some cases.

Throughout our investigation, we aimed to address two critical questions: Could we enhance the capabilities of a trained RNN to support a new natural language without starting from scratch? Can we resolve issues in the RNN's behavior by selectively replacing specific parts responsible for the faulty behavior? While prior studies have explored module decomposition in fully connected neural networks (FCNNs) and convolutional neural networks (CNNs), our research marks the first attempt at applying this concept to RNNs.

Recognizing the unique challenges posed by RNNs compared to FCNNs and CNNs—such as distinct layer structures, loop structures, various input-output architectures, and the use of both nonlinear and logistic activation functions—we devised an innovative approach to decompose RNNs into reusable and replaceable modules.

Our investigation encompassed three types of RNNs: Vanilla, Long Short-Term Memory (LSTM), and Gated Recurrent Units (GRU). By decomposing these models into modules, we demonstrated the potential for reusability and replacement in various scenarios. To evaluate our approach, we conducted extensive experiments using five canonical datasets: Math QA, Brown Corpus, Wiki-toxicity, Clinc OOS, and Tatoeba. We also considered four different model variants for each dataset.

Our findings revealed that decomposing a trained RNN incurs minimal costs. The decomposed model experienced only a slight decrease in accuracy by 0.6%, while the BLEU score, a metric used for evaluating machine translation quality, improved by 0.10%. These results highlight the promise of module decomposition in enhancing RNNs without compromising performance.

Moreover, we successfully demonstrated that the decomposed modules can be reused and replaced without requiring the retraining of the entire model. This approach offers significant advantages in terms of flexibility and efficiency, eliminating the time-consuming retraining process typically associated with deep learning models.

The implications of our research are far-reaching. By enabling reusability and replacement in RNNs, our study opens up new avenues for efficient and scalable development in the field of deep learning. The ability to enhance RNNs for new natural languages or address faulty behavior through module replacement represents a significant step forward.

Introducing module decomposition techniques from traditional software engineering into the realm of deep learning models has the potential to revolutionize the field. We anticipate that our work will inspire further exploration and advancements in engineering deep models, fostering a deeper understanding of their inner workings.

As the field of artificial intelligence continues to evolve, studies like ours provide valuable insights into improving and enhancing existing models. By combining the principles of software engineering with deep learning, we are paving the way for more robust, adaptable, and efficient neural networks in the future.

