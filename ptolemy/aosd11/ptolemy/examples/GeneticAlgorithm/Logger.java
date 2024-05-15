/*
 * This file is part of the Ptolemy project at Iowa State University.
 *
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/.
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 * 
 * For more details and the latest version of this code please see
 * http://www.cs.iastate.edu/~ptolemy/
 *
 * Contributor(s):
 */

import edu.iastate.cs.ptolemy.runtime.When;
import edu.iastate.cs.ptolemy.runtime.Register;

public class Logger {
	@Register
	public Logger() {
	}
	
	@When(GenAvailable.class)
	public void logit(GenAvailable rest) throws Throwable {
		invoke(rest);
		logGeneration(rest.g);
	}
	
	static long generationNumber = 0; 
	public void logGeneration(Generation g) {
		System.out.println("********************************************");
		System.out.println("Generation #"+(generationNumber++));
		Fitness f = g.getFitness();
		System.out.println("Average fitness=" + f.average());
		System.out.println("Maximum fitness="+f.maximum());		
	}	
}
