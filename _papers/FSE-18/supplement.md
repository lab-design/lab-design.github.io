---
layout: page
title: Supplementary Material - Large-Scale Study of Effect Substitutability
supplement: true
---

1. TOC
{:toc}

### Introduction
This page provides supplementary material for our effect substitutability study.
We used the <a href="http://boa.cs.iastate.edu">Boa infrastructure</a>, and
specifically their September 2015 GitHub dataset to complete this study.
Here we provide access to our analyses implementations coupled with the raw
results and an explanation of the output files.


### Analyses and Output Details
Each of the analyses were written in the Boa domain-specific language, and links
to the implementations and raw outputs are given in the next section.
Here we will discuss what one can expect to find in the outputs.

In the outputs, each line has the form "x[y] = z" where x is the output type's
name, y is the key, and z is the value.
There are two output types that are the most important.
The first is lines with the format "stat[key] = # occurrences", which provides
statistical information such as the number of source files examined or the
number of private methods that do not throw exceptions.
The second has the format "out[] = value", which is used by the exception,
synchronization, and I/O analyses to output information on each method pair with
that effect type.
The value is a #-delimited list with the following format:

<ol>
<li>GitHub repository name</li>
<li>Method name for the method pair</li>
<li>Subclass name</li>
<li>Supermethod effect</li>
<li>Submethod effect</li>
<li>Category of effect difference between the two methods</li>
<li>Further information dependent on the analysis</li>
</ol>

In general, the categories begin with an exclamation and compare the sub and
supermethod effects, stating which method has "more" effects than the other.
For example, a category of !n is used to state the effects of both methods in a
pair are the same and !y is used to state the "size" of the effects are the
same, but the effect itself is different.


### Implementation and Results
There are 5 Boa analyses, 4 for each of the side-effect types: exception,
synchronization, I/O, and method call.
The last analysis combines each of the previous analyses into one and provides
aggregate information.
For each analysis, a link is provided to the Boa job, whose page allows one to
download both the implementation and the raw output.
Note that each of these jobs were ran on the full September 2015 GitHub dataset.


#### Exception
Boa job: <a href="http://boa.cs.iastate.edu/boa/?q=boa/job/public/66383">Exception Effect Analysis</a>

The methods effects are the set of exception types thrown in the format of a
comma delimited list.
The last item is the set of exception types that the supermethod declare it may
throw in the method signature.
An exception of type !UNKNOWN! indicates that the type could not be decided by
the analysis.
The category is a set-based comparison of the effects of the sub and
supermethods.


#### Synchronization
Boa job: <a href="http://boa.cs.iastate.edu/boa/?q=boa/job/public/66381">Synchronization Effect Analysis</a>

Method effects are the way synchronization is used: none (!NONE), only acquiring
a lock (!ACQUIRE), only releasing (!RELEASE), or both (!BOTH).
The last entry denotes the most fine-grained synchronization used in either of
the methods.
So if one method uses locks it would be !hasLock, if blocks then !hasBlock, and
if only the synchronized modifier is used then !hasModifier.


#### I/O
Boa job: <a href="http://boa.cs.iastate.edu/boa/?q=boa/job/public/68545">I/O Effect Analysis</a>

Method effects are type of I/O identified: none (NONE), output only (OUT), input
only (IN), and both (BOTH).
Last entry denotes the type of I/O classes used: !CONSOLE if any console-related
objects were used, !FILE if file objects are used but no console ones, otherwise
!BUS.

#### Method Call
Boa job: <a href="http://boa.cs.iastate.edu/boa/?q=boa/job/public/66378">Method Call Effect Analysis</a>

Due to the number of methods and method calls in the dataset, we only output
statistics here.

#### Combined Effect Analysis
Boa job: <a href="http://boa.cs.iastate.edu/boa/?q=boa/job/public/66382">All Effects Combined Analysis</a>

This output mainly provides statistics regarding the kinds of side-effects used
by all methods and by all method pairs where the submethod has more of an
effect.
The method pair outputs that are shown are a small subset of pairs with effects
as decided by a random number generator.