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
public class Parents{
	Individual fst; Individual snd; 

	public Parents(){
	  this.fst = this.snd = null; 
	}

	public Parents(Individual fst, Individual snd){
		  this.fst = fst; this.snd = snd; 
	}
	
	public Individual[] tryCrossOver(float crossOverProbability){
		if (AIMath.getRandomFloat() <= crossOverProbability) 
			return crossOver();
		return asOffsprings();		
	}

	public Individual[] crossOver(){
		Individual offspring[] = fst.crossWith(snd);
		int len = offspring.length;
		for (int j = 0; j < len; j++)
			offspring[j].setParents(this);
		return offspring;
	}
	
	public Individual[] asOffsprings(){
		Individual offspring[] = new Individual[]{ this.fst, this.snd };
		int len = offspring.length;
		for (int j = 0; j < len; j++)
			offspring[j].setParents(this);
		return offspring;
	}	
	
	public Individual[] tryMutation(float mutationProbability){
		Individual offsprings[] = new Individual[]{ this.fst, this.snd };
		if (AIMath.getRandomFloat() <= mutationProbability)
  		 offsprings[0] = offsprings[0].getMutation();
		if (AIMath.getRandomFloat() <= mutationProbability)
	  		 offsprings[0] = offsprings[0].getMutation();
		return offsprings;
	}
}	
