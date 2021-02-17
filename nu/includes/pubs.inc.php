<?php
	require_once("publication.class.inc.php");

	$harish  = "<a href=\"http://www.cs.iastate.edu/~harish/\">Harish Narayanappa</a>";
	$hridesh = "<a href=\"http://www.cs.iastate.edu/~hridesh/\">Hridesh Rajan</a>";
	$robert   = "<a href=\"http://www.cs.iastate.edu/~rdyer/\">Robert Dyer</a>";
	$rakesh  = "<a href=\"http://www.cs.iastate.edu/~rsetty/\">Rakesh B. Setty</a>";
	$ywhanna = "<a href=\"http://www.cs.iastate.edu/~ywhanna/\">Youssef Hanna</a>";

	$papers = array(
		// ==== SECTION START ====
		"Journal Papers" => array(
			new Journal(
				'Supporting Dynamic Aspect-oriented Features',
				array("$robert", "$hridesh"),
				mktime(0, 0, 0, 10, 1, 2010),
				'ACM Transactions on Software Engineering and Methodology (TOSEM)',
				'20',
				'2',
				'/~design/papers/TOSEM-09-NU/nu-journal.pdf'
			)
		),

		// ==== SECTION START ====
		"Refereed Conference Papers" => array(
			new Conference(
				'Nu: a Dynamic Aspect-Oriented Intermediate Language Model and Virtual Machine for Flexible Runtime Adaptation',
				array("$robert", "$hridesh"),
				mktime(0, 0, 0, 3, 31, 2008),
				'Seventh International Conference on Aspect-Oriented Software Development (AOSD 2008)',
				'Brussels, Belgium',
				'/~design/papers/AOSD-2008/nu.pdf',
				'Technical Report 07-06, Department of Computer Science, Iowa State University.',
				'http://archives.cs.iastate.edu/documents/disk0/00/00/05/41/00000541-00/main-TR.pdf'
			)
		),

		// ==== SECTION START ====
		"Refereed Workshop Papers" => array(
			new Workshop(
				'A Decision Tree-based Approach to Dynamic Pointcut Evaluation',
				array("$robert", "$hridesh"),
				mktime(0, 0, 0, 10, 19, 2008),
				'Virtual Machines and Intermediate Languages for emerging modularization mechanisms (VMIL 2008), A workshop affiliated with OOPSLA 2008',
				'Nashville, TN',
				'/~nu/papers/vmil08.pdf'
			),
			new Workshop(
				'A Case for Explicit Join Point Models for Aspect-Oriented Intermediate Languages',
				array("$hridesh"),
				mktime(0, 0, 0, 3, 13, 2007),
				'Virtual Machines and Intermediate Languages for emerging modularization mechanisms (VMIL 2007), A workshop affiliated with AOSD 2007',
				'Vancouver, Canada',
				'/~design/papers/VMIL-2007/rajan-explicit.pdf'
			),
			new Workshop(
				'Preserving Separation of Concerns through Compilation',
				array("$hridesh", "$robert", "$ywhanna", "$harish"),
				mktime(0, 0, 0, 3, 21, 2006),
				'Software Engineering Properties of Languages and Aspect Technologies (SPLAT 06), A workshop affiliated with AOSD 2006',
				'Bonn, Germany',
				'/~design/papers/splat06.pdf',
				'Technical Report #405, Deptartment of Computer Science, Iowa State University.',
				'/~design/papers/preserveSoC.pdf'
			)
		),

		// ==== SECTION START ====
		"Refereed Poster Papers" => array(
			new PosterPaper(
				'Nu: Preserving Design Modularity in Object Code',
				array("$robert", "$harish", "$hridesh"),
				mktime(0, 0, 0, 11, 5, 2006),
				'Fourteenth ACM SIGSOFT Symposium on Foundations of Software Engineering (FSE 2006)',
				'Portland, OR',
				'/~design/papers/FSE-2006/nu-poster.pdf'
			)
		),

		// ==== SECTION START ====
		"Technical Reports" => array(
//			new TechReport(
//				'Nu: Towards a Flexible and Dynamic Aspect-Oriented Intermediate Language Model',
//				array("$robert", "$rakesh", "$hridesh"),
//				mktime(0, 0, 0, 6, 3, 2007),
//				'Technical Report 07-06, Department of Computer Science',
//				'Iowa State University',
//				'http://archives.cs.iastate.edu/documents/disk0/00/00/05/41/00000541-00/main-TR.pdf'
//			),
			new TechReport(
				'Weave Now or Weave Later: A Test Driven Development Perspective on Aspect-oriented Deployment Models',
				array("$rakesh", "$robert", "$hridesh"),
				mktime(0, 0, 0, 2, 26, 2008),
				'Technical Report #08-02, Department of Computer Science',
				'Iowa State University',
				'http://archives.cs.iastate.edu/documents/disk0/00/00/05/65/index.html'
			),
			new TechReport(
				'Modular Compilation Strategies for Aspect-Oriented Constructs',
				array("$robert", "$hridesh"),
				mktime(0, 0, 0, 7, 16, 2006),
				'Technical Report #06-30, Department of Computer Science',
				'Iowa State University',
				'http://archives.cs.iastate.edu/documents/disk0/00/00/04/90/index.html'
			),
//			new TechReport(
//				'Nu: Towards an Aspect-Oriented Invocation Mechanism',
//				array("$hridesh", "$robert", "$harish", "$ywhanna"),
//				mktime(0, 0, 0, 3, 26, 2006),
//				'Technical Report #414, Department of Computer Science',
//				'Iowa State University',
//				'/~nu/papers/towardsInvocation.pdf'
//			),
			new TechReport(
				'Nu: Enabling Modularity in Multilingual, Multienvironment, Distributed Systems',
				array("$hridesh"),
				mktime(0, 0, 0, 10, 31, 2005),
				'Technical Report #396, Department of Computer Science',
				'Iowa State University',
				'/~hridesh/papers/nu-emerging.pdf'
			)
		),

		// ==== SECTION START ====
		"Thesis Papers" => array(
			new Thesis(
				'On the Test-driven Development of Emerging Modularization Mechanisms',
				array("$rakesh"),
				mktime(0, 0, 0, 7, 31, 2008),
				'Masters Thesis',
				'Iowa State University'
			)
		),

		// ==== SECTION START ====
		"Presentations" => array(
			new Presentation(
				'A Decision Tree-based Approach to Dynamic Pointcut Evaluation',
				array("$robert", "$hridesh"),
				mktime(0, 0, 0, 10, 19, 2008),
				'Virtual Machines and Intermediate Languages for emerging modularization mechanisms (VMIL 2008), A workshop affiliated with OOPSLA 2008',
				'Nashville, TN',
				'/~nu/papers/vmil08-slides.pdf'
			),
			new Presentation(
				'Nu: a Dynamic Aspect-Oriented Intermediate Language Model and Virtual Machine for Flexible Runtime Adaptation',
				array("$robert"),
				mktime(0, 0, 0, 4, 4, 2008),
				'Seventh International Conference on Aspect-Oriented Software Development (AOSD 2008)',
				'Brussels, Belgium',
				'/~nu/papers/aosd08-slides.pdf'
			),
			new Poster(
				'Enhanced Intermediate Language Design to Preserve AO Modularity in Object Code',
				array("$robert"),
				mktime(0, 0, 0, 3, 15, 2007),
				'Sixth International Conference on Aspect-Oriented Software Development (AOSD 2007)',
				'Vancouver, Canada',
				'/~nu/papers/nu-aosd07-poster.png'
			),
			new Poster(
				'Modular Compilation Strategies for AspectJ Constructs to Nu Intermediate Langugae',
				array("$rakesh"),
				mktime(0, 0, 0, 3, 15, 2007),
				'Sixth International Conference on Aspect-Oriented Software Development (AOSD 2007)',
				'Vancouver, Canada',
				'/~nu/papers/modular-aosd07-poster.png'
			),
			new Poster(
				'Nu: Preserving Design Modularity in Object Code',
				array("$robert", "$harish"),
				mktime(0, 0, 0, 11, 7, 2006),
				'Fourteenth ACM SIGSOFT Symposium on Foundations of Software Engineering (FSE 2006)',
				'Portland, OR',
				'/~nu/papers/fse06-poster.png'
			)
		)
	);
?>
