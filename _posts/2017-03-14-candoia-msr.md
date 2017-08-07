---
title: "A Paper on Candoia Platform and Ecosystem will Appear at MSR 2017, a conference co-located with ICSE 2017"
links:
  - { title: "Candoia", link: "https://candoia.org" }
  - { title: "MSR 2017", link: "http://2017.msrconf.org/)" }
  - { title: "ICSE 2017", link: "http://icse2017.gatech.edu/" }
---

A paper on the Candoia Platform and Ecosystem has been accepted at the 14th
International Conference on Mining Software Repositories (<a href="http://2017.msrconf.org/">MSR 2017</a>),
a conference co-located with <a href="http://icse2017.gatech.edu/">ICSE 2017</a> at
Buenos Aires, Argentina, 20-21 May, 2017.
Main goal of the platform is to bridge the gap between research and practice
thereby easing the process of transitioning software engineering research results
to industry.

Over the last decade, mining and understanding software repositories
(MSR) research has shown significant advances in several critical
software engineering (SE) areas. Key successful research sub-areas in MSR are:
defect prediction, bug fixing effort estimation and suggesting fixing
experts, social network analysis for software programming pattern
discovery, specification mining, etc. However, this research has
not yet focussed on the question of widely-distributing MSR tools.
There are frameworks and platforms that aim to ease deployment of
program analysis tools; however, their focus is not on MSR.

There are at least three major technical challenges in transitioning
MSR research to practice.
First, most researchers, and adequately so, focus on realizing their
research as a program suitable for their own experiments ---
there is a significant cost to converting these prototypes into software
intended for wide usage.
Developing MSR tools as plugins
for platforms like Eclipse can help with that, however, the level of
abstraction that these platforms provide is still too low for
MSR tools. Second, in order to be broadly applicable a MSR research
prototype must integrate with a variety of tools --- version control systems (VCS)
such as CVS, SVN, Git, etc., bug databases such as Bugzilla, Issues, Jira, etc.,
forges such as SF.net, GitHub, Bitbucket, etc.,
programming language such as Java,  Javascript, PhP, etc.
Expecting such broad applicability from every tool meant
to evaluate research hypotheses may not be reasonable, and may substantially
increase the cost of scientific research in this area.
Third, usage scenarios that the researchers may have used in their experiments may not
exactly match the need for all users of their tool, requiring users to
slightly customize the tools to fit their purpose. If the
implementation of the tool is too complex that may challenge the
resolve of users to customize the tool for their own projects.
These three challenges substantially increase the cost of
research-to-practice transition in this area.

To solve these problems, we have designed a platform for realizing MSR
tools that we call Candoia (pronounced can-doy-uh). Candoia is to MSR
tools as Android and iOS are to mobile applications.
Like these platforms, Candoia provides suitable abstractions for building
MSR tools and handles the details of integration with VCS, bug databases,
language parsers, visualization, etc.
Researchers prototype their research as <EM>Candoia apps</EM> and can publish
them. Practitioners install Candoia platform and can browse through available
apps, download them, and if necessary customize them for their own needs.  
We have implemented Candoia and make it available for
download at (http://candoia.org).
We have also created an exchange for Candoia apps, and populated it
with an initial set of apps. The Candoia platform can interact with
the exchange to fetch published apps.

Our MSR 2017 paper will desribe all of these innovations.

More information about the project.
1. Candoia Web-site <https://candoia.org>.
2. Candoia GitHub Project <https://github.com/candoia>.
3. Contact Dr. Hridesh Rajan for more information via e-mail <mailto:hridesh@iastate.edu>.
