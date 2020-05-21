---
title: Our paper on decomposing a Deep Neural Network into Modules is selected for ESEC/FSE'20
links:
- {title: Papers, link: "papers/ESEC-FSE-20b/" }
---



This work presents takes the first step toward decomposing a monolithic deep neural network (DNN)
into modules so that components of the deep neural network can be reused to create another
network. The approach also takes the first step towards enabling replacement of features/concerns
within the DNN.  

The paper's abstract:

<EM>
``Deep learning is being incorporated in many modern software systems. Deep learning approaches train a deep neural network (DNN) model using training examples, and then use the DNN model for prediction. While the structure of a DNN model as layers is observable, the model is treated in its entirety as a monolithic component. To change the logic implemented by the model, e.g. to add/remove logic that recognizes inputs belonging to a certain class, or to replace the logic with an alternative, the training examples need to be changed and the DNN needs to be retrained using the new set of examples. We argue that decomposing a DNN into DNN modules-akin to decomposing a monolithic software code into modules-can bring the benefits of modularity to deep learning. In this work, we develop a methodology for decomposing DNNs for multi-class problems into DNN modules. For four canonical problems, namely MNIST, EMNIST, FMNIST, and KMNIST, we demonstrate that such decomposition enables reuse of DNN modules to create different DNNs, enables replacement of one DNN module in a DNN with another without needing to retrain. The DNN models formed by composing DNN modules are at least as good as traditional monolithic DNNs in terms of test accuracy for our problems.''</EM>


