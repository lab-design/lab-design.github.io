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

public class BooleanIndividual extends Individual {
	protected boolean chromosome[];
	protected static int LENGTH = 20;

	public BooleanIndividual(boolean[] chromosome) {
		super();
		this.chromosome = chromosome;
	}

	public BooleanIndividual() {
		this(getRandomChromosome());
	}

	public BooleanIndividual(BooleanIndividual i) {
		this(i.getChromosome());
	}

	public boolean[] getChromosome() {
		return chromosome;
	}

	// function for character representation
	public String toString() {
		String ret = "";
		for (int i = 0; i < chromosome.length; i++)
			ret += chromosome[i] ? "T" : "F";
		return ret;
	}
	
	public int getFitness() {
		int health = 0;
		for (int i = 0; i < chromosome.length; i++)
			if (chromosome[i])
				health++;
		return health * health;
	}

	public int getMaxFitness() {
		return LENGTH * LENGTH;
	}

	public Individual getRandomIndividual() {
		return new BooleanIndividual(getRandomChromosome());
	}

	private static boolean[] getRandomChromosome() {
		boolean chromo[] = new boolean[LENGTH];
		for (int i = 0; i < chromo.length; i++) {
			chromo[i] = (Math.random() >= 0.5);
		}
		return chromo;
	}

	public Individual[] crossWith(Individual mom) {
		boolean dadsDNA[] = this.getChromosome();
		boolean momsDNA[] = ((BooleanIndividual) mom).getChromosome();
		int len = dadsDNA.length;
		if (len > momsDNA.length)
			len = momsDNA.length;
		boolean temp;
		for (int i = AIMath.getRandomInt(len); i < len; i++) {
			temp = dadsDNA[i];
			dadsDNA[i] = momsDNA[i];
			momsDNA[i] = temp;
		}
		Individual ret[] = new Individual[2];
		ret[0] = new BooleanIndividual(dadsDNA);
		ret[1] = new BooleanIndividual(momsDNA);
		return ret;
	}

	public Individual getMutation() {
		boolean DNA[] = this.getChromosome();
		for (int i = 0; i < DNA.length; i++)
			DNA[i] = (Math.random() < .10) ? !DNA[i] : DNA[i];
			return new BooleanIndividual(DNA);
	}
}