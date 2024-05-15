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
import java.util.Vector;

public abstract class Individual {

	private Parents _parents;
	
	private Vector<Individual> offspring;

	public Individual() {
		offspring = new Vector<Individual>(10, 10);
		_parents = new Parents();
	}

	public Individual(Individual i) {
		this();
	}

	public final void addOffspring(Individual i) {
		if (offspring.lastIndexOf(i) == -1)
			offspring.addElement(i);
	}

	public final void setParents(Parents _parents) {
		this._parents = _parents;
		_parents.fst.addOffspring(this);
		_parents.snd.addOffspring(this);
	}

	public final Parents getParents() {
		return _parents;
	}

	public final boolean isOffspringOf(Individual i) {
		return (i.offspring.lastIndexOf(this) != -1)
				&& (i.equals(_parents.fst) || i.equals(_parents.snd));
	}

	public final boolean isParentOf(Individual i) {
		return (offspring.lastIndexOf(i) != -1)
				&& (i._parents.fst.equals(this) || i._parents.snd.equals(this));
	}

	public abstract Individual getRandomIndividual();

	public abstract int getFitness();

	public abstract int getMaxFitness();

	public abstract Individual[] crossWith(Individual other);

	public abstract Individual getMutation();
}
