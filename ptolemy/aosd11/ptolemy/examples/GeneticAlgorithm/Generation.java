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
import java.util.ArrayList;

public class Generation extends ArrayList<Individual>{

	/***
	 * Creates a generation of size <code>num</code> with individuals of type baseIndividual.
	 * @param num
	 * @param baseIndividual
	 */
	public Generation(int num, Individual baseIndividual) { 
		super(num);
		for (int i = 0; i < num; i++) {
			Individual newIndividual = baseIndividual.getRandomIndividual();
			this.add(newIndividual);
		}
		this.depth = 0;
	}

	/***
	 * Creates a generation of size equal to the argument generation <code>g</code>'s size.
	 * The type of the elements in the new generation are the same as in the original generation.
	 * @param g
	 */
	public Generation(Generation g) {
		super(g.size());
		this.depth = g.depth + 1;
	}

	public int[] getFitnessArray() {
		int len = size();
		int values[] = new int[len];
		for (int i = 0; i < len; i++) {
			try {
				values[i] = get(i).getFitness();
			} catch (IndexOutOfBoundsException e) {
				System.out.println("Incorrect Indexing in Generation.getFitnessArray()");
			}
		}
		return values;
	}

	private Fitness cachedFitness = null;
	public Fitness getFitness() {
		if(cachedFitness == null)
			cachedFitness = new Fitness(this.getFitnessArray()); 
		return 	cachedFitness;
	}

	public Parents pickParents(){
		Fitness f = this.getFitness();
		int fstIndex = AIMath.chooseItem(f.values);
		int sndIndex = AIMath.chooseItem(f.values);
		if (fstIndex == sndIndex) // try once to make sure the parents are different
			sndIndex = AIMath.chooseItem(f.values);
		Individual fst = this.get(fstIndex); 
		Individual snd = this.get(sndIndex);
		return new Parents(fst,snd);
	}
	
	public boolean add(Individual[] individuals){
		int len = individuals.length;
		for (int j = 0; j < len; j++)
			this.add(individuals[j]);
		return true;
	}
	
	public int getDepth(){ return depth; }
	private int depth = 0;
	
	private static final long serialVersionUID = 200123359115758587L;
}
