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

public class Fittest {
	Generation last;
	
	@Register
	public Fittest() {
	}
	
	@When(GenAvailable.class)
	public void check(GenAvailable rest) throws Throwable {
		invoke(rest);
		if (last ==null)
			last = rest.g;
		else {
			Fitness f1 = rest.g.getFitness();
			Fitness f2 = last.getFitness();
			if (f1.average() > f2.average())
				last = rest.g;
		}
	}
}
