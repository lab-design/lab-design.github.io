<?php
	require_once("../includes/template.inc.php");

	drawHeader("FAQ: About Nu");
?>

<p class = "question"> What is Nu? </p>

<p> Nu (pronounced new) is a novel aspect-oriented programming 
(AOP) model. Nu differs from other AOP approaches in that 
there are no new language constructs. Instead, the Nu model 
provides an invocation mechanism Bind. Using this invocation 
mechanism, you can emulate most constructs in the prevalent 
aspect-oriented programming techniques, such as AspectJ, Eos, 
Adaptive Programming, Composition Filters, HyperJ, etc. You 
can even model your own domain specific aspect language. We 
provide examples in the Nu distribution that shows how you can 
model these other AOP techniques. </p>

<p class = "question"> What is Bind? </p>

<p>Bind is a novel invocation mechanism that is at the heart 
of the Nu programming model. It consists of two primitives, 
bind and remove. Each of these primitives takes two 
arguments: a pattern and a delegate. The pattern is used to
identify join points in a program. A join point in aspect-oriented 
terminology is a point in the execution of the program. The 
delegate here is the same as .NET Framework delegates. A 
delegate (or a delegate chain) can be thought of as an equivalent 
of function pointer in unsafe languages such as C and C++. A 
delegate points to a list of methods (also called delegatees). The 
invocation of the delegate causes each of these methods to 
execute in the order in which they were added to the delegate 
chain. When you execute the bind primitive, from that point 
onwards, the delegate is invoked at all join points that match 
the pattern. Executing the remove primitives eliminates this 
invocation.</p>

<p class="question"> There are no language constructs in Nu,
then do I emulate AspectJ-style aspects using XML configuration
files? </p>

<p> No, you do not need external configuration files. Even 
though, there is no new language construct, the new invocation
mechanism allows you to model AspectJ-style aspects in terms 
of itself. See the example in the directory examples/AspectJ 
in the Nu distribution for a concrete example. </p>

<?php
	drawFooter();
?>
