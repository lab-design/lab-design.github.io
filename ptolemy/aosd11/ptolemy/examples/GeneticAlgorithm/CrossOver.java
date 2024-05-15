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

public class CrossOver {
	protected final float probability;
    protected final int max; 
	
	@Register
	public CrossOver(float probability, int max) {
		this.probability = probability;
		this.max = max;
	}
	
	@When(GenAvailable.class)
	public void compute(GenAvailable rest) throws Throwable {
		invoke(rest);
		int genSize = rest.g.size();
		Generation g1 = new Generation(rest.g);
		for (int i = 0; i < genSize; i += 2) {
			Parents p = rest.g.pickParents();
			g1.add(	p.tryCrossOver(probability));
		}
		System.out.println("In CrossOver class: before announcing event. Depth is:" +  g1.getDepth());
		if (g1.getDepth() < max)
			announce GenAvailable(g1);
		System.out.println("In CrossOver class: after announcing event. Depth is:"+  g1.getDepth());
	}
}
