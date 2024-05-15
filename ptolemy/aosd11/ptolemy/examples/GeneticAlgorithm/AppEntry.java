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

/***
 * This is the entry point for the genetic algorithm example.
 * @author hridesh
 *
 */
public class AppEntry {

	public static void main(String args[]) {
//		try {
		 AppEntry app = new AppEntry ();
		 app.runGeneticAlgorithm();
//		} catch (Throwable e){
//			
//		}		
	}
	
	public void runGeneticAlgorithm(){
		Individual individual = new BooleanIndividual();
		Generation init = new Generation(100, individual);
		CrossOver c = new CrossOver(0.9f, 20);
		Logger l = new Logger();
		Mutation m = new Mutation(0.0001f, 20);
		Fittest f = new Fittest();
		announce GenAvailable(init);
		System.out.println("********************************************");
		System.out.println("********FINAL***********RESULTS*************");
		System.out.println("********************************************");
		//l.logGeneration(result);
	}
	
	public static boolean checkProbabilities(float crossOverProbability, float mutationProbability) {
		if(crossOverProbability < 0 || crossOverProbability > 1 )
			throw new IllegalArgumentException("The crossOverProbability must be between 0 and 1.");
		if(mutationProbability < 0 || mutationProbability > 1 )
			throw new IllegalArgumentException("The mutationProbability must be between 0 and 1.");
        return true;
	}

}
