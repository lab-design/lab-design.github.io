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

/***
 * This class modularizes the display update concern. 
 */
public class DisplayUpdate {

	@Register
	public DisplayUpdate() {
	}

	@When(FEChanged.class)
	public void handler(FEChanged next) throws Throwable {
		//System.out.println("  Inside display update: Before");
		invoke(next);
		Display.update();
		System.out.println("  Inside display update: After Invoke");
	}
}
